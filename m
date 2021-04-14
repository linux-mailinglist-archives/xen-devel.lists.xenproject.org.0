Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C96835F155
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 12:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110443.210803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcXP-0007Gz-A6; Wed, 14 Apr 2021 10:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110443.210803; Wed, 14 Apr 2021 10:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcXP-0007Ga-6w; Wed, 14 Apr 2021 10:14:23 +0000
Received: by outflank-mailman (input) for mailman id 110443;
 Wed, 14 Apr 2021 10:14:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1ra=JL=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lWcXO-0007GV-8G
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 10:14:22 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df641db1-8f61-4bcf-904c-1582d8b0d7fe;
 Wed, 14 Apr 2021 10:14:19 +0000 (UTC)
Received: from DB6PR0601CA0048.eurprd06.prod.outlook.com (2603:10a6:4:17::34)
 by HE1PR0802MB2409.eurprd08.prod.outlook.com (2603:10a6:3:dc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 10:14:17 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::7) by DB6PR0601CA0048.outlook.office365.com
 (2603:10a6:4:17::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Wed, 14 Apr 2021 10:14:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 10:14:17 +0000
Received: ("Tessian outbound 82c2d58b350b:v90");
 Wed, 14 Apr 2021 10:14:17 +0000
Received: from 92eeb4409886.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 518B69E0-A48A-426C-9542-AF85E48060DA.1; 
 Wed, 14 Apr 2021 10:14:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 92eeb4409886.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Apr 2021 10:14:05 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5423.eurprd08.prod.outlook.com (2603:10a6:803:133::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 10:14:04 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Wed, 14 Apr 2021
 10:14:04 +0000
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
X-Inumbo-ID: df641db1-8f61-4bcf-904c-1582d8b0d7fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/R+0m4gSNWsYgl50iH/hgQwOTqS+iNGuxV4B48pqco=;
 b=dWwj0YZuh7T+xZVIR3slPxWPGCRADKj5So3G9I76ht1f/DnOomT2m0O2ueZOdhEG1bSvzpvbE+HVX/CKWVQXIg4Rd7Ixu4E5qIJgOE0e96yqgLEa+w8yC57i+WfSk9zleucpxD94ZrF6lHI8ZIXzSYx4H1vqjzoHqVkf8LPxWnI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e79ea932a5d299c2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLLrPvW9BCpblHaGZd2yUpktjRdixNqe6TgMlvXPeoEQ0o4hRHseluNJDKm/9tLDciD5aDCPsH2htxpZla59bOKM6uosNkpb+sfkrWBl5JIT1E36ctyEuxTDZfE0FXNrmAsCm1Z9ub1ZPnGJ8IAIVP4QBvvW/aLhkIyCKWOWIOQKRUnieSgL3yaoLCCQhHZPUYvXzTmjFkOJeBTpX+dkJ0cXUkffK+5idbH0YQznceq0fINAm2VHjb8OJuQby4Op+eSnoogVV6iwwjGfN0+1zlMFK0fN/BwMLeW7SiCnBYWj+utSTcael7mqpjENjpC6P5JZvC1SIUICZoDVahvJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/R+0m4gSNWsYgl50iH/hgQwOTqS+iNGuxV4B48pqco=;
 b=XgqyF/2AmKOBkR6xwkC+VCHN/ZvixXOTR6hjDk5saknO9h0oiH1j07Ysfk8/4tnPUrX1IO+5ZOZ9/EtBpgPR1oQiR3cXK7iGCQYWd8ssZVLHV1MOH02oqtYxNnwBgUdo2V35taoOkQtmRio2ol0JF6Puun/xxhdq5HXnda1McNUKe54xcwaPYAoCPgf3wRm0B3fCrogAXTru37QMXEvVjUg4YreMfpdHtOAYx3WwcE/TRq73vDosejiG7OsB3ypYL6NHod0FuY8pKNpva48+wsfRM3E9SRjw0aOgtoZkrLSQmWfsGs9kwXGIDXT17UK+2CYZOkRTrSwKGzvyjnuoFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/R+0m4gSNWsYgl50iH/hgQwOTqS+iNGuxV4B48pqco=;
 b=dWwj0YZuh7T+xZVIR3slPxWPGCRADKj5So3G9I76ht1f/DnOomT2m0O2ueZOdhEG1bSvzpvbE+HVX/CKWVQXIg4Rd7Ixu4E5qIJgOE0e96yqgLEa+w8yC57i+WfSk9zleucpxD94ZrF6lHI8ZIXzSYx4H1vqjzoHqVkf8LPxWnI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/4] xen/arm: Move dom0 creation in domain_build.c
Thread-Topic: [PATCH v4 1/4] xen/arm: Move dom0 creation in domain_build.c
Thread-Index: AQHXMQ6QjNLHRw7HtkGQiqM6Rozk8qqzy60A
Date: Wed, 14 Apr 2021 10:14:04 +0000
Message-ID: <0C0DD0B8-D009-4E7D-9C92-1D009B832AED@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>
 <20210414091404.14215-2-luca.fancellu@arm.com>
In-Reply-To: <20210414091404.14215-2-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c04524e0-3259-4636-8e52-08d8ff2e0fde
x-ms-traffictypediagnostic: VI1PR08MB5423:|HE1PR0802MB2409:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB24090FDC98CE977E82D046559D4E9@HE1PR0802MB2409.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:792;OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0Q3ByKPUvLKEtYohfjlkieP5GxoeX1u8AmC5ONHhxPVhuzf4Rgh95upIxVwWOTe59qPjuOF3ZN8RqicfGzUobrjZfHSV2oH7F73JNEMr2Ak48rQormdJisPkQEqvsvLSqhxDFBvikh3TliDBnQXWklqRGxBTy61RsnXSEDJ781TlB5Q2hK/laqNttX45JyF0/qqlNhwYmMet1982/bljITJVfI0GfvRSi5MG6VNtu0hFJS7pK+v5VFvgBzwdRazfjTImlkLY7Qj1KMehZbtiGdCcZd7qBId/X8aNl534j84n/9fbGUVSl+99I9jTkauQa9oW2NG9iN2cXAdRcy94bBSi37BtuHCO+Ip4Lbh3Y20OmvcJEHk1tSKJ7+iGv9RQ33+RXzR3sQOogeYaA9iV/wiKarosEoUw09kE/dDJyCct5s2BJbE+YR9lLyloIu4WMv3eMslzyv1dyq9Pwj6ctDoDGSE3Z/P+O/eYZviqz05MeX0pLocWGsqqsZEZf2B2fXVAwCHaqjAf7/oqIS4CW4WD0h3Yy9v6XwXxtjsDVIFkHlrbt+UnloGp6pgRAuXus7NlruUr3xW8+D7Yf7H3ODgvADjjHf0N30VWRq2HcBIZDbS2OyYCtIQEPnhbKlV9NqFnVtalJqkW3mixmXLDIA9jqfWAYsOVobDFnCZO63Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(33656002)(54906003)(2906002)(6636002)(6506007)(26005)(316002)(83380400001)(66556008)(2616005)(122000001)(5660300002)(4326008)(38100700002)(91956017)(37006003)(36756003)(6862004)(66946007)(71200400001)(66446008)(66476007)(6486002)(6512007)(8936002)(53546011)(64756008)(478600001)(76116006)(86362001)(8676002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?KvZd9BgR+lft7O4uzeiUQB/04XKS0npgzKv/inCPSf9EzKJHdhVm9oVW7cVm?=
 =?us-ascii?Q?h0kVkRkPmTOF0AlyA2XHafnsKp1/dIWFzq8ITL+v8c3uL4lSyf3hWurdyO0w?=
 =?us-ascii?Q?mPux7Q81XtC/jfHL+U7JJdJ9mdHxqoCBnrbueyq953ZqK9pkNeK1N4B3YHx8?=
 =?us-ascii?Q?4OTGHWPxJ3wgjE7mJGV/XYdM2mWgYh/pi9M4ZiTBrRGwVNF9lEJ2tcz2HoAp?=
 =?us-ascii?Q?ULK4/+650ciMMJbSm8rNeBGuwLTpUdX3eV3v+Vle56JagqXCeGw3PF+7bcbL?=
 =?us-ascii?Q?uPZ15BqBeVjFYkx+p+VQUavWZ1CQiy5X6GHv8aOskASejEj6eZH9M3DcnbRD?=
 =?us-ascii?Q?my7A0EFb+OLlMIwVpIGRSywqQLps2hqSg3yWaqxrRqhrfdLBJM0wwsuNqyJQ?=
 =?us-ascii?Q?efPNZYzfGvP/uTiPJuiS8mhkc/MRpof0maxCO8YnyH+sKaCV2SxjqULLgFQc?=
 =?us-ascii?Q?lP3Qpi2hvw3EJnhaiZfwjlPywEEa6JVCsTytAdWyr8V4h48BhxutxkSvWeFu?=
 =?us-ascii?Q?VRCtjSH+87y9aoIMjsmz0RuFf1/QRlLXSEK5aws1u1S1ECpsP/kj3KmBc2uR?=
 =?us-ascii?Q?OTEwOP8/Ay3oGTGpW+g29+5+x+g5vAuaxMS8LA4ZPzOuOMNLC7MnoUvJWfsj?=
 =?us-ascii?Q?6BS7H8KEAr1UGIHPmU/+NhYkNEPuLO1+HsNDwZsmNcYAt6VjiwVPG6mIQaFE?=
 =?us-ascii?Q?hX8+hkaCY+zyRLY82oyqVx41/MeBuK9cVIj/lhbKqKW3+Hf6ePNTu02EsxvC?=
 =?us-ascii?Q?/HdybR+tnpJXCTPlKJaAS7QzCPor8INDZ5gbZp/N8+oofl5hMjMy/eTdePmb?=
 =?us-ascii?Q?aoMFYXpTgl/VtxNhXtjI8k7AFqS2x63AGKQTdvVCotblOU7efICUIXusTo29?=
 =?us-ascii?Q?h3WYoPb3JJbH5oMsiKqIfBbWMy6Eq/hK7hQYviz82GVSysqPxps0j30uT8Hq?=
 =?us-ascii?Q?1FEU0C0M4/MDS2GmplQ451+LdEwU3ycFA7OYdOOOWFZhDmZzIcfmc2UlFdZb?=
 =?us-ascii?Q?MPJwrY1FICXCPWiS02y0OOzkheqLUWEEXrXRYCWgxVM26BRuYUVwQmM5+n8u?=
 =?us-ascii?Q?ixHq99eR5B0c1tZqxACVl26yUgoPgGGoDpfbjMT1bA7uc4RlxeMAVYUNTM/W?=
 =?us-ascii?Q?J9bi7TaNNQsRumR4lyqNdGSHh0NU8HP6BcVlG5tX9SSy8WE3Et3nzArc7RGK?=
 =?us-ascii?Q?Jbl6M6MuTbhEPfKBU5M94H/guiO9nA2M/AAIdvSDrYcn2atg2umOaDpT1s7q?=
 =?us-ascii?Q?9cyvvbJADUj1SITDhkpUMz2pqmVKTzNkYTY3E6riDM23CygsefCywP/d2FvZ?=
 =?us-ascii?Q?9+owlXPxloV2dCM+B/dtLMaU1hQZEqsQaiKQzlXNrlUp2g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7FB6ABF235581A418D5DC4E0756716DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5423
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3901ff77-9433-44f7-8287-08d8ff2e0881
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zsjk3b+P7x08EWp74XTk+5J8fSYnjKwLOFRjpOyN9VD4AoxzsO6bHLHMyaq/64ZPhuaGrN6K1VCH/m6R5j5bmzNSoWPRbhjiOoh8qYUz1KzLORzFVOA1kpM3Lik0OPDGY5ZnWJHkZI9nQ1a4aTRnpWmPjy+eLgysPG5Dr58inGbARmnmMp+ghSdQG4bBAtEhVmeG2PNdQtCXYr0RxSoblEC1D3DDX72tMP62mu5tamqrBDcHjhHpI111uiI2UcOpdwOeACovT6LDpbhIZoxCX4d8ouou9ElbDfBf6jpA8fwUcDL6V96tRke7pqnO4BeOa2VCMFOAPWXNquhO2B5WnKum3wSaP3rbeswXOYoG9LR+e7HABMgmPLA7xOc6FdnZF0XKfX7rT86F+h5jGfd+QeBOQwidik9fdpw4e5XhiQ4M/nCanKGWrTGufrvnItIUsdqyLzr/MqyA3/ayoamVc5hsjWr0a0c9BtCDOduU4Vcl021hY995KzAZjO8dhxn3Mx11H1TUfDFVYbXEUhEn72X3sWUGr7eOZmoDaDdOB9KzMOeuQBguphhAVukq73XqGKVPnDxP7Kvvjj+3ocbCCY+u7utbwgsxY4WYOfQJvdQF/FN7H6bpaGcjJHcgcS30D5wOIuMk/qAIwvlXo2lsdo11tEJ7upFijgg7qroLi6s=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(107886003)(54906003)(83380400001)(2906002)(6636002)(6862004)(37006003)(8676002)(8936002)(6486002)(26005)(186003)(82740400003)(4326008)(2616005)(336012)(86362001)(316002)(6512007)(82310400003)(81166007)(5660300002)(47076005)(6506007)(70586007)(53546011)(33656002)(36756003)(36860700001)(478600001)(356005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 10:14:17.2672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c04524e0-3259-4636-8e52-08d8ff2e0fde
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2409

Hi Luca,

> On 14 Apr 2021, at 10:14, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Move dom0 create and start from setup.c to a dedicated
> function in domain_build.c.
>=20
> With this change, the function construct_dom0() is not
> used outside of domain_build.c anymore.
> So it is now a static function.
>=20
> No functional changes intended.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers,
Bertrand

> ---
> v4 changes:
> - changes to the commit message
> v3 changes:
> - move create_dom0 function after construct_dom0 and
>  make construct_dom0 static
> ---
> xen/arch/arm/domain_build.c | 38 ++++++++++++++++++++++++++++++++++++-
> xen/arch/arm/setup.c        | 29 +---------------------------
> xen/include/asm-arm/setup.h |  2 +-
> 3 files changed, 39 insertions(+), 30 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 374bf655ee..359957dc1b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -21,6 +21,7 @@
> #include <asm/device.h>
> #include <asm/kernel.h>
> #include <asm/setup.h>
> +#include <asm/tee/tee.h>
> #include <asm/platform.h>
> #include <asm/psci.h>
> #include <asm/setup.h>
> @@ -2520,7 +2521,7 @@ void __init create_domUs(void)
>     }
> }
>=20
> -int __init construct_dom0(struct domain *d)
> +static int __init construct_dom0(struct domain *d)
> {
>     struct kernel_info kinfo =3D {};
>     int rc;
> @@ -2578,6 +2579,41 @@ int __init construct_dom0(struct domain *d)
>     return construct_domain(d, &kinfo);
> }
>=20
> +struct domain* __init create_dom0(void)
> +{
> +    struct domain *dom0;
> +    struct xen_domctl_createdomain dom0_cfg =3D {
> +        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> +        .max_evtchn_port =3D -1,
> +        .max_grant_frames =3D gnttab_dom0_frames(),
> +        .max_maptrack_frames =3D -1,
> +    };
> +
> +    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> +    dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
> +    /*
> +     * Xen vGIC supports a maximum of 992 interrupt lines.
> +     * 32 are substracted to cover local IRQs.
> +     */
> +    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) 992=
) - 32;
> +    if ( gic_number_lines() > 992 )
> +        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n")=
;
> +    dom0_cfg.arch.tee_type =3D tee_get_type();
> +    dom0_cfg.max_vcpus =3D dom0_max_vcpus();
> +
> +    if ( iommu_enabled )
> +        dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
> +
> +    dom0 =3D domain_create(0, &dom0_cfg, true);
> +    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) =3D=3D NULL) )
> +        panic("Error creating domain 0\n");
> +
> +    if ( construct_dom0(dom0) !=3D 0)
> +        panic("Could not set up DOM0 guest OS\n");
> +
> +    return dom0;
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 2532ec9739..b405f58996 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -51,7 +51,6 @@
> #include <asm/platform.h>
> #include <asm/procinfo.h>
> #include <asm/setup.h>
> -#include <asm/tee/tee.h>
> #include <xsm/xsm.h>
> #include <asm/acpi.h>
>=20
> @@ -805,12 +804,6 @@ void __init start_xen(unsigned long boot_phys_offset=
,
>     const char *cmdline;
>     struct bootmodule *xen_bootmodule;
>     struct domain *dom0;
> -    struct xen_domctl_createdomain dom0_cfg =3D {
> -        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> -        .max_evtchn_port =3D -1,
> -        .max_grant_frames =3D gnttab_dom0_frames(),
> -        .max_maptrack_frames =3D -1,
> -    };
>     int rc;
>=20
>     dcache_line_bytes =3D read_dcache_line_bytes();
> @@ -965,27 +958,7 @@ void __init start_xen(unsigned long boot_phys_offset=
,
>     enable_errata_workarounds();
>=20
>     /* Create initial domain 0. */
> -    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> -    dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
> -    /*
> -     * Xen vGIC supports a maximum of 992 interrupt lines.
> -     * 32 are substracted to cover local IRQs.
> -     */
> -    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) 992=
) - 32;
> -    if ( gic_number_lines() > 992 )
> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n")=
;
> -    dom0_cfg.arch.tee_type =3D tee_get_type();
> -    dom0_cfg.max_vcpus =3D dom0_max_vcpus();
> -
> -    if ( iommu_enabled )
> -        dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
> -
> -    dom0 =3D domain_create(0, &dom0_cfg, true);
> -    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) =3D=3D NULL) )
> -        panic("Error creating domain 0\n");
> -
> -    if ( construct_dom0(dom0) !=3D 0)
> -        panic("Could not set up DOM0 guest OS\n");
> +    dom0 =3D create_dom0();
>=20
>     heap_init_late();
>=20
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index 28bf622aa1..5283244015 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -93,8 +93,8 @@ void acpi_create_efi_mmap_table(struct domain *d,
>=20
> int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
>=20
> -int construct_dom0(struct domain *d);
> void create_domUs(void);
> +struct domain* create_dom0(void);
>=20
> void discard_initial_modules(void);
> void fw_unreserved_regions(paddr_t s, paddr_t e,
> --=20
> 2.17.1
>=20


