Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74236604142
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 12:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425716.673726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol6V8-0000bR-1C; Wed, 19 Oct 2022 10:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425716.673726; Wed, 19 Oct 2022 10:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol6V7-0000Xz-UI; Wed, 19 Oct 2022 10:40:41 +0000
Received: by outflank-mailman (input) for mailman id 425716;
 Wed, 19 Oct 2022 10:40:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GAs9=2U=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ol6V6-0000Xt-QK
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 10:40:40 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2069.outbound.protection.outlook.com [40.107.103.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77c05971-4f9a-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 12:40:39 +0200 (CEST)
Received: from FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::17)
 by AS8PR08MB6040.eurprd08.prod.outlook.com (2603:10a6:20b:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 10:40:34 +0000
Received: from VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::6b) by FR3P281CA0041.outlook.office365.com
 (2603:10a6:d10:4a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.17 via Frontend
 Transport; Wed, 19 Oct 2022 10:40:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT024.mail.protection.outlook.com (100.127.145.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 19 Oct 2022 10:40:33 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Wed, 19 Oct 2022 10:40:32 +0000
Received: from 2573cc200cc8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 439F4132-BFFC-4540-8E28-F76EB1041014.1; 
 Wed, 19 Oct 2022 10:40:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2573cc200cc8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Oct 2022 10:40:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAVPR08MB9403.eurprd08.prod.outlook.com (2603:10a6:102:300::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 10:40:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 10:40:18 +0000
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
X-Inumbo-ID: 77c05971-4f9a-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lHQDD8vXX+DUE+8EuiODXrYO+pfmZra+3ZVuiGKNi7cs8MkWr5liPpMQVM7n2IDPRHFloHcAZUQ+766qWG/IK8goUs1+v+drnZnThaouxuCNnzsXegl7pOZ+tT+I5D26Nsbv1Sov+Q+9FvkqEF+CbsmWW+dQR7KOzW/jUY4FON5xNweWlQbqJ8LEeNqlVFhd14by660qKaFEKQHMFrsfOo36BnbhKstB5nd0pwbnFAVnG6J496I1KuGEoAEYjduBptWRCAi4FFwq6GafsTyR/rWUts9+TJqOFxa/60V/p1L5+MWFBS+6s1CR/IKXR4zGXKQ6CHO94/MtN6XRNIc5fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4/QlHMtpyTlUwuZoPfJwKsx2lbSopfoz02KHRDs3U0=;
 b=PLRkk+JEQxWwOYaR+d+ZF8DN3VttNv5gtgbY1k6LeF7RFj5583BNnMWoiAGxKD49DCVkULAeZw73eQjiUM7r+RhXKCR1Qm0r7H6vFOMXjI2ANH7ebgDs+RiFh4RWFz/DkZ1QmNaGyDgtnOcobXrG1FpqPRyHtptaAtBjfmW5x5TtDngTMeOfGGskig0lFQIM5ACuD4h37DleGdjSyYgK8M4U0VlPFe3AWwsw9joUV72UxoCnHq9v9UmBJMSl9ZREvdxSRSBM3Ugct9iSowGO+LrDws9zrXtyyQtFlJNBUO5BR/v3jNcHfQ93H3gfxfyRXgOBAltIQ1ik+jys1n7H4w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4/QlHMtpyTlUwuZoPfJwKsx2lbSopfoz02KHRDs3U0=;
 b=FrivusEtPhv+A6IjriMaaofapzq1wWOTojabMsGrSBK1JTagzSS7k8FP3Z3VtqDpKmiVuG1b+NXoroYFtaymKKvvjFq4ONksjmLIRCAQX9Fm/lINqS7InyPM1mn2Iwrs4yp1dO/jQ1xtlqlwRt7hyZux0k94KlQoKqH5/9bT8Gw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a545c12548f8a2d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQvp+MBymuylf766lucY1M/kBBKkpc+Tfy35nf46p2v4sTQ37XSSXgxOAe6x3qT6hK9PIsTjWRH3gFwp4O4CdRqyoJK8RPzBnlHks+MAxDy3lm7eFhDO6t9UbZJDEtNjCjNB2OLSzQEwstaYjn563BhlzR5ieAnwYUyzHyKnJIJhcoZlW691kndZcgjHM0P9gpSUbz5rWCBlACXyx0Lp8GUojR4/sxy+wH1Qylm1pSsdE/PnCO8mEaGUQI2W0UaL0D/h9ip1/XZj1g3Kv3Ty6C7iCRp/KZ+g7QmuwFBOjOKXsY85hRO+bY+7s2NO/RNN3KoADh4JtM4+kKCUcAyafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4/QlHMtpyTlUwuZoPfJwKsx2lbSopfoz02KHRDs3U0=;
 b=lE9OqjYtP6ewePGD+x5rNh3HUN4Izb9ask8FCot4ZoQQSl9hlsr2XshCsPRxWjXlljNhJF0/N62wFu/3ma7MShZVLr9hOzDbrG5aMhLZ+sEm6khvGkpwqHn/N8cbm/CrCVXyDb7Mli4TexJijVoL5pGlBxs3s+sJs82SmtQs8+Ykj+kz+4V19RIRYjfioIj6s+NlgF/P5j2Z37qhDMxNG1pHlHfLZc2vV0dkcnxDE0DLWklt2oDZ9VNceBKLnyXYtufRyxlRyUriEwkCiGvR74pS8mIfb0tYeSObR6dAGMirm4gGfgWv2LygChndXv2aCNwNBjKlbuZ7eibStSAJaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4/QlHMtpyTlUwuZoPfJwKsx2lbSopfoz02KHRDs3U0=;
 b=FrivusEtPhv+A6IjriMaaofapzq1wWOTojabMsGrSBK1JTagzSS7k8FP3Z3VtqDpKmiVuG1b+NXoroYFtaymKKvvjFq4ONksjmLIRCAQX9Fm/lINqS7InyPM1mn2Iwrs4yp1dO/jQ1xtlqlwRt7hyZux0k94KlQoKqH5/9bT8Gw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 0/3] Yocto Gitlab CI
Thread-Topic: [PATCH v2 0/3] Yocto Gitlab CI
Thread-Index:
 AQHY3hEMDLhOM5SRDUy6m8XkPQoc/64OWrqAgAP8xgCAAQ3WgIABes6AgACX5oCAABowAA==
Date: Wed, 19 Oct 2022 10:40:18 +0000
Message-ID: <0070D1D1-F579-4E11-8A27-62D3D92DE896@arm.com>
References: <cover.1665561024.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2210141325240.3690179@ubuntu-linux-20-04-desktop>
 <7DE7B34C-F6BD-42D9-83A3-AAA3A6A35B62@arm.com>
 <alpine.DEB.2.22.394.2210171651250.4587@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2210181654170.4587@ubuntu-linux-20-04-desktop>
 <56155bff-6229-05a4-7221-cd6aa5a1de8b@amd.com>
In-Reply-To: <56155bff-6229-05a4-7221-cd6aa5a1de8b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAVPR08MB9403:EE_|VI1EUR03FT024:EE_|AS8PR08MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c2366b-8039-4e60-cf73-08dab1be5a0c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0LI5hPtf0dY2dcXIJgRBACfPwtiWDlnLe8qBlZVlQGq4olCfgr0v1CgvN/cwC/sBUWKjXa7iSYMTEXgZqntyE6GIcyfTzFXD2+qwSKjnXT1VORqjioy0UT48Q3R83bjuPlz6L0iOVpzuliFIbJyaFeW1RuktHkRzMh8nrPOWs0sx58zM8sg7jD+y0DWdn2X9364+0vFGm/8xEyOikYG8pEY02S7ucuFcC9fybU+Daja8KEP9b53/NmDLVn0jqv0nsh1kkB+DD7w+fB0QI6Bym7/0ANkPaU2RWLOu1i57eNZET/R6eizQ3j+2sQLPsrgGllEa+3jA8H3zASp6oBRVqEy66EGKxA+4pCRSWHc9PXaq5STVHbH+L6AAEoLRZaCk4+NloHVoDQGXUyM4KSK2USLS8ThDS4lAtoQXy3ngnaRIRF/jXpPuHJ2olyWxEpsgYJVQp3AE8TJYXhIj4tRh4WLMrimhyWosq0kRTWD8YCtdbpZ4orb+pcx7zvYt7j2NqQT8F03Rf8VXQLvH2Pv2o9sDUWCwxgGGdsJfnHo5mcwuSLfJmsichuVCLVmwjvL82rWsKD+ZmW5w3SIOw5d51bDuQ5H/NhR3Xf4jf3ut3bnQtUxTIZioX86Oh7hgRbOmWiYuNa3wdTpnrAUmKEeBeacZCh54nNlGCFueIT8qPXluUxQ6MOEWs53UijYWmG4zYcEBOxFTvuZAQfUK87WQa/ecHtDnUFNZaWgksBPkymarfdmeBOg2bFyI0gg43VzUO8rGYZYtIpvqAKHR7xoOBDNx3oIdYYZ/mY4SUYr7u1JNcqcqfKciz4CoElyB3xvwm63iwL2wh0kTtH4ZqPRVNVrWvcxIc7kd7S2p3KzpDXA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199015)(71200400001)(478600001)(45080400002)(83380400001)(86362001)(6486002)(84970400001)(966005)(76116006)(66556008)(66946007)(36756003)(91956017)(66476007)(53546011)(6506007)(66446008)(8676002)(4326008)(316002)(41300700001)(26005)(6512007)(8936002)(6916009)(54906003)(5660300002)(2616005)(2906002)(33656002)(186003)(64756008)(122000001)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E058AA5FFC29B44F95A2F7E8B08CEE26@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9403
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95c02450-a4f9-4119-b1cd-08dab1be50f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OCqc2JP1lyDqu6514z6DcspDcYdplBS/KywPIlqDfFbnmHV8PNcz1mfw3wRQ1VA/c0JT02g08D0MNR1pInkY9xJXimNoaKiprbVf2TGEkukGkCJ56E7d8Cj25KBnusNlaTImyYTgQdMkYaQ1uagf48J8g7fMQuDKWvDHE/aZdOi3ssZXpoCji/XxnTVXk7zQMnjnmDGhDpoPeh/ZcJ+RBsa3UyxBkkN3w27sYJVogUKMiSs8ZQvnUdBTw0n7yFpCB99oomlLBBtMUy15i7cj5uTznyAEDS2eob3c72SKbdSrWcvX6UV6NhrJSvDTleb9PA8AoTkRL55Kz3Y6Vh58/ZyP1pBntta/Td430e07hckfCV3MCpoLGbQtI/NA7UNDbISqzkKuynQDIAXRcO7mZcCbkwUpaMqAVysLbpexciXbocl9vf3TTtvKj0WSQWQBlFfLM5O/AhupsuWwppuqn+szWGNqb1eGgkS3tezlJy798jK4gO3ujgC7nHFPaSU2wl8titbyGPSieA78v1TtQXUfkzGBWqeVo43uIsXnITFtArinl6+OdE5vcF6bVzV+GGU5xvbbXXwbaS6Y9MRIVZwrpLTC1Jm36t9AePJ3amnrie0t8oWsxn5PTELJeJ3Z/9QgjcL/iHdJxmdgD4D6oigc3j4zF7V25IfFAC/wJvJdpOm2W4aIhJwL+3Zl1su5JUrkWWO6xjDtlinE3XAAVatK0dBWApgDn032pxxWDjMsoi3pIlUcZ+lVr/qoSZ9lM2wa5S6Z0AqsQIkjBlUtNDPrK7cfi/gmJ9VvGMmL0BFtL7J0nOxc5UEBYPyBJGIP4PPzCr/OIdFIpH1XxcjhWQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(47076005)(186003)(2616005)(83380400001)(356005)(81166007)(26005)(86362001)(36860700001)(336012)(82740400003)(5660300002)(2906002)(8936002)(966005)(4326008)(40480700001)(82310400005)(6862004)(107886003)(8676002)(40460700003)(478600001)(45080400002)(6486002)(6506007)(53546011)(316002)(41300700001)(70206006)(54906003)(6512007)(70586007)(36756003)(33656002)(84970400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 10:40:33.7631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c2366b-8039-4e60-cf73-08dab1be5a0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6040

Hi Michal,

> On 19 Oct 2022, at 10:06, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Stefano,
>=20
> On 19/10/2022 02:02, Stefano Stabellini wrote:
>>=20
>>=20
>> On Mon, 17 Oct 2022, Stefano Stabellini wrote:
>>> It should be
>>>=20
>>> BB_NUMBER_THREADS=3D"2"
>>>=20
>>> but that worked! Let me a couple of more tests.
>>=20
>> I could run successfully a Yocto build test with qemuarm64 as target in
>> gitlab-ci, hurray! No size issues, no build time issues, everything was
>> fine. See:
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl=
ab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Fjobs%2F3193051236&a=
mp;data=3D05%7C01%7Cmichal.orzel%40amd.com%7C75ea919bbde249e1bac408dab16549=
60%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638017345841386870%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DoWrGVbloqkJoOxvvxTr55RbKVzd3YmS4iiLPyxD=
ZCYY%3D&amp;reserved=3D0
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl=
ab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Fjobs%2F3193083119&a=
mp;data=3D05%7C01%7Cmichal.orzel%40amd.com%7C75ea919bbde249e1bac408dab16549=
60%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638017345841386870%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D%2BXf3ZB1bsVi8K%2BzEEe1Dhpg0GSohpseogff=
12GaK3Gw%3D&amp;reserved=3D0
>>=20
>> I made the appended changes in top of this series.
>>=20
>> - I pushed registry.gitlab.com/xen-project/xen/yocto:kirkstone and
>>  registry.gitlab.com/xen-project/xen/yocto:kirkstone-qemuarm64
>> - for the gitlab-ci runs, we need to run build-yocto.sh from the copy in
>>  xen.git, not from a copy stored inside a container
>> - when building the kirkstone-qemuarm64 container the first time
>>  (outside of gitlab-ci) I used COPY and took the script from the local
>>  xen.git tree
>> - after a number of tests, I settled on: BB_NUMBER_THREADS=3D"8" more th=
an
>>  this and it breaks on some workstations, please add it
>> - I am running the yocto build on arm64 so that we can use the arm64
>>  hardware to do it in gitlab-ci
>>=20
>> Please feel free to incorporate these changes in your series, and add
>> corresponding changes for the qemuarm32 and qemux86 targets.
>>=20
>> I am looking forward to it! Almost there!
>>=20
>> Cheers,
>>=20
>> Stefano
>>=20
>>=20
>> diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yo=
cto/build-yocto.sh
>> index 0d31dad607..16f1dcc0a5 100755
>> --- a/automation/build/yocto/build-yocto.sh
>> +++ b/automation/build/yocto/build-yocto.sh
>> @@ -107,6 +107,9 @@ IMAGE_INSTALL:append:pn-xen-image-minimal =3D " ssh-=
pregen-hostkeys"
>> # Save some disk space
>> INHERIT +=3D "rm_work"
>>=20
>> +# Reduce number of jobs
>> +BB_NUMBER_THREADS=3D"8"
>> +
>> EOF
>>=20
>>     if [ "${do_localsrc}" =3D "y" ]; then
>> diff --git a/automation/build/yocto/kirkstone-qemuarm64.dockerfile b/aut=
omation/build/yocto/kirkstone-qemuarm64.dockerfile
>> index f279a7af92..aea3fc1f3e 100644
>> --- a/automation/build/yocto/kirkstone-qemuarm64.dockerfile
>> +++ b/automation/build/yocto/kirkstone-qemuarm64.dockerfile
>> @@ -16,7 +16,8 @@ ARG target=3Dqemuarm64
>>=20
>> # This step can take one to several hours depending on your download ban=
dwith
>> # and the speed of your computer
>> -RUN /home/$USER_NAME/bin/build-yocto.sh --dump-log $target
>> +COPY ./build-yocto.sh /
>> +RUN /build-yocto.sh --dump-log $target
>>=20
>> FROM $from_image
>>=20
>> diff --git a/automation/build/yocto/kirkstone.dockerfile b/automation/bu=
ild/yocto/kirkstone.dockerfile
>> index 367a7863b6..ffbd91aa90 100644
>> --- a/automation/build/yocto/kirkstone.dockerfile
>> +++ b/automation/build/yocto/kirkstone.dockerfile
>> @@ -84,9 +84,6 @@ RUN mkdir -p /home/$USER_NAME/yocto-layers \
>>              /home/$USER_NAME/xen && \
>>     chown $USER_NAME.$USER_NAME /home/$USER_NAME/*
>>=20
>> -# Copy the build script
>> -COPY build-yocto.sh /home/$USER_NAME/bin/
>> -
>> # clone yocto repositories we need
>> ARG yocto_version=3D"kirkstone"
>> RUN for rep in \
>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/buil=
d.yaml
>> index ddc2234faf..4b8bcde252 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -584,6 +584,22 @@ alpine-3.12-gcc-arm64-boot-cpupools:
>>     EXTRA_XEN_CONFIG: |
>>       CONFIG_BOOT_TIME_CPUPOOLS=3Dy
>>=20
>> +yocto-kirkstone-qemuarm64:
>> +  stage: build
>> +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
>> +  script:
>> +    - ./automation/build/yocto/build-yocto.sh -v --log-dir=3D./logs --x=
en-dir=3D`pwd` qemuarm64
>> +  variables:
>> +    CONTAINER: yocto:kirkstone-qemuarm64
>> +  artifacts:
>> +    paths:
>> +      - '*.log'
>> +      - '*/*.log'
> The above lines are not needed as the logs/* below will handle them all (=
logs are only stored in logs/).

Ack

>=20
>> +      - 'logs/*'
>> +    when: always
>> +  tags:
>> +    - arm64
>> +
> build-yocto.sh performs both build and run actions. I think it'd be bette=
r to move this into test.yaml in that case.
> The best would be to create one build job (specifying --no-run) in build.=
yaml and one test job (specifying --no-build) in test.yaml.
> This however would probably require marking path build/tmp/deploy/***/qem=
uarm64 as an build artifact. The question then is
> whether having this path would be enough for runqemu (Bertrand's opinion =
needed).

This will not be enough to run qemu as the qemu binary and its dependencies=
 are in the build artifacts and not in deploy.
Splitting the build and run is not a good idea because the size of the arti=
fact between the 2 will be huge.

>=20
> Apart from that there is an aspect of Yocto releases and the containers/t=
ests names.
> Yocto needs to be up-to-date in order to properly build Xen+tools.
> This basically means that we will need to update the containers once
> per Yocto release. The old containers would still need to be stored in ou=
r CI container registry
> so that we can use CI for older versions of Xen. However, updating the co=
ntainers would also require
> modifying the existing tests (for now we have e.g. yocto-kirkstone-qemuar=
m64 but in a month we will have
> to change them to yocto-langdale-qemuarm64). In a few years time this wil=
l result in several CI jobs
> that are the same but differ only in name/container. I would thus suggest=
 to name the CI jobs like this:
> yocto-qemuarm64 (without yocto release name) and define the top-level YOC=
TO_CONTAINER variable to store
> the current yocto release container. This will solve the issue I describe=
d above.

I think we have no other way around this and we will need to have one Yocto=
 release supported by Xen officially so
we will have to keep old docker images for old releases of Xen and move to =
newer versions of Yocto in staging when
it is needed.

We have to find a way for gitlab-ci to use the build.yaml contained inside =
the tree that is to be tested somehow so that gitlab would automatically ta=
ke the right one.
Which means that build.yaml will be different between branches and contain =
the right version for the current branch.

Regards
Bertrand

>=20
>=20
> ~Michal


