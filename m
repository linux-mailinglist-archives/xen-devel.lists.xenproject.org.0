Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286BE56BC94
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 17:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363534.594121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pbJ-0006js-7v; Fri, 08 Jul 2022 15:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363534.594121; Fri, 08 Jul 2022 15:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pbJ-0006i0-55; Fri, 08 Jul 2022 15:09:01 +0000
Received: by outflank-mailman (input) for mailman id 363534;
 Fri, 08 Jul 2022 15:08:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LzHR=XN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o9pbH-0006hu-3Q
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 15:08:59 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20088.outbound.protection.outlook.com [40.107.2.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3396857-fecf-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 17:08:56 +0200 (CEST)
Received: from AM6P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::15)
 by AM4PR08MB2657.eurprd08.prod.outlook.com (2603:10a6:205:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 15:08:54 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::13) by AM6P195CA0002.outlook.office365.com
 (2603:10a6:209:81::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 15:08:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 15:08:54 +0000
Received: ("Tessian outbound f9f15f9daab2:v122");
 Fri, 08 Jul 2022 15:08:54 +0000
Received: from b1cfc813e8e8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6D99E7BF-BEDD-41D2-8222-22EAE994763B.1; 
 Fri, 08 Jul 2022 15:08:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b1cfc813e8e8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 15:08:47 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DBBPR08MB6316.eurprd08.prod.outlook.com (2603:10a6:10:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Fri, 8 Jul
 2022 15:08:46 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5417.018; Fri, 8 Jul 2022
 15:08:46 +0000
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
X-Inumbo-ID: e3396857-fecf-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K1aeZsQCgdVnPV9AeUV18yUlfOymJxAb4MjX6UaSJc0DRDfrSO9t+xnm+glxSW2HCcTw4ms8PSibOUWHi+7yktHrgb5CIGXx4r39FGCIMAn5P/v40nEY8MwANIfu4l3vgkeOItsp2+AMkwpCepOo53tyOZxKSqMV3yzL4Bv7uviB698JGxUD+aer2DwMuKmJGyRbJWity2u4ifaXD/P8C2ksaQYq1obktv0mEQJc5KnIdPA89EQzmvJSM4THyem0ANSGGyK06tc3xdJqloi1g6GrT+jGgx/wP64xm+S3jqsWu1iii/qNi8e/BUu7Om3FO3oBNLej2OHMZrDJH9I6gw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aslPFKamwsS2JBQ+nkIatLqI+rrqW7VJW2AJHpFWDSI=;
 b=fFL6LmLBoXzL8injvPKnCDUAlKf50JYsL69n9YTInUeRiv1cChFNpAoVSpsPWhxyjWz+aadI5e89SxAZB/07uf5qjhv1r2+tdVaLHzzGdfpDBbSyzMM1NVq9eJwkKWC/+tn643gi2V3YWmeHVc0PUDUPeF0VjgM2Ti48AOnVgtCKgS9m2SNKXkqQIhkls+uSHQKgDQAPIZWlJNVfx0udYFM1Abc8+RDNvGiGYYoQp0+P4/IyncvTL6hpriCnEDWPGwVLjq6A5s9cscW8S9WaZce4NFWDjIkbzScNHTePNYiKhnMIA3xs28DhqP7pd4WKEyDQHJExwYlaWC2vRXrK6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aslPFKamwsS2JBQ+nkIatLqI+rrqW7VJW2AJHpFWDSI=;
 b=RtgV13OBk6CZr1W/Q8P2a8gsdypyQngIWb2Wa1F7uK0S5O7aw6R8/RMS05VFDrkjlqx4n0aBF3oa5JPVIV163xbOvB7uJtMNoi+PFIJCN/zkMWwSrSMsOT2I744lzXFtuuMo9kC5cgWxGQyo9FXILOyCLB1UwmM7rT1DPgV+y9w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a13394f68c6e6da2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1rUz410CoB9m2+Cj9GxBQ5qv8EJxCPMBPOrkh0spA4Fi8H4wtoX1lqywA2n+aVl3k2+95JhRwXcAcgsiMLviTGcwhKSAUSgn9JZ1CxG5xdWMV7goKsuhkHkwd0GksF02cU+j7qo7eMFzLHB9hJ4U9Y8IgixhlIXYXgccKjBEFGIRbOG3wBMPQtKRD3r0kjRPqUjfGY/22PkIvpm44wV6lgrUA2wzsf+FfA1Pk20buqNpvPXrLKEUlNXtvUpsFuAuNINGe5/U0bCwmHWrdwYqvmjOrEthq/ZN+1//M9fTvNia13y/DMH+ZAIgChePeIDN2Cj8TgxBJP6Emcvhhu/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aslPFKamwsS2JBQ+nkIatLqI+rrqW7VJW2AJHpFWDSI=;
 b=EOE4N6pXegCpf00ZSn1nP3yjlt6HkgDHqcC5T72wawYFz2gNW2YlDcI8fmcy4Pwu+hWVxrU8SQ/FLeGxe5OXZxMaBLppmFy1Ab2u65jktPFmbUpttyRfKwU0xrulIjSjnFnnzAv/n58y62BNZSfZri1BtYzQQAKKK5iIXmOZBA62x/3PmtdUTtDPLLpS0LC11MNt0XazLTOkNz+ltiwOtxMy0ou7moXijtzVxd6H1g2mfmMH01gx/YD/vQk1WV6z1JKaGQic/L7kysVXL4k13376gvA8XFfBAlFGzrDO4pIWUw0Iob2V2cKKk0oHbX8A9vi1VdTSrZPu9HYiHiLaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aslPFKamwsS2JBQ+nkIatLqI+rrqW7VJW2AJHpFWDSI=;
 b=RtgV13OBk6CZr1W/Q8P2a8gsdypyQngIWb2Wa1F7uK0S5O7aw6R8/RMS05VFDrkjlqx4n0aBF3oa5JPVIV163xbOvB7uJtMNoi+PFIJCN/zkMWwSrSMsOT2I744lzXFtuuMo9kC5cgWxGQyo9FXILOyCLB1UwmM7rT1DPgV+y9w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 01/25] tools/console: have one Makefile per
 program/directory
Thread-Topic: [XEN PATCH v3 01/25] tools/console: have one Makefile per
 program/directory
Thread-Index: AQHYh+QzkA5fhHLZ/km46EVDQz/TQa10qXOA
Date: Fri, 8 Jul 2022 15:08:46 +0000
Message-ID: <3BDDC997-5475-42F4-AF9C-D996929555AA@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-2-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-2-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4771e505-3bdc-4ca9-18ab-08da60f3c626
x-ms-traffictypediagnostic:
	DBBPR08MB6316:EE_|VE1EUR03FT046:EE_|AM4PR08MB2657:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /e02x+BS8s+HCJqSL7mhL5SEJUrXc4paS4r//gqxg44OzR12bIkLKAgn2D1zAfEs17JQg0BfPesKjltKCHF/FSnKInQJknu9nRcmWMY6KMRjIDw1GQ3xJ308qHYlfwXReFpmbRBMSYGBULw2jEIo0cLndClU5FsuvLh1jrHaCpG/lubnA/nTXEfBWICu1Xx/GZ+ADbgiOtZuymrLvJpOu8YrwerIr7+H5vXUszY7yu14q9SaOojkKBWp5JqZjyT+SJg93WKsdc4irKCe13uaE3rY/vvOX65jj4fiT6txf+Qzddez/WL0mfku1/t9gM5m+Z3afT/+895/u0x3mlvoI5Fhzasf9P7gDDzwERLHtnpEjadgH8SHd3hXaTwqO9Z1wFLNzsHzrpl9LBGQFTCw4+6yAXPxyx86GYa3IsNzjfwYZ+E9l9aTD2P55Jd+UZ1y7e+PZOMREW++H2swjazhOCc1w96R6ucY0SQd4ds9K/n1z/xWhsH0TYJO+M7/ARGqlMXp2jTBFL9lMBPI9vsDnd/prL4DkPTZsui8Sp6atWuJSPQNp4Td/8xxQHZzaue3MdTxB7SguiDHWce9HqrjILtNaItXWQ48DBuZwkW/uAJSIWvm2U4zIOA6QqWe8lxfALh45acfJrsLod1c1Ky/x+hrMzzIhxtaSSyZZGt1AMy0djHaCv5B2+YykJEsqkCCTMITsyykMBdIjwZUhd48HKGl2k0RyNiL9Ukxc8P764IzAP8L51e4I9Bm0pn8foaidg5RQD9rwvVAn3ZSzAeGSAIekRCqCbRw9Z/pJZi3OqANtRG3Vf8D8zly+na++Y9org31S0/I+lSydMT/i+lCQDCC1Kmo75odEvksawrX6+8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(86362001)(5660300002)(33656002)(54906003)(8936002)(6916009)(71200400001)(122000001)(36756003)(6486002)(316002)(26005)(478600001)(2616005)(6512007)(186003)(66946007)(53546011)(41300700001)(4744005)(6506007)(8676002)(83380400001)(38100700002)(91956017)(66556008)(4326008)(38070700005)(66446008)(2906002)(66476007)(64756008)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <91D7459EA762A14F8CD88A52489298EE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6316
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc913dd5-f863-4a87-a42b-08da60f3c13a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F/eqiEh+Lzh08EPU66btzi6kw/R2C0pm86nldIT79hOld3Q6bso3UgNW5a8lT3uhJjlaiBTZkS4C22x7NQrqLn/m+1hQXXIYogKMhT6AnokKi4yBWvH8ur4M+3FMPCgG57Hb5nq4aUOEgnZpkpMOCne53luuuBUcQVFY7W7wkpuNd+tPmStRkN0Su35AQ8bm1CLwZIdkd94SPbLCcn3GxlWst8A7lAd+7bl1+7DRylclbVlXRdmuqgL1kOVZf3E2J/7vh57ndukOqneuWcOvIk1zYRdRo6AuezdgeTPqIQdz/l1dnXEM6cCopKVBUiiBwBq2FWjju9RPEpki9T4u/uNK1mlmQ/FXMXrqV5uMNvis5OgHSmzzGDSYwiYrK8j6kyR/5VoqIP07/PkSGKf7GxN2FBCjtV2NsYOus68pEqNYoNDfF14QWnAcTNdmHWLYuUEH16yNI+cIEgd6Cwhy8JrlCL00TaPxzyIwAs5Qi9IqXb657DYZfLaVmCp4riYAoSc+qeP4A+6I9yJ2IpATL8Q2OWNN5oHIRNW12qGAaS8dsJBS0h8wjnYmMHMtWcMEyT0D5wqXfV8izG9Chpy3ejtGOsSG8ANoOPLvDV6N8P34Y8fmlbjf47MzEWoJA8YHeKqM4D8Z3Y9+bkmjNljC4vvoPhdFGCpMVAJoIXv+UJOIMmE6iESKsTHAc8awjm29ZKSZgehUHe0Il4LMjw1Fh9xJrlTu6wbC+ijF7tYL7xqFMXYLYB9XDDppx7NLviW5ElOF0qOcWciMS9cLvR7RucmEShr18Am/jyG6pZ5dZ0WCAl5PS1V+zRNi+aHgMtJW
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966006)(40470700004)(36840700001)(70206006)(70586007)(316002)(6862004)(26005)(6512007)(8936002)(8676002)(6486002)(4326008)(5660300002)(2616005)(478600001)(82740400003)(356005)(53546011)(6506007)(86362001)(36860700001)(40460700003)(81166007)(33656002)(47076005)(336012)(2906002)(82310400005)(40480700001)(83380400001)(36756003)(4744005)(54906003)(186003)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 15:08:54.3113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4771e505-3bdc-4ca9-18ab-08da60f3c626
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2657



> On 24 Jun 2022, at 17:03, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Sources of both xenconsoled and xenconsole are already separated into
> different directory and don't share anything in common. Having two
> different Makefile means it's easier to deal with *FLAGS.
>=20
> Some common changes:
> Rename $(BIN) to $(TARGETS), this will be useful later.
> Stop removing *.so *.rpm *.a as they aren't created here.
> Use $(OBJS-y) to list objects.
> Update $(CFLAGS) for the directory rather than a single object.
>=20
> daemon:
>    Remove the need for $(LDLIBS_xenconsoled), use $(LDLIBS) instead.
>    Remove the need for $(CONSOLE_CFLAGS-y) and use $(CFLAGS-y)
> 	instead.
>=20
> client:
>    Remove the unused $(LDLIBS_xenconsole)
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Hi Antony,

It looks good to me.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




