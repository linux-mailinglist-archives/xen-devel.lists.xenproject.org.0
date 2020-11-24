Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0222C2E10
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 18:10:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36631.68614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khbpd-0006Mz-Py; Tue, 24 Nov 2020 17:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36631.68614; Tue, 24 Nov 2020 17:10:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khbpd-0006Ma-Mf; Tue, 24 Nov 2020 17:10:21 +0000
Received: by outflank-mailman (input) for mailman id 36631;
 Tue, 24 Nov 2020 17:10:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tuHM=E6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1khbpc-0006MV-LL
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:10:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09fd3226-0a6f-488c-a0b4-afe7658f3919;
 Tue, 24 Nov 2020 17:10:18 +0000 (UTC)
Received: from DU2PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:10:231::35)
 by AM0PR08MB4003.eurprd08.prod.outlook.com (2603:10a6:208:12d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Tue, 24 Nov
 2020 17:10:16 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::a5) by DU2PR04CA0150.outlook.office365.com
 (2603:10a6:10:231::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 17:10:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 17:10:15 +0000
Received: ("Tessian outbound d6c201accd3c:v71");
 Tue, 24 Nov 2020 17:10:15 +0000
Received: from 9b72420e912d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6505AB7C-E5F9-4D8C-96E0-EC17046061DB.1; 
 Tue, 24 Nov 2020 17:10:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b72420e912d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Nov 2020 17:10:09 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4821.eurprd08.prod.outlook.com (2603:10a6:10:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Tue, 24 Nov
 2020 17:10:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 17:10:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tuHM=E6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1khbpc-0006MV-LL
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 17:10:20 +0000
X-Inumbo-ID: 09fd3226-0a6f-488c-a0b4-afe7658f3919
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.70])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 09fd3226-0a6f-488c-a0b4-afe7658f3919;
	Tue, 24 Nov 2020 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsPdk1yx+SbUX7HP1AfNtmsQZPPkC07SXBqWKIiwM/o=;
 b=hP5ih48hwpzx+OLP77BTPxMEqwtcIKoK1/ftnpXUOvO345hQijQDdif2CYNyUFWIAcwvK/5/dT3jCwVJeZR98owAxYNREKpRF80L7K7XjWrMfdFkk5A6WN0bcfk4SamF62COn0L3ww2BPCAr64SClSAG9Y64RtfPK3iCSXkqBGE=
