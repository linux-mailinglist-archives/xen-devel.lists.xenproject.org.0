Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB657FB98C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:41:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643086.1002980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7wTN-0004dq-Nh; Tue, 28 Nov 2023 11:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643086.1002980; Tue, 28 Nov 2023 11:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7wTN-0004bt-KQ; Tue, 28 Nov 2023 11:41:49 +0000
Received: by outflank-mailman (input) for mailman id 643086;
 Tue, 28 Nov 2023 11:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A0gx=HJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r7wTM-0004bi-5e
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:41:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c3e00e8-8de3-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 12:41:46 +0100 (CET)
Received: from DUZPR01CA0171.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::17) by PAXPR08MB6637.eurprd08.prod.outlook.com
 (2603:10a6:102:153::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 11:41:40 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::cd) by DUZPR01CA0171.outlook.office365.com
 (2603:10a6:10:4b3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Tue, 28 Nov 2023 11:41:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 11:41:40 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Tue, 28 Nov 2023 11:41:40 +0000
Received: from 10ba8c122283.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D2516DD8-CEE2-4850-98FB-1428553B0A63.1; 
 Tue, 28 Nov 2023 11:41:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10ba8c122283.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Nov 2023 11:41:33 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VE1PR08MB5839.eurprd08.prod.outlook.com (2603:10a6:800:1a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 11:41:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 11:41:31 +0000
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
X-Inumbo-ID: 1c3e00e8-8de3-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WvlTgtgw2vJiLrjV0GC0LfciyYVr3aMc23ot4YEGtvAgkHieAEGt/d4COUIZEccSV4pk3ZdF4N/3j+/TUGGvpHeBbegS/rX5qZGsK+u3v0SVgGEfgzv7rCXImSAwHbym5hAQXdkAbArt0LGPFNvXMTAwzMmXfscmiwRtA91mfeVhra3nNq/5upd5A+y6NZJL9qWwYnp8t2X/AbojILtNAkZLIaCqisPUcEmlG0oczpjJ4ipa/YbtTB9Hi/maXAyrAEf9j2AoeJ5LwMipWnpTtYYkwW8pPFhmD4fAD+BWPgBMyWi3HBOgllaSTD+YTrkcCcXPiab1yZQqU3hOJQQ8HA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/Ju3XQBulM1ZYSwXdZJQpIO+zOlCqsyn2j2xXCfZ5U=;
 b=l1lrk8SiEGHvzg1iO5ee3YOWC47julLawalkxgHHZ6I4NswyykE4St8CA21m926OVLLxfZ2H94VWMjFaErx/Y3i6SdN54238M59yLxLD4kXddqHKnA/aEuFrdZRzRQcbYAweOtjiykVSmOehv7T1tGs7rdD/dOYtusw1G/0ZFaufFdQdAJQcKInm3tdVVSqgFTo0Otwh1KOHN0ujyWLk6b1FbhdXLlBlcuRlCPq4RUjTYP6mI9FeuZeCd75BCRbNvnjUNBxqode4VhunwtKb9eSZOlg6x2Dq/svBG2b4zw5eVBq04gXh7XZcYi33M1bSHmfJBfpRz/w7psS7ncxzhg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/Ju3XQBulM1ZYSwXdZJQpIO+zOlCqsyn2j2xXCfZ5U=;
 b=W2iD32JXBuCoF79NARWXGqSHQr3kmcF98EB5ZbetQ4xp5nU3yNo/HXWzrl1ADszforegvdgdesvVzZVJWp51nFr/m2pM8ONnkvs9GUVl8+nIypKBKYNJ7wauNEz0Cnka7zosyZwWp6sBaVIzzYjOMb7iCPUYoLWSoJOrtVvXJMM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1fe7210dbf1ab72
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrTrpxwt0Vcifmzcf6CswnH8VRx2lZY/fgBvpl0Jyu4gkCKYdzN+A7xlTup3HzzDt5VJQRdnHxV2Vz8AXxHVmgItK+s92je2wI2pT+X48RHi0FfIm86BQydqbVrEN0NW8WDjdKtUu0/FarVKPrhPkNZYa3ky1i7J9mKlS4qMZEsVTy0YtddRlJmgPVe4X3FbIXo/zyaxdwzMCUHrqz11ML/W01UsObj8a7oQ0s5NgjO3g3tJOJqDStMY7SBvosMEwrtJsiaBanPqcxDRNyK30Z/RxG7pD+4nsV8QeXV5XrCA6oJZxsgy7Ul4wFsQ8DtzmoSpwWMnXph9rS4MBg0nww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/Ju3XQBulM1ZYSwXdZJQpIO+zOlCqsyn2j2xXCfZ5U=;
 b=ndB+Z3xoA6MSiLLDJi2TmChpOKMAcxa/oMVDG4W+idSkIPR53Ez+K8MQEwE6mYwp9T3ongGNlsTZyFTO0v/P4vypyV4MfJhgHqOqSfFuJ8GJ3aPIgvGbusyhkKu2GUyBKjHk1+B/SAH3MGzHaS+SZjKTXYmycXneFgl3CpJoXBsFQYyw4eCw3q4Sx1AMryNEFaFf51Sh0LJZDzStKwh4Kw/6+VvoDJ6phfhDEejiRoYyGt+ptS7oSpzQFCnrHZp8iXsPPVwq70qFxny6aQa0LbWj4gcrbLWa1pigHoe6r3Vt/mfQVChiuOCrKB5A5uziwEScxJy/erKC8C6z5BlYqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/Ju3XQBulM1ZYSwXdZJQpIO+zOlCqsyn2j2xXCfZ5U=;
 b=W2iD32JXBuCoF79NARWXGqSHQr3kmcF98EB5ZbetQ4xp5nU3yNo/HXWzrl1ADszforegvdgdesvVzZVJWp51nFr/m2pM8ONnkvs9GUVl8+nIypKBKYNJ7wauNEz0Cnka7zosyZwWp6sBaVIzzYjOMb7iCPUYoLWSoJOrtVvXJMM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Clang-format configuration discussion - pt 2
Thread-Topic: Clang-format configuration discussion - pt 2
Thread-Index:
 AQHaHhwDfni7SbjBtk6S7YLD/w4HebCJbICAgAAi9QCABIyNgIAAK/0AgAAEPICAAAbTgIABQ2eAgAAI84CAAAP8AA==
Date: Tue, 28 Nov 2023 11:41:31 +0000
Message-ID: <E899324F-7808-430E-9CA9-B5BE2035D8A1@arm.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <1e770335-9606-4e9a-9f96-d04834675426@suse.com>
 <3E69667A-BB66-427D-A907-FA1537CFA1CC@arm.com>
 <838395c3-41ba-4004-abf1-948b655a5ef2@suse.com>
 <B5AF6A9F-3986-4F3C-90F7-122D63A2B31A@arm.com>
 <a99681e4-e201-4abe-bf6a-fda61674074e@suse.com>
 <8DE85ED0-2949-4FF1-832B-ABEDC86BF13B@arm.com>
 <53B2087D-A24C-45EF-BC4F-012714C718B3@arm.com>
 <bfc02fcd-8e0f-4f3f-a17b-c85c307878fd@suse.com>
In-Reply-To: <bfc02fcd-8e0f-4f3f-a17b-c85c307878fd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VE1PR08MB5839:EE_|DU6PEPF0000A7DE:EE_|PAXPR08MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: 39373469-d92f-405f-3dff-08dbf006fcd1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 o1g6nLoBBUjMGWyYkPk3Xjde4Rigj25WBKAzD2TOt2qiKGQ+1spcnIMw0n4qO0us7DumP6GLEBgU6YyhYMu4OdG3QGKG1Rc9GmidcqXS3ktQvi7aQECC35uH95fj7CHZ3c9CwZ5tggvaeEl62FUmAoqr+kUso41sa5zHuUjTAWHEXuvBMeyVbLAXpR2d7Mgoax/rDpIh5kwmWcG165hI2KzcZXJD4Wdh4P2aFi+BBoz51kZSfFqGF6PIRAGFzP+Ov4jtqsCxz50hUpb3CZDBGWe7Jliavtonw7f54Kd1UKZOsJ9v32r9QT/+cW2nz09+kbXPQo6OwKINZZZVqfB675ANBgP9wv8doFzsMRUDohfhvcB4LquFHcp8LcozuUCNgE91NH4yDtfdPRcx55F72K1jp8CCg31ZiMav3KYx3qLln9oIbGW9CJLOZuA6rm+42KxXSVoWzTqhGD8r3f91vvJKxOX64KlFzaPRIUvCQlxLZHUpcpu6kqBR2Snv01Yjlr5Bky9UCtIkbw6JxFtlOn/LUVQLtWha3AOMxTMeF/Qv+MQH55lgtGSzGp9nTDPNW2ofWWuPOJmiUZEm/rh4bB41dgWmvzvVQIOpGL5BC0t8xU6/ARd3HzQWxHEEqJDHyG7y6mTM4zPCz0fnijaXy2gq4a//PmXROVoBz0pjZzjtO9UBsMSCenVXZ/qluwzY
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(39850400004)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(66899024)(2616005)(26005)(6506007)(6512007)(71200400001)(53546011)(8676002)(8936002)(4326008)(6486002)(76116006)(86362001)(2906002)(54906003)(478600001)(966005)(5660300002)(64756008)(316002)(66446008)(91956017)(66556008)(66946007)(66476007)(6916009)(38100700002)(83380400001)(122000001)(38070700009)(33656002)(41300700001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1FE6775596C4D4792733544A3133214@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5839
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	600adb8c-2e1a-43ee-3133-08dbf006f753
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qF6psAlGHb7mZxyIFW2N6BDKs8o06i2Ba7UnC8o9gx93tt+b2153uqGFEjvgPfTfonqXSQZAChJB9wUFetJElJY1fHB+WGL633drgB8nVcALalwA0enD4ewMXG2z/Wd1mWuHsxAAZ2gL67lACDkQydUbombS6xy/OZGAMypSQuHxNJlNkuMYhP/edJpB3+3TrALw8+E2HTbXXu4RMLhbblbiz/0zIokYqBKiYyJw1/wJ4bXWljYxZu6nZghB4xXaJQyMLoB4mh2rqxkIfUlsDZh1dW7tC/jQYW539/lMVtrlmpTCIiGkP6p2bHJMlmRXFBcaOaGHNkRehZbui2E11yEoVjgAYnec505O410xKKmAvL/y5gNqlU4iOCv9ILBPeYK45BAqioD6Rz4Kleu8uAyOcu2CD2Ah4luUUw9Ew0enhnlN0o8eVuGI4T0imhmFdso3261KTxm2EDT0yRDzLkRt2YxLTrxffcWjEaNZ0CKhomOWJ2kwmHLQRI90opueEG7LhqtpwOyBfOfdrbkHonT4zyuJ9Wc7jI6JmafgnxWM/cxuG388MVdZvJr0cvNIw1rBqDrQXsM2e9F724hzIHKA7Db28ykAAlDatQismyTlWx3EfLOF66P72cpkDnF2KJt6TFY5K+DJvTeHZEQXlG22y8xhTxQmIufxfTNNyN7jy791DQIAgGstcyljZnrm8041oTXeTmTsO3+Ehe97I7COqaXT1RjLv0gYf8MgkcpOp6UWg/cLQcEgr1kBbLEd6YUp6+IhGhS1TW86obRe+A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(316002)(66899024)(70586007)(70206006)(54906003)(36756003)(53546011)(6512007)(6506007)(336012)(26005)(2616005)(6486002)(478600001)(966005)(82740400003)(81166007)(356005)(83380400001)(33656002)(86362001)(47076005)(36860700001)(40480700001)(5660300002)(2906002)(41300700001)(4326008)(6862004)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 11:41:40.5098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39373469-d92f-405f-3dff-08dbf006fcd1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6637

DQoNCj4gT24gMjggTm92IDIwMjMsIGF0IDExOjI3LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjguMTEuMjAyMyAxMTo1NSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gMjcgTm92IDIwMjMsIGF0IDE1OjM3LCBMdWNhIEZhbmNl
bGx1IDxMdWNhLkZhbmNlbGx1QGFybS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+
PiBPbiAyNyBOb3YgMjAyMywgYXQgMTU6MTMsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBPbiAyNy4xMS4yMDIzIDE1OjU4LCBMdWNhIEZhbmNlbGx1
IHdyb3RlOg0KPj4+Pj4+IE9uIDI3IE5vdiAyMDIzLCBhdCAxMjoyMCwgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+PiBPbiAyNC4xMS4yMDIzIDE1OjUyLCBMdWNh
IEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4+Pj4gT24gMjQgTm92IDIwMjMsIGF0IDEyOjQ3LCBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4+Pj4gT24gMjMuMTEuMjAy
MyAxNTo0NywgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+Pj4+PiBMZXTigJlzIGNvbnRpbnVl
IHRoZSBkaXNjdXNzaW9uIGFib3V0IGNsYW5nLWZvcm1hdCBjb25maWd1cmF0aW9uLCB0aGlzIGlz
IHBhcnQgMiwgcHJldmlvdXMgZGlzY3Vzc2lvbnMgYXJlOg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+
IC0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8y
MDIzLTExL21zZzAwNDk4Lmh0bWwNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBZb3UgY2FuIGZpbmQg
dGhlIHNlcmllIGludHJvZHVjaW5nIGNsYW5nLWZvcm1hdCBoZXJlOg0KPj4+Pj4+Pj4+IGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvY292ZXIvMjAyMzEwMzEx
MzIzMDQuMjU3MzkyNC0xLWx1Y2EuZmFuY2VsbHVAYXJtLmNvbS8NCj4+Pj4+Pj4+PiBhbmQgdGhl
cmUgaXMgYWxzbyBhIHBhdGNoIGxpbmtlZCB0byBteSBnaXRsYWIgYWNjb3VudCB3aGVyZSB5b3Ug
Y2FuIGZpbmQgdGhlIG91dHB1dCBmb3IgdGhlIGh5cGVydmlzb3IgY29kZS4NCj4+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+PiBGb3IgYSBmdWxsIGxpc3Qgb2YgY29uZmlndXJhYmxlcyBhbmQgdG8gZmluZCB0
aGUgcG9zc2libGUgdmFsdWVzIGZvciB0aGVtLCBwbGVhc2UgcmVmZXIgdG8gdGhpcyBwYWdlOg0K
Pj4+Pj4+Pj4+IGh0dHBzOi8vY2xhbmcubGx2bS5vcmcvZG9jcy9DbGFuZ0Zvcm1hdFN0eWxlT3B0
aW9ucy5odG1sDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBPdXIgY29kaW5nIHN0eWxlIGRvZXNu4oCZ
dCBtZW50aW9uIGFueXRoaW5nIGFib3V0IGFsaWdubWVudCwgc2hhbGwgd2UgYWRkIGEgbmV3IHNl
Y3Rpb24/DQo+Pj4+Pj4+Pj4gSSBjYW4gc2VuZCBwYXRjaGVzIHdoZW4gd2UgcmVhY2ggYWdyZWVt
ZW50IG9uIGVhY2ggb2YgdGhlc2UgcnVsZXMuDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gDQo+Pj4+
Pj4+Pj4gUXVhbGlmaWVyQWxpZ25tZW50OiBDdXN0b20NCj4+Pj4+Pj4+PiBRdWFsaWZpZXJPcmRl
cjogWydzdGF0aWMnLCAnaW5saW5lJywgJ2NvbnN0JywgJ3ZvbGF0aWxlJywgJ3R5cGUnXQ0KPj4+
Pj4+Pj4+IA0KPj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4+IEZvciDigJxRdWFsaWZpZXJBbGlnbm1l
bnTigJ0gSSBjaG9zZSBDdXN0b20gaW4gb3JkZXIgdG8gYXBwbHkgaW4g4oCcUXVhbGlmaWVyT3Jk
ZXLigJ0gYW4gb3JkZXIgZm9yIHRoZQ0KPj4+Pj4+Pj4+IHF1YWxpZmllcnMgdGhhdCBtYXRjaCB0
aGUgY3VycmVudCBjb2RlYmFzZSwgd2UgY291bGQgc3BlY2lmeSBhbHNvIOKAnExlYXZl4oCdIGlu
IG9yZGVyIHRvIGtlZXANCj4+Pj4+Pj4+PiB0aGVtIGFzIHRoZXkgYXJlLg0KPj4+Pj4+Pj4gDQo+
Pj4+Pj4+PiBXaGVyZSBkbyBhdHRyaWJ1dGVzIGdvIGluIHRoaXMgc2VxdWVuY2U/DQo+Pj4+Pj4+
IA0KPj4+Pj4+PiBJIHRoaW5rIGZ1bmN0aW9uIGRlY2xhcmF0aW9uL2RlZmluaXRpb24gYW5kIHZh
cmlhYmxlcy4NCj4+Pj4+PiANCj4+Pj4+PiBIb3cgZG9lcyB0aGlzIHJlbGF0ZSB0byBteSBxdWVz
dGlvbj8gSSBhc2tlZCBhYm91dCB0aGUgc2VxdWVuY2Ugb2YgZWxlbWVudHMNCj4+Pj4+PiBsaXN0
ZWQgZm9yIFF1YWxpZmllck9yZGVyOiwgd2hlcmUgYXR0cmlidXRlcyBkb24ndCBhcHBlYXIgYXQg
YWxsIHJpZ2h0IG5vdy4NCj4+Pj4+IA0KPj4+Pj4gU29ycnksIEkgbWlzcmVhZCB5b3VyIHF1ZXN0
aW9uLCBhdHRyaWJ1dGVzIGFyZSBsaWtlIGludmlzaWJsZSBmb3IgdGhlIHRvb2wsIHRoZXkgY2Fu
IGJlIHBsYWNlZCB3aGVyZXZlciBiZXR3ZWVuDQo+Pj4+PiBlYWNoIG9mIHRoZSBRdWFsaWZpZXJP
cmRlciBpdGVtcy4NCj4+Pj4gDQo+Pj4+IEhvaG8sIG9uZSB0aGluZyB3aGVyZSB2YXJpb3VzIG9w
dGlvbnMgYXJlIHRvbGVyYXRlZC4NCj4+IA0KPj4gSSByZWFsaXNlIG5vdyB0aGF0IG15IGFuc3dl
ciBhYm92ZSBpcyBub3QgZnVsbHkgY29ycmVjdCwgSSB3YW50ZWQgdG8gc2F5IHRoYXQgdGhlIGF0
dHJpYnV0ZXMgYXJlIGxpa2UgaW52aXNpYmxlIGZvciB0aGUgdG9vbA0KPj4gb25seSB3aGVuIGRl
YWxpbmcgd2l0aCB0aGlzIHJ1bGUgYWJvdXQgb3JkZXJpbmcgb2YgdGhlIHF1YWxpZmllcnMuDQo+
PiANCj4+IE9uIHRoZSBvdGhlciBoYW5kLCB5ZXMsIGlmIHRoZSBRdWFsaWZpZXJBbGlnbm1lbnQg
aXMg4oCcTGVhdmXigJ0sIGNsYW5nLWZvcm1hdCB3b27igJl0IHRvdWNoIHRoZW0uDQo+IA0KPiBI
bW0gLSBnZXRzIG1lIGJhY2sgdG8gd29uZGVyaW5nIHdoYXQgIkFsaWdubWVudCIgaW4gdGhlIG5h
bWUgaXMgYWJvdXQsIHdoZW4NCj4gb3JkZXIgb2Ygc3ludGFjdGljYWwgZWxlbWVudHMgaXMgYWZm
ZWN0ZWQuDQoNClllcywgcHJvYmFibHkgUXVhbGlmaWVyQWxpZ25tZW50IGlzIG5vdCB0aGUgYmVz
dCBuYW1lLg0KDQo+IA0KPiBKYW4NCg0K

