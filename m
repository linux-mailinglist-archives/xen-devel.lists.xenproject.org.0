Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC745953D1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 09:32:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388021.624549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNr3x-0005sG-QP; Tue, 16 Aug 2022 07:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388021.624549; Tue, 16 Aug 2022 07:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNr3x-0005pc-NC; Tue, 16 Aug 2022 07:32:33 +0000
Received: by outflank-mailman (input) for mailman id 388021;
 Tue, 16 Aug 2022 07:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5ti=YU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oNr3v-0005pW-Pf
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 07:32:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95ade6d3-1d35-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 09:32:30 +0200 (CEST)
Received: from AS9PR06CA0768.eurprd06.prod.outlook.com (2603:10a6:20b:484::23)
 by AM0PR08MB5396.eurprd08.prod.outlook.com (2603:10a6:208:182::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 16 Aug
 2022 07:32:28 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::61) by AS9PR06CA0768.outlook.office365.com
 (2603:10a6:20b:484::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.13 via Frontend
 Transport; Tue, 16 Aug 2022 07:32:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Tue, 16 Aug 2022 07:32:27 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Tue, 16 Aug 2022 07:32:27 +0000
Received: from e3c4ff781aa7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 156127E4-A732-46EF-8760-8EC5616CB6A6.1; 
 Tue, 16 Aug 2022 07:32:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3c4ff781aa7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Aug 2022 07:32:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB5433.eurprd08.prod.outlook.com (2603:10a6:10:118::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 16 Aug
 2022 07:32:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.025; Tue, 16 Aug 2022
 07:32:17 +0000
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
X-Inumbo-ID: 95ade6d3-1d35-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Rk4xSC09Zrb1aMzpdqpcSaayhk0ShmzjjhY4GeF53yJESI50FOx910RETu5cC1xisXx2op/0ELOR6La/pOkAMsmVpP47aB2sqvlEX8ggbPGTn8bhpC8A1O99bWioYYjJ7+Av0KS7TYO//fTQNOXq3gAQ0KdRRFxNwJYQJBAQqELg5vcuXuPlczIxaZcLEd2JwmdAiKTFHAEx1oD6l0QO/hmtJyVZmab+JFm3ucoLchjmC9IrXyFJPI+t8vsIpx11jrtnAZ4Zb6CjO5H5xVdNBTKNo3ME8p8ixPttzPOb9L2BE2y6FgA6PuPeMQGDR209cePdzRexaeehT0Dc96PrbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGiGwUcULGuBmNzvtT11Xp+cYSLxlwnLgLpktrDTSEI=;
 b=XwLY9iBUnptkDfQ4Yd2Yg7kDC+nOF9wA7bZSEafl6FwsJULq3ew/BWbXJs5tsV9sVwLdb4JcH/fAg1shiXtqF0iaqgCHGpsK4PFXV5RGz6QbbctKv/0dv+qZHd9w3TRe6V5mksDQCnW5EQ7SaLgQJQRARB7LyZOnUuQ3rSUDo/UPX/1G+60TuPbaYCB/JSdSLKjqQQHX4DQdhF54HM/OA8X5nPMBUEk8I4zUM5aaSwxAXLukr/iT2N57kjTzVcvoknOH+83tE+rCvRI9MfShG2S2nmPf6u0DoMMvZrbaSpv7rmP33zOw0ZKPd8FGehSSu7mNzxKu+VoOJW7uKyqAMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGiGwUcULGuBmNzvtT11Xp+cYSLxlwnLgLpktrDTSEI=;
 b=SHFjr9NpphG6oj8uWF3C6hdWOVLWmaBKe+OXdYBxJu7waW7iMljrhIw8T7Vjk5voymhDU3DXILJDWyGLjmxbr3K1P4zzXr/VBGC3jyLbgLVPhHScWdaLpR6tqIK9eEWGbl6iEn6HpJEVnDMEhVpAIR4JpW+8UB8vR2qxQ9YC8jw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8249ce0e93bf4e9d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmho0aDm3OpAawUnAbrzkk/slyRdF4YgZIcpw1x/1N9aPBQ8JrCWqGk4Sky/rZK7KNB11eDFaQaJAVeCoORouNxvGwuTRl+8HgcPPgAcNZMIT425j1/TdsoyDzkahxLAthDk11GFodlhFtxCIrlDmePRD8xsw4TpR/d1xEdSPTeuSIeRYwiL0gfXvLrN2wJrVPtP6Jgcj96DGndZiqHLaS3hqAl8bzA1W95k4BOuhvCb9nEpV8ZRfFHthBXJ5QbXfe4EvJZNU1QVULCrpK9T0owpT4dhcc661pLH6S+eRwFpffLQFBHacRWUQCObGI928+CTDswxpJFkTpT5UjxFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGiGwUcULGuBmNzvtT11Xp+cYSLxlwnLgLpktrDTSEI=;
 b=gJa+J7No3Ia/5brXcQckvOU6uyXfVuqew5gBoA/ZQO/W9lZVel6EelVpX0jz50V/kfaL82XLUHhoQ/KNVhATAK1iLr86x8aaJk49dFsYqkhn/7xCRRDMn0cNUJu1H3QaNzATrjP8jNNduOaH3+4NqRPZ/+9rBUb+C37rtOU+X6xQRsEggXamb47Ira47M4W23ioGXhgC9GddsyNXRGWQWTRbT3rmIxHnC/S1MGnWdv9zmiLtYZBsSOcMukJsWIUx41cFbbKlhUllrYaxOKh70+miHS4UyVUMzPX7xn1IRgGFR7epMPMkGSWOSj/NKUFQfouvbJQir9yqapx4afuKqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGiGwUcULGuBmNzvtT11Xp+cYSLxlwnLgLpktrDTSEI=;
 b=SHFjr9NpphG6oj8uWF3C6hdWOVLWmaBKe+OXdYBxJu7waW7iMljrhIw8T7Vjk5voymhDU3DXILJDWyGLjmxbr3K1P4zzXr/VBGC3jyLbgLVPhHScWdaLpR6tqIK9eEWGbl6iEn6HpJEVnDMEhVpAIR4JpW+8UB8vR2qxQ9YC8jw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Subject: Re: [PATCH] add SPDX to arch/arm/*.c
Thread-Topic: [PATCH] add SPDX to arch/arm/*.c
Thread-Index: AQHYrq/rjydG2NzoBE6skSmHVGc0Aq2seUCAgAP1yICAALg2AA==
Date: Tue, 16 Aug 2022 07:32:17 +0000
Message-ID: <655CFF12-6B2E-4604-A604-E614F5B3DBDE@arm.com>
References:
 <alpine.DEB.2.22.394.2208121758520.3790@ubuntu-linux-20-04-desktop>
 <a604ce43-2b3f-7ac3-36a1-913a66f036d2@xen.org>
 <alpine.DEB.2.22.394.2208151319370.3790@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2208151319370.3790@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 70c78e0a-92f6-41c7-105c-08da7f597882
x-ms-traffictypediagnostic:
	DB8PR08MB5433:EE_|AM7EUR03FT036:EE_|AM0PR08MB5396:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TLhGH8ytj4xmeUIHpxhpxD4a6qMDL/qSSPxbWYLAZbAGQ50Ld8dNONvDwNKeaIECx5gTW9BQ9LbZirUJ+vNjIP9M565mHJUkYBb1vU/9OW1pMtPvgLaX1Pu97iJMvRgm8xfnp4LtmEe5/s/BTc2twfB5ujIFM3LfyOI9EjP4nTK2QFHkm3o3Fvm+7UzOoXba74wqeWtg3BAkpO150ylUiPvCdW8VVRSbdlPPhtE7ATiby2/KEXobn5FLB/qtc7HlQMp7oJaU4G5PAckRhStus4PSVqin8EHXc2E0jAmyAQKa4tl20DDG6pJujS1eHqaeze3cXvz3wXQkdTAgaARgOw/8l7YUIJdVOYGRltqwkPCdZoMnpiSNMV1NWjfcgreDDFolhSb2/9Vbp5oL5tZiyOI5X13CwoEBGYdKdZO03nr/8iVGmmVPEhFJiW+MCDpKdZHz33RGBzt+ZZ5XUuS/VKm/a4VR11Sp1EuGj8Tm0CnEI6YSvm4Cijs36/Xc1ar4BRcMEv6n2YNT5XqxzRlmd5lgjG1AnxXeDfoxsX1JaWACoDIuUikuQiGSjfqfhDDWTmDiaC8i8rFUxBVcC/pJjBtiRgP5cn80FoKGaiTY4yRa2EjjZv7VRbTH4KAuwa5ZiXge/LefziIgGccEqQNELIfvx25sUYDU1yM17UrYOAkGZRzEMXGbmnZieQyLxb7BPOk8aMqETxFwpHDbZn6U2x1p6u/Anuk0Ca1wd2xSQhTtAI6J9rEpxs0odt8kK3aQ+ON17xM3+3CATW663TtOLHCYs6NqEquztMXVfnviZ/CdLNA0WeBRRhBAD3W2t2onV4IZhDpzXyATVk1Dfz22E4/lbA7/465GyriBy1zJv02DSfwvOehrypKziA5B/K/zAjVectX1hpebgUN26DVBsg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(83380400001)(8936002)(8676002)(54906003)(64756008)(66446008)(66556008)(4326008)(6486002)(66946007)(66476007)(71200400001)(38070700005)(316002)(91956017)(86362001)(76116006)(122000001)(6916009)(38100700002)(478600001)(33656002)(2906002)(6512007)(2616005)(53546011)(36756003)(186003)(5660300002)(26005)(41300700001)(6506007)(2004002)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6EEE747FCD904F43B9C8858A7D41362F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5433
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b81e219-8ada-4492-ba9c-08da7f597232
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1kqyHMxEKe94hgPioGFJAfHvwQ2KwGAoqvt8kz1ttUoUcwg4Ja2yYa01janRDd6bgKw6P0Uo3sgJvBdok+/kCfacb0FCSZwAG33cFyC/rSxPmut0e2LQC+iUTklMkOnd2LqkbjrsnZPAE3IRhCfqSeN7LM9XoP80euwogYE3hLf8fZopd1c/wlmuCgSWpP5qUdykxKWYTwOJqayEeJ9nkrVjOAlqLwhMfJlC+HPgTn6gT71VP2ocvKCQkSoU+sS3MUeZIIRW3arOSpj+8Va/BU5u0xn2s2uRUdLI1O4ZZyixMFiZnHLah8TPDY2Brycw7HUPc0pMWW/j6qLyK8jyP81Akey6HwkxX3Mgmtuwb7+BqgJ9hRwBDnx+FGZium5FWsxVshh1oRFz+i4u5flEZCOo0oSdgN+ixrVCroSDv9woUW1B7uEkaNcH4UZtmw37VGCvNOSrazMOo/yWxaooIuxRrp0582Hora9RJ/nimlbnXLFo6+3qKsvsnByNDIcn3yltmPbfQzfuGXNNiloC6NGcDuy7N8Z05/XbvvvbwVl/ixTd9SRmSo8BMHhocLjGED96exxecvDuiL2OGLV7xFOF/ccxtkwc//0DLsfBIQrjXlw2FzvMWJNVYx36eonOUFr9Y2mMNj0GJ+vetDaaaWT4yBvJWHMqgGxxzgxiw/YPrdNJZZId4TnvwB4465IyqZUgy3hIA26P4Q7hgrfTTlc2BD/06F4Q3Zh3k5PepM0pvctV83LiKxXv3/aats0PIL6KC2KgwFbNo/37t2bf6tHBU6WY7BqQNutJMsflk1tDokZAeKgIPvvyAbI86TJN1x1gIvYQqbvVL8gLcamqOnhpz7SmWBQuFz3r79p3yjQLiUju72UQlbYMqMNYPmLm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(40470700004)(36840700001)(46966006)(186003)(33656002)(36756003)(26005)(356005)(53546011)(86362001)(107886003)(47076005)(6506007)(336012)(81166007)(6512007)(70586007)(2616005)(82740400003)(83380400001)(41300700001)(478600001)(54906003)(6486002)(70206006)(5660300002)(316002)(2906002)(6862004)(8676002)(8936002)(36860700001)(40460700003)(40480700001)(4326008)(82310400005)(2004002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 07:32:27.6171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c78e0a-92f6-41c7-105c-08da7f597882
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5396

Hi Stefano,

> On 15 Aug 2022, at 21:32, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> + Xen maintainers and committers
>=20
>=20
> For context, I wrote a patch to introduce SPDX tags starting from
> arch/arm/*.c.
>=20
> Julien rightfully pointed out that it should be added to our coding
> style. He is right. Also as I was reading his replies, I realized there
> are a couple of minor coding style things to agree as a group first.
> I'll highlighted them here and suggested a proposal. I am happy to go
> with the preference of the majority.
>=20
>=20
> ## comment format // vs /*
>=20
> In this patch I used:
> // SPDX-License-Identifier: GPL-2.0
>=20
> But our comment format is actually /* xxx */. I think it is fair to
> use /* xxx */ as Julien requested:
>=20
> /* SPDX-License-Identifier: GPL-2.0 */
>=20
> Unless there are any concerns, I'll change the patch to /* SPDX... */
>=20

Agree

>=20
> ## blank line after SPDX
>=20
> In this series, I didn't add a blank line after the new SPDX comment, no
> matter if the following line was an #include or another comment. Now I am
> thinking it would be best to add a blank line, as follows:
>=20
> ---
> /* SPDX-License-Identifier: GPL-2.0 */
>=20
> #include <xen/bitops.h>
> ---
>=20
> Or:
>=20
> ---
> /* SPDX-License-Identifier: GPL-2.0 */
>=20
> /*
> * xen/arch/arm/device.c
> *
> ---
>=20
> Let me know if that's OK for you.

Agree.
Makes things clearer I think.

>=20
>=20
> ## Original copyright text
>=20
> As we add the new SDPX tag, It makes sense to remove the older copyright
> text at the top of the file, e.g.:
>=20
> diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> index f03cd943c6..d0a409e4fd 100644
> --- a/xen/arch/arm/alternative.c
> +++ b/xen/arch/arm/alternative.c
> @@ -1,20 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> /*
>  * alternative runtime patching
>  * inspired by the x86 version
>  *
>  * Copyright (C) 2014-2016 ARM Ltd.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>  */
>=20
> #include <xen/init.h>
>=20
>=20
> Now the question is whether we want to keep what's left:
>=20
> /*
> * alternative runtime patching
> * inspired by the x86 version
> *
> * Copyright (C) 2014-2016 ARM Ltd.
> */
>=20
> The Copyright line is not useful and often stale. Also the other comment
> is not very interesting in most cases (I am referring to "alternative
> runtime patching inspired by the x86 version"), although I realize this
> is going to be a on case-by-case basis.
>=20
> My suggestion is to get rid of it all unless useful (in most cases it is
> not useful), leading to:
>=20
>=20
> diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> index f03cd943c6..e363176d1f 100644
> --- a/xen/arch/arm/alternative.c
> +++ b/xen/arch/arm/alternative.c
> @@ -1,21 +1,4 @@
> -/*
> - * alternative runtime patching
> - * inspired by the x86 version
> - *
> - * Copyright (C) 2014-2016 ARM Ltd.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> - */
> +/* SPDX-License-Identifier: GPL-2.0 */
>=20
> #include <xen/init.h>
> #include <xen/types.h>
>=20
>=20
> Do you guys agree?

Removing the copyright would probably require an agreement from the origina=
l implementer.
To prevent troubles and round of questions I would keep the comment and cop=
yright for now.

Cheers
Bertrand

>=20
>=20
> Cheers,
>=20
> Stefano
>=20
>=20
> P.S.
> Julien, I'll reply to your other points separately to avoid confusion.
>=20
>=20
> On Sat, 13 Aug 2022, Julien Grall wrote:
>> Hi Stefano,
>>=20
>> On 13/08/2022 01:59, Stefano Stabellini wrote:
>>> Add SPDX license information to all the *.c files under arch/arm.
>>>=20
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> ---
>>>=20
>>> We need to start from somewhere and I thought arch/arm/*.c would be a
>>> good place to start.
>>=20
>> Thanks for doing it. This will make easier to understand the license in =
each
>> file. There are a couple of places below where the SDPX tag is incorrect=
. How
>> did you figure out the which license to use?
>>=20
>> Also, I think we should consider to add a section about SPDX in our codi=
ng
>> style so new files are using it. So we don't end up with a mix in arch/a=
rm/*.
>>=20
>>>=20
>>> diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
>>> index f03cd943c6..8115f89408 100644
>>> --- a/xen/arch/arm/alternative.c
>>> +++ b/xen/arch/arm/alternative.c
>>> @@ -1,3 +1,4 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>=20
>> Technically, this is a comment. So this should be /* ... */ to follow Xe=
n
>> coding style. Also...
>>=20
>>>  /*
>>>   * alternative runtime patching
>>>   * inspired by the x86 version
>>=20
>> ... this comment contains information about the license. As you add the =
SPDX,
>> the "long" version should be removed. This would also make easier to ver=
ify
>> the SPDX you add match existing license.
>>=20
>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>>> index ec81a45de9..7c986ecb18 100644
>>> --- a/xen/arch/arm/bootfdt.c
>>> +++ b/xen/arch/arm/bootfdt.c
>>> @@ -1,3 +1,4 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>>  /*
>>>   * Early Device Tree
>>>   *
>>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>>> index ae649d16ef..887b5426c7 100644
>>> --- a/xen/arch/arm/cpuerrata.c
>>> +++ b/xen/arch/arm/cpuerrata.c
>>> @@ -1,3 +1,4 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>=20
>> This file had no explicit license. I had a look at the 'git log' and AFA=
ICT
>> this was either new code and came from Linux. So this looks fine to add =
GPLv2
>> here.
>>=20
>>>  #include <xen/cpu.h>
>>>  #include <xen/cpumask.h>
>>>  #include <xen/init.h>
>>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>>> index 62d5e1770a..a6253cb57f 100644
>>> --- a/xen/arch/arm/cpufeature.c
>>> +++ b/xen/arch/arm/cpufeature.c
>>> @@ -1,3 +1,4 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>>  /*
>>>   * Contains CPU feature definitions
>>>   *
>>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>>> index f5f6562600..f586c3d781 100644
>>> --- a/xen/arch/arm/decode.c
>>> +++ b/xen/arch/arm/decode.c
>>> @@ -1,3 +1,4 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>=20
>> This tag doesn't match the license below. It is currently GPLv2+. I don'=
t
>> think you can change it without consulting the author. But if it is, the=
n it
>> should be mentioned in the commit message.
>>=20
>> I remember we discussed in the past that some files were GPLv2+. But I c=
an't
>> remember what was the outcome (I can't find the thread). IIRC GPLv2+ is =
a lot
>> more restrictive than GPLv2 and could prevent some companies to contribu=
te.
>>=20
>> [...]
>>=20
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 2cd481979c..1a2dac95a9 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -1,3 +1,4 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>=20
>> Same here about GPLv2+. Please go through the rest of the files to confi=
rm the
>> license.
>>=20
>> Cheers,
>>=20
>> --=20
>> Julien Grall
>>=20