Received: from DU2PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:10:231::35)
 by AM0PR08MB4003.eurprd08.prod.outlook.com (2603:10a6:208:12d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Tue, 24 Nov
 2020 17:10:16 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::a5) by DU2PR04CA0150.outlook.office365.com
 (2603:10a6:10:231::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 17:10:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 17:10:15 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Tue, 24 Nov 2020 17:10:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a138191909e597b
X-CR-MTA-TID: 64aa7808
Received: from 9b72420e912d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6505AB7C-E5F9-4D8C-96E0-EC17046061DB.1;
	Tue, 24 Nov 2020 17:10:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b72420e912d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 17:10:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNNMNGsikotKj0+HgIAK9j94ssStSFGmmcAq4JIAys1ARalbxRghADdmhqIiiUR2GF6Z14yEZeRlnBkYEumdCAPTZPApOYGEhiBrluJbbADu4IylbTfn9OppnVsDk9ftZRHFYyJ48joR789XrrGCZe/fVMR4BEsBz1lENLFUGgw1GSvoKKfuwjtpUGwPpPm2oxwQVX6hAI9EYkG4r6V/5GwK9bCaWAiXGNJEILDx8NrhvJjgLIq+JzS+ySyBDSe6IKjzLhmdp62RQde3fLqNE/SA/CxNf9v4idSAmlv5r0Q/xtxERUVrzEaXg+IidWqcPoZT/IX9oV3URfmjgO+zxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsPdk1yx+SbUX7HP1AfNtmsQZPPkC07SXBqWKIiwM/o=;
 b=G+0b09ZRBNBISL2DZqXB0zL9UkfqzqXqfHVW/ITVmfQDVYTmcwSYFEft+Ssib1wAHWXLIs9BK23eSCIbmb08pQdm8sLWm3sSBIxvGeNIE62FyDSUe6hurnn5oVDjn5ryeuKSDRgdxG67WB2xN0Zuq3ZNrCvGkIxbQqFWBiy2Ur1hC2oXwQ7i/3KQ+w/2nsgQpuuA86Vvtw68TkEIW7pPGqpk+6kwsYoSGvvyAtecwUDUPGx58/eS2m4QUS1wSs49igjbUhJy6/Kn16XlCH/IY75XeC3PJ9tXGLAeJLmS0A3/s40B/6kuFXHf2/9ZFFRigLEUGO6QHvEuv0uHdEQTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsPdk1yx+SbUX7HP1AfNtmsQZPPkC07SXBqWKIiwM/o=;
 b=hP5ih48hwpzx+OLP77BTPxMEqwtcIKoK1/ftnpXUOvO345hQijQDdif2CYNyUFWIAcwvK/5/dT3jCwVJeZR98owAxYNREKpRF80L7K7XjWrMfdFkk5A6WN0bcfk4SamF62COn0L3ww2BPCAr64SClSAG9Y64RtfPK3iCSXkqBGE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4821.eurprd08.prod.outlook.com (2603:10a6:10:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Tue, 24 Nov
 2020 17:10:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::8567:dffb:80c1:bc0%7]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 17:10:08 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Julien Grall
	<jgrall@amazon.com>
Subject: Re: [PATCH RFC 1/6] xen/arm: mm: Remove special case for CPU0 in
 dump_hyp_walk()
Thread-Topic: [PATCH RFC 1/6] xen/arm: mm: Remove special case for CPU0 in
 dump_hyp_walk()
Thread-Index: AQHWvqdPAjvY1ondm0yRVrKn/nv1bqnXjAKA
Date: Tue, 24 Nov 2020 17:10:07 +0000
Message-ID: <CE16D06B-B592-42C0-B524-525F0FA3B99C@arm.com>
References: <20201119190751.22345-1-julien@xen.org>
 <20201119190751.22345-2-julien@xen.org>
In-Reply-To: <20201119190751.22345-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed2e8682-51a0-426f-0e5d-08d8909bd018
x-ms-traffictypediagnostic: DBBPR08MB4821:|AM0PR08MB4003:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB400360442C2F4C7B2F84203D9DFB0@AM0PR08MB4003.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 odf+7ot3Z40y9KhDEeqEu74/g3XZujb94FRIuCYrUiFfcPPIDUB4xeyo1+zurnbn5Q116fABejG2CDG0x42BjiSCbYuHl7wt1pH6zvnKF8Yk5188CWVr/C1EKH56CqG/imz1iXQmfrOtu1gsD0Q6icNJTXW9MvmmSDSWxvp8xB5CeBZL/egq+C3yc9bIR6Q40UZ/AH3+ZnDAYd7kDAcER0y5F8iI4Z+XXEjB0YQgXMUOMXheWcifO9g1kAcGBRHVb5SJ7NPLOG4BySsYkad2qVefar2wmCQygtomjSgenhfyxUfi1sHeeQpkfvJ6u2EC8r9nb2wOhnlMNaxj3uGEsIGE0BPD16QaY4UwyvZfA+D8bSdiVdYck7TzV3f2ArLjPM2cFFJ+SufZWsFg+NLk1WCNYMJ5ry4Vb7sLmBUQWT2nTDlE6BUV/FfF+TUWZPx8BlW3LVtBMth31D2NGBqXpQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(316002)(2616005)(64756008)(66446008)(8676002)(66946007)(33656002)(66476007)(83380400001)(91956017)(76116006)(478600001)(6512007)(966005)(71200400001)(5660300002)(66556008)(2906002)(36756003)(54906003)(6506007)(8936002)(86362001)(6916009)(186003)(53546011)(4326008)(6486002)(26005)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 BKvRXX5jQdF5AwiUvOX7mWMhFHc2YSBrSgoK/HRLlNRJTias5uQ/hu6SrqByIWaHHJZ7Jh8fuxJCrqNWA5kcckxSyjclI75ZXiK3TCbPBmvWUFUYvBVNfG12xpOXiAbTdS9Zduy3vzSRHjqMuHguwdNFA7eT0Wzwk7OOK0mSlgo251f+QTJQCRbtMGC04YSG242w0ConmvJ63avV6hkMOXm+R4s1DjVNLcQikBaJFRdBQn5dDqJNll4okxuQFkvbQpkcsqOTZxO2L9g/nROd4DgZVIpXgwTvNrak0xAzrN2BMDgwDtx3PzLWZtjWJy5pvWeFnWw/qky6PDhjy664JGT8rDuGft0S0NSrAlI2D5ftl/IfcDnw46/vgEblJF3il5ZyACrgEzBohg/7B4GsPjMSTWfAAjGdcPH9ag0GdWA5QU03ToI9HOnE7atvxUc7hrXzKL/zK/S90OMq18n0xXaAj7Fm2zgZsrT7597bhtpPNuHWgs0KlIqY23V9bqx9s0EIyfdJof2LzninqHH062T0R5DsSQzdtnAcS74+GHorZjK7s/Zw95fwcGb3tf7JoZPlmVF3FIjq91hCRDgXt2gfwinZgPVZgG08dhuRIItn9IPPo3EiwSBg9QqDNvVZm8HE9NsGUHplOJHGo8WdsKG0PLG45JIU4ee+KuaBu4mjeM/X611GRIX84h1J3Pnhn5apJxvh+CJ2b+iIG42Wnk+qAlZQOLo/sRoKQrR4Rv22JuQeZr/8I30R8bn+PFA/TS/yFvYOoQWEAK5dNzoTod4u1snnbA4v4YlUp2Q0utUzjDoiCHdgbyEaRMO7Uu/gXqJdt2m75h9ySuJtxlrB3mGo/7x6wDMpRItP3M0hWcijLhbi8jKaDYMlI/wqDPNSF4jZUD8fmBYsHy/o6qo66Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FC74A9D1C3615B4E891F5479A91E7752@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4821
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e1416fbf-2f2d-475c-9113-08d8909bcb73
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hrgOfK0zSftuXHQFnsKmYNisns5PHBkIsiL5IU+cGSzlVwqDOywtRKtnWpsMsdDV1dxmJhe0G3eohMCGc9Lqt/B9Rf95fWxqxznMm0tDrrkTmw1PVf1uvH7KsMU+Fj63//vVbY+R9W5tZURvHTuZ4Q97xXrq1anK5NFdyWw+eIF3YqSA/Sy7/ZC1F/rnAxOJ1ndhskFEKMIAQg7352/bwaq1wN/I9uchm5b7EIOpjKdxat4JjD/3p36kWKEJIVhIvfgScMXTqnqavIOCNJ5OqdWhqynH5odpwHUyC5IcHBaweIjBZRHjsMpHYfhNTtDQWLbSrwy63q+7cmI7+cKX1UFR0Yzl6e0Ve1Bl6ZEQFh+CsEyqInRFvrSgPwFWYF73fgIbOGMXlh6wjVflZu9xiId9UFJZfDwjxxVIGD59AX3UvMgKW/rb/qCq6BrJgkemfypM5R63e+vT809K0LwSbNAornGu/rkIWHpCCgNWH7j8Mt9XFwLxX8HQYGUKMMnn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39850400004)(46966005)(8676002)(6862004)(107886003)(53546011)(316002)(5660300002)(82310400003)(2616005)(6506007)(966005)(54906003)(70586007)(47076004)(70206006)(82740400003)(6512007)(186003)(4326008)(86362001)(6486002)(26005)(83380400001)(33656002)(336012)(81166007)(8936002)(2906002)(356005)(36756003)(478600001)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 17:10:15.8373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2e8682-51a0-426f-0e5d-08d8909bd018
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4003

Hi Julien,


> On 19 Nov 2020, at 19:07, Julien Grall <julien@xen.org> wrote:
>=20
> From: Stefano Stabellini <sstabellini@kernel.org>
>=20
> There is no need to have a special case for CPU0 when converting the
> page-table virtual address into a physical address. The helper
> virt_to_maddr() is able to translate any address as long as the root
> page-tables is mapped in the virtual address. This is the case for all
> the CPUs at the moment.
>=20
> So use the same BUG_ON() regardless the CPU.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> [julien: Rework the commit message]
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>=20
> I went back through the conversation in [1] regarding the issue when
> loading Xen below 2MB on Arm32. The example provided is wrong because to
> find the physical address, we need to add 'phys_offset', not substract.
>=20
> So I removed the comment regarding the code was buggy.
>=20
> [1] https://marc.info/?l=3Dxen-devel&m=3D157081398022401
> ---
> xen/arch/arm/mm.c | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 9c4b26bf079b..4dd886f7c80d 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -284,10 +284,7 @@ void dump_hyp_walk(vaddr_t addr)
>            "on CPU%d via TTBR 0x%016"PRIx64"\n",
>            addr, smp_processor_id(), ttbr);
>=20
> -    if ( smp_processor_id() =3D=3D 0 )
> -        BUG_ON( (lpae_t *)(unsigned long)(ttbr - phys_offset) !=3D pgtab=
le );
> -    else
> -        BUG_ON( virt_to_maddr(pgtable) !=3D ttbr );
> +    BUG_ON( virt_to_maddr(pgtable) !=3D ttbr );
>     dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
> }
>=20
> --=20
> 2.17.1
>=20


