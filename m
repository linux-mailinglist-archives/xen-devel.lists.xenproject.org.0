Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1508588C81
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379928.613829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDvD-0007WO-HB; Wed, 03 Aug 2022 12:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379928.613829; Wed, 03 Aug 2022 12:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDvD-0007Sp-Dy; Wed, 03 Aug 2022 12:56:23 +0000
Received: by outflank-mailman (input) for mailman id 379928;
 Wed, 03 Aug 2022 12:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4Xu=YH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oJDvB-0007Sd-TC
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 12:56:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac2bc0db-132b-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 14:56:21 +0200 (CEST)
Received: from DB6PR07CA0050.eurprd07.prod.outlook.com (2603:10a6:6:2a::12) by
 DU0PR08MB8446.eurprd08.prod.outlook.com (2603:10a6:10:406::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.14; Wed, 3 Aug 2022 12:56:18 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::c7) by DB6PR07CA0050.outlook.office365.com
 (2603:10a6:6:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Wed, 3 Aug 2022 12:56:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Wed, 3 Aug 2022 12:56:17 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Wed, 03 Aug 2022 12:56:17 +0000
Received: from be83a209a627.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B441FFA-221F-4D2C-8CDA-5EFB69F6E33A.1; 
 Wed, 03 Aug 2022 12:56:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be83a209a627.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Aug 2022 12:56:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR0802MB2410.eurprd08.prod.outlook.com (2603:10a6:3:dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Wed, 3 Aug
 2022 12:56:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 12:56:09 +0000
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
X-Inumbo-ID: ac2bc0db-132b-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DZRyLlDqsBksf+0YD4ePcR7YA2ZEiGWD0sqte//2rf6dXxK3ZDw7ZMOkpUNAJM3Jo/pGXZMnmNvQ7QGS1Gm2/oe7SIHxEPW45BYZdShgkM3hQGuVz+335X3CV3rkzERpgjjSKyHFHISPsrUlmxpNRgRHwQk1fsDKh06Rxgpjg3pMj7YiF8huNd1mWW3t9eav14v07WAfnR1KTU49kPQzf1r6o547X9ATgutrE/5M/3qEiOv8Serwcr/KM7ueaOdFA5ZEvFDFpSPtoiLGiREue1jNH1eYILlX+FR3Vsupzo3c9qle4DJQZuFy48SnIVjTGQPajbFP6c2/NPTmfcjYNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6gR2rmGdCitEDGJC/KOMBzV7rQNxrpk/lEjZupbxIc=;
 b=lkqdt6+43mA64TU42S6Ifc+stuqkoAHIYA2uMolMwd2X+wj4XBmQzFD8jnPN/pUO7WF4F5Nsm7hXKq7RuujFH+THfUeXJxpAOAj5ujsMwOgmIwCi6XrGPh33Ad7rkAN8DAR29Jxo3p/nLqQZgY6bwJWtlT1tpgPPyqh8/2gDAwADnaCWtuVFi/9Yo5a1xfLnftntBUGBGagmxskPFE0oQ+jnrkvl+NTnjQxboFnUmZTxQ5BUkso9PMWFaJhRlHES9zJ37pSKHE+IEB7DN/9w7uhM9YoA3qOWdT2DHZzt9VkoUH5ZDbF+wY8Qra4GUixFC8jZI2tZmbc0aQbe5zs6Tg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6gR2rmGdCitEDGJC/KOMBzV7rQNxrpk/lEjZupbxIc=;
 b=bXzp36yV92ttDwBY0StqkcgvG4/f5ykhp3X3MwlYAdYKONxzpQgtGzURmdk7hs9E0cfGQwmjFhcYR3PUCZpHJq26U8mhgeNTZ/fnspLlI/TtreoooMyrxZE3DBSO7a6B/ZAnomzY/pDmNdHYERJRGHp1zmSz1j4BrgCf7LDMMTg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4dfcb24010ab106b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQAHJQtyKrG+UxNcfmZKB2AleNO/rsYLrkZUT0Ml4zDMhEepdZnCsI4uwSslCoZWD+Lztogo4WARhSmyfWWO9X5CXjoe7Szj8W1kPEc+fPloOvszSoGlIFT5VWAdEYFlcK9vyHflFHJCSYuq/C8gT49ajMfyHtmc/aGX17iqYSyrlTwUBrinBp0D4cWIOFnkNCA2xh9/Q1y3qMPiq1nNTfiMvXWUEJYPxI/WAtuVmqhb0CTmpzfYKaIzdpx2WqjZxL59UgDJ5Y07As1iz5fgsM47uXxK/cFD5IQCj+Dp720bK8o9w/nHKqHVpnhPuoPCuM8gJ9CAxtgOu5DoLZVnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6gR2rmGdCitEDGJC/KOMBzV7rQNxrpk/lEjZupbxIc=;
 b=f8EsKmpoyChpGucfIofOudqcFxzKJehdzrqPNuRA35L/CfxrlhpUt3Isqa/EFA3hUrtHXVuboSPnD1bMdzOQThsISJ190wS31nu6AO1N3M9WhoN5WVOdyJ+/8jBQju//yvAEOyBu+uxzCIJK1w//mfDQX3sRKQ3BEz3NUj2pB/4sMsfmoyV0kpQakTGbQiv1RnjTbVblf7gkSo+beI5/Zd41PY8obzKvX7MoSftHmNM6fQm7eFIQ5GxWfoeP1cFDeDsDer+i6UyXKpXXCJfH0QWkPCXNREpkOuChoRSHsWV2DSZ4ZKHPNBQin0KVw/l81zA4I00x1EyKRArXuaiVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6gR2rmGdCitEDGJC/KOMBzV7rQNxrpk/lEjZupbxIc=;
 b=bXzp36yV92ttDwBY0StqkcgvG4/f5ykhp3X3MwlYAdYKONxzpQgtGzURmdk7hs9E0cfGQwmjFhcYR3PUCZpHJq26U8mhgeNTZ/fnspLlI/TtreoooMyrxZE3DBSO7a6B/ZAnomzY/pDmNdHYERJRGHp1zmSz1j4BrgCf7LDMMTg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] tools: use $(PYTHON) to call cppcheck tools
Thread-Topic: [PATCH v2] tools: use $(PYTHON) to call cppcheck tools
Thread-Index: AQHYpzA5Sq+ptI31i02cWAL8jJ4SLa2dFF0AgAABZ4CAAAxXgIAAAFGA
Date: Wed, 3 Aug 2022 12:56:09 +0000
Message-ID: <773AB351-B4C7-43ED-AA83-FC80DCF2541D@arm.com>
References:
 <708f00303d1c370622707866d41a868425a17324.1659527529.git.bertrand.marquis@arm.com>
 <dd4a5616-5c1f-51f2-0bce-3679432dcd58@suse.com>
 <07858193-47b0-f1a5-6bdc-4cac4dbe2ed7@xen.org>
 <6FFB4DB2-5F3B-4E2F-AF7D-A5C47D497476@arm.com>
In-Reply-To: <6FFB4DB2-5F3B-4E2F-AF7D-A5C47D497476@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2bd6af5c-4f34-49e7-e2cb-08da754f8e70
x-ms-traffictypediagnostic:
	HE1PR0802MB2410:EE_|DBAEUR03FT028:EE_|DU0PR08MB8446:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c6Uu+2vo7Tcsf76K7+2jKhBp8NECxpqZkT/C6eOrXGf+lNIngsWxRGxGHj7qUknUYoqdLE3mEK+kXG/Yk0D8K3mLLfvU23B7TDuQCZ1hT8Ud3wTmRnik9+CLqnvJvWp33mPY5MwrfTOjYz6nCskHsJwpcBN68Lp+D518MEZCvSdhoNUpBxlDWEtIOtAYvZOvz0sHREj2J2KAkVuGlwnESTWoaB7EZwHVvbEVB1ERfV2tpn1WfOgu9mX+KFcuducctedHj+lhvtpWdAAgGtIPiPVZGU9sAlY76popp2t53GlFqi6nh0pXrHv0PBgr78eseUiGhpnr0wRwsBKvtiBe7Z2tWxFdTEvQ4P1z//XH1q4L11M5dfUuioeJ4QW+PLyM9FyDs/U5rGqXSA1g1rTdrezZiwhUKgMoz3A3dw3XT6eze7z/EykcQEmtciSiu9tE15TdgjbfIJI+ltWrQbY8p7NYdOn2pv8e8as1yyU5IjQDCgBO9FLTFsEEz4qQ1cXBuJhQdhBNRCzj1zj9QKY8DdIN/Qq1G4epK1jECPy39svC2V4NerxShIhof3JEHN6iRkLXqgb67L1lOiZnpGZhd/IJkqejU63yD2x11FM3//ac6KEk3xbAbQrvQtn84+gFMxBj4YpuBLU3jOMRNGKta9pPZmKH7XHW83Qw/JGIsdgJ33Fk2AJdPo7lq6v4bCeib9/DaQmlv1kG5s324JEQeqSY1I5BF0s3AMVw1JuQY9H7UYaY55KWZDRtyH9hWOrYXg3YAgNbaQUU4bmU2PqNnOc7HDAvigmQ9RuyFYjHGf+dqbllhuuVh5R0I+8wOXUZFUbE3v/r30jQyVy4pdoqPA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(33656002)(53546011)(6506007)(38100700002)(6512007)(76116006)(38070700005)(71200400001)(5660300002)(66556008)(8936002)(66476007)(66446008)(41300700001)(316002)(66946007)(54906003)(4326008)(122000001)(8676002)(2906002)(186003)(64756008)(6916009)(91956017)(36756003)(2616005)(478600001)(26005)(6486002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <832CC0599EAA0E47928C55D4B3C78958@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2410
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	320e3336-1cf5-40b6-8205-08da754f898b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oNNcqjNgG/sdYTe/iPqEvErTkJKhCV+AOgfzSFV/K/qcC8Si1uwNbfUnkfnufm2ySLHHRkhbK9Ma3c/ixdGYoZKPEyvD0oDpnYkigwV0SNlFKtHY0ggjx+4nmthK68vh7F0KOAMKZsZ1KDM6+BN4ujc4rmevttaUvQefKsR0yI/Uyk17/bfnQ0P/kXzYtZ2wL7IHjxxhH37pVyib7ldDbG6IUEnzy8kupxFIGnt6+OpNRr0fsd20M605snFAmqLd40Oud6r7EBUJgw3Fv9Ptv9xFXAf1SRLLELELO/vAyaRmwcZrS942Ujx7kRMhQK0WQ7ywT+I+coUYlEp/hP1zbJr5oFhcRTHxG2tATpRmU7ylYVxsN/DmK6T/+wDm9UUlItXZwUpSyJWEJNMZE8Ugn+BdmcCPutO/SMaXVVITtkvYDB4nvmBbmRVF1yAIO9KznhESl0hLaXATjmOMto8QlfOoeQ87GI1ZBgsR76YzeKUmP/8pEY9lDzz4/6jGpY/WoSY8BGgqr/ZTtbnrX1FDFKqVrIw6yPHkmxqPoyX0fP3Y84mImwhYEJ/OhtsjAfOyapeU50Z2G0TJ/8lUGT+m0EyXyLjGCEUlbzpFGpV7JO21rq3vtwgYv2YjVw+L85c301S0z/XtBULZvOJFinbKK2Q7J89uEomr65GaBTQXDToNZEWopGKCNw8U+EXuKWSiAEoWHiBQNix0Xx4vQcBPAOoPtzdwmfgFTFb+Clo4w0bTtNAT019mjen/5aGUv2aLP6ji3g9PcXdZEWBE4ZqjTdx6+ycVKIuwnbSzfRLiWsQWlp2HSCJAkgmmXx2DW2qY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966006)(36840700001)(40470700004)(70586007)(5660300002)(6506007)(53546011)(6862004)(41300700001)(8936002)(54906003)(316002)(81166007)(40480700001)(82740400003)(356005)(70206006)(82310400005)(86362001)(2616005)(40460700003)(8676002)(6486002)(2906002)(186003)(47076005)(336012)(36860700001)(478600001)(36756003)(33656002)(6512007)(26005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 12:56:17.8819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd6af5c-4f34-49e7-e2cb-08da754f8e70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8446

DQoNCj4gT24gMyBBdWcgMjAyMiwgYXQgMTM6NTUsIEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5k
Lk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAzIEF1ZyAyMDIyLCBh
dCAxMzoxMCwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+PiANCj4+IEhp
LA0KPj4gDQo+PiBPbiAwMy8wOC8yMDIyIDEzOjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBP
biAwMy4wOC4yMDIyIDEzOjU3LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBXaGVuIGNh
bGxpbmcgcHl0aG9uIHRvb2xzIHRvIGNvbnZlcnQgbWlzcmEgZG9jdW1lbnRhdGlvbiBvciBtZXJn
ZQ0KPj4+PiBjcHBjaGVjayB4bWwgZmlsZXMsIHVzZSAkKFBZVEhPTikuDQo+Pj4+IFdoaWxlIHRo
ZXJlIGZpeCBtaXNyYSBkb2N1bWVudCBjb252ZXJzaW9uIHNjcmlwdCB0byBiZSBleGVjdXRhYmxl
Lg0KPj4+PiANCj4+Pj4gRml4ZXM6IDU3Y2FhNTM3NTMgKHhlbjogQWRkIE1JU1JBIHN1cHBvcnQg
dG8gY3BwY2hlY2sgbWFrZSBydWxlKQ0KPj4+PiBGaXhlczogNDNhYTNmNmU3MiB4ZW4vYnVpbGQ6
IEFkZCBjcHBjaGVjayBhbmQgY3BwY2hlY2staHRtbCBtYWtlIHJ1bGVzDQo+Pj4gTml0OiBUaGVz
ZSB0d28gdGl0bGVzIHdvdWxkIHdhbnQgZXhwcmVzc2luZyBjb25zaXN0ZW50bHkuIElmIEkNCj4+
PiBlbmQgdXAgY29tbWl0dGluZyB0aGlzLCBJJ2xsIHRyeSB0byByZW1lbWJlciB0byBhZGp1c3Qu
DQo+PiANCj4+IFRoZXJlIGFyZSBhY3R1YWxseSBhIGZldyBpc3N1ZXMgd2l0aCB0aGUgRml4ZXMg
dGFncy4gRnJvbSB0aGUgZG9jIFsxXSA6DQo+PiAtIHRoZSBzaGExIHNob3VsZCBiZSAxMiBjaGFy
YWN0ZXJzIChyYXRoZXIgdGhhbiAxMCkNCj4+IC0gdGhlIGZvcm1hdCBzaG91bGQgYmU6DQo+PiBG
aXhlczogPGNvbWlkaWQ+ICgiQ29tbWl0IHRpdGxlIikNCj4gDQo+IFlvdSB3YW50IG1lIHRvIHJl
c2VuZCBhbmQgZml4IHRoYXQgPw0KPiANCj4gT24gdGhlIDEyIGNoYXJzIG9uZSwgSSBtdXN0IGFk
bWl0IEkgdXNlZCBnaXQgbG9nIOKAlG9uZWxpbmUgYW5kIGRpZCBub3QgY291bnQuDQo+IEFueSBw
YXJ0aWN1bGFyIHJlYXNvbiB0byB1c2UgMTIgaW5zdGVhZCBvZiB0aGUgMTAgdGhhdCBnaXQgbG9n
IGlzIGdpdmluZyA/DQo+IFNob3VsZCB3ZSBzdWdnZXN0IGhvdyB0byBnZXQgdGhpcyBwcm9wZXJs
eSBpbiBhIHNpbXBsZSBtYW5uZXIgPw0KDQpNZWFuaW5nIHdpdGhvdXQgY2hhbmdpbmcgdGhlIGdp
dCBjb25maWcgOi0pDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzDQo+IEJlcnRy
YW5kDQo+IA0KPj4gDQo+PiBDaGVlcnMsDQo+PiANCj4+IFsxXSBkb2NzL3Byb2Nlc3Mvc2VuZGlu
Zy1wYXRjaGVzLnBhbmRvYw0KPj4gDQo+PiAtLSANCj4+IEp1bGllbiBHcmFsbA0KDQo=

