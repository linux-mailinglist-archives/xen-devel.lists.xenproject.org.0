Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6F07EB2F1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:00:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632715.987099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2utl-0000iS-Lr; Tue, 14 Nov 2023 15:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632715.987099; Tue, 14 Nov 2023 15:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2utl-0000fF-II; Tue, 14 Nov 2023 15:00:17 +0000
Received: by outflank-mailman (input) for mailman id 632715;
 Tue, 14 Nov 2023 15:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHxF=G3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r2utj-0000an-1h
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:00:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84017d4f-82fe-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:00:14 +0100 (CET)
Received: from AM6PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:92::17)
 by DU5PR08MB10680.eurprd08.prod.outlook.com (2603:10a6:10:525::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 14:59:45 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:92:cafe::c8) by AM6PR04CA0004.outlook.office365.com
 (2603:10a6:20b:92::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 14:59:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.14 via Frontend Transport; Tue, 14 Nov 2023 14:59:44 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Tue, 14 Nov 2023 14:59:44 +0000
Received: from 697789ec300b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FF3B7BF2-E312-41B8-8E1F-3D63B6549F9C.1; 
 Tue, 14 Nov 2023 14:59:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 697789ec300b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 14 Nov 2023 14:59:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB6724.eurprd08.prod.outlook.com (2603:10a6:20b:30b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 14:59:36 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 14:59:36 +0000
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
X-Inumbo-ID: 84017d4f-82fe-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Sn6st5hWoxK6uEkjYWBv3XI40/cM3UouBt4Kyq6Izz8QxAfE/6X1gO5z2UfJ/Arx1YQ9kRZhoRFdsosKCTfJGNHwVY/8qcom/0wsVsToWuBrAWESC3Nfuz22L35EAkQlOxbRHWPMaOuw9nkdtDSInYGCy9IYXgQTjMy2G6Qnfz6G7blqg3kFgl8YWG10thuoIt175UpfZyeP548DJZKNVZ4IEAUqJooqpl5pgZAuzEOcMkAY74Lu3Lxetg2Ar2SHN5dZDaMfUq5el7IbGZH+J1NxGQWR+0mwPNxEMJQBiW12h1ERDrNb/P+h3sLxmQ05ttfNbQQVQZ4FtRTv0/uPrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoLO2VKz048EC/OL4qJdHfqByj6btyet2Umehb2LgA4=;
 b=LcAgrwtfKsd5fOfsVVji31gDiLVHwJ+NFYIuBxTVTpwwiR/ufeZptLnijMa6JoXoe6VH0bBKCqa7c1SjA8jazsQity2pZR7oHrTLmjHiTnEHg3AcpWo9qQLq898flXcp1fz61u/+lvbx/+NkmO34cNrNgGaeHhDNAqX38413NsE2EixsRzS1moSOzZfMq7bZPyxzd0oWRFSUnM36QdYG4ic7R+tnxKqp+05CYVH3NXtVYec+uwEEIPQ+pUfc84agW8xkIuLyKYpE24zqQOozqb70OirmiFa/tqCUgSH7f9szzyYka+fCH79YShF54pgQylEYagz6fRxTxUi+qc97Tg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoLO2VKz048EC/OL4qJdHfqByj6btyet2Umehb2LgA4=;
 b=Fr4DQ/3JpVf7aBdOJSf8tiBhVyLqviZEYRrPUO0XYEAsT0gwlrlueKSSoIRuIqKgv0UjLDFFEoFJNd7IgI4X6+AGnkbHpwUa0QmwmQwz3P5E1Jb1Tk4VCmvFLrczMpYmKYEI5WL5nHj75PpaI97h83TUgjU6IcnEyWRBFQuSPk0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3182766d15007e1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOYEbq5Wk5IQEJ+YgLqvUpvvmgZ2LL33y6PR1cr5EV4uKU6iA+wLxo6qSiYxUINe6AFUsgsEfhFwykzc8Lj2Y1kxTU6lP15Zb7Ztzy5vuZj8E11mCwpZp4xQjPUy++to/Igig3psd/RZh8552FMhBqJDB3z4+8BXw8uIPbu8SGOS54ivgGsAB8mKXKjVk5uoFR4f9AP+cuNPXjMT1Q1R0g9ItbEe0iOn1Dv/9lY4Dyu8ofmAMNrQqPVpQ44rFH6iztq4G5XYf3/W6UXtCT0K09JTNTIKrUDl+Jv1oha/i1m653y3pSpDQVL3sXxjejZhadPLuYQm8mImvYJEzS0p3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoLO2VKz048EC/OL4qJdHfqByj6btyet2Umehb2LgA4=;
 b=CqjpYXvMFfz7o6zRzSEDgznNxQJLIh5BFcpclv7iSPn26iDpgP6lI2ja+VYMrAQeVpl8YluTkjOa21X3qH3X2K1JHT3gE7iiRKyBr0Z3mACiKTIoe6kx4rRAT+KYOoy17XhL1mJrxIPH7FWYcqZEyE7fNkb5XfAmJwfyaZqL/c3iQb3kWJnJ24s9YkErBketCtYq2nZYj+1CPCjDwm56gp+sotlHsOSowXlpEwtS1VKLa2+74E8A1Cy0HkSj1Ii9HxV0tRplJnzoMzIDrHTl74l0QMEc8g32GM9vFG++izP6OXchoW1Tnr9imS5eT0kqJCXCpJiJQ2aY/Kv7K8Wj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoLO2VKz048EC/OL4qJdHfqByj6btyet2Umehb2LgA4=;
 b=Fr4DQ/3JpVf7aBdOJSf8tiBhVyLqviZEYRrPUO0XYEAsT0gwlrlueKSSoIRuIqKgv0UjLDFFEoFJNd7IgI4X6+AGnkbHpwUa0QmwmQwz3P5E1Jb1Tk4VCmvFLrczMpYmKYEI5WL5nHj75PpaI97h83TUgjU6IcnEyWRBFQuSPk0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Alejandro
 Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: Clang-format configuration discussion - pt 1
Thread-Topic: Clang-format configuration discussion - pt 1
Thread-Index: AQHaEild8psuTSSrb0SmQq+9AXKRR7B4JX+AgABAHYCAABLFAIABeZyA
Date: Tue, 14 Nov 2023 14:59:35 +0000
Message-ID: <31A47242-54F9-42D4-B804-6D0A0392650C@arm.com>
References: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
 <930d7aa7-7573-97d2-e146-ebe68214c0aa@suse.com>
 <7235E3F4-8387-49D7-A3B6-0EA93CAE408B@arm.com>
 <30a94519-c622-6017-2cbf-35690114d49e@suse.com>
In-Reply-To: <30a94519-c622-6017-2cbf-35690114d49e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB6724:EE_|AMS0EPF000001AC:EE_|DU5PR08MB10680:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9cf6b5-09c9-4178-8791-08dbe52256a8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EfrcNRqWtgZqTBEFgEmYw9uiUx/kzkXRYf7f3/xL/5fbqp4qjByh7aP9okGYn1JrhSj5WZxt9UDn8yWJ3lMwvR2nnH1hp9HR+7PQ4nzR6Fl2ITBxaj1PjacV100njFBM2ygyQG6NCtod6/Szm+Z2+2hwFViXpqUWsb9nw/xha9n2Ze2uNG7bfbIvUtk6ja0PU+/h7ZcUA1vpXP1ZKtKJJb5Hi7SxavuitUpgC8KbuLdMPWrY8+rGPSRSCXhJYECJAqxw06NBoS7LaBarhvcnFQZA7SRV9WwuzsBktN+X+g9Ui2gCDVbKjbCNa9v08F0uc1Vtvcqp74G1wfPG/Uk2QhqiQXfhQMm9fqn6UEGVb4/zlUwMoR1IUuiiR4fRcdX7e52DRFxvIFyZupyZRrHOFQcYURNefPQZnLil/VsnOpTGoQq4mSfDdCOvNozuhWv0Ick07O+t5JHop/+vEaZ2XGrfl8qZ3Va+myduaAh5sKr9vu+DcGlYYK/AaRWMF4MNqzaB3awnz+Y4pq8+IoQidRr7njZBLHm19bvaSNgpcqIXRMvCAteIEnZUFNxRYzC/L6pVKwv4rY/fMBokR7pqnmgefFZIgZTDeoCDaAKX5xh9227bJNAqX/TJxfS/8mMJPpNC1fIJiYOjmihdimNbGA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(136003)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(478600001)(38100700002)(41300700001)(316002)(86362001)(33656002)(36756003)(76116006)(66446008)(66946007)(66476007)(66556008)(91956017)(6916009)(54906003)(64756008)(2616005)(122000001)(6486002)(5660300002)(7416002)(26005)(53546011)(6512007)(6506007)(71200400001)(8936002)(8676002)(4326008)(83380400001)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CF7AC9F1B900A4D880D83AA78E5D687@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6724
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	216ad739-7620-4e3a-2e21-08dbe5225165
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ehxEpaF7bdqxSCg5BchNOGAo2SsZOpgMwiKdIsVGHLNxk7xdHraS4+WVWH0H5zijWrPhBDVKzU2uo/IRGBIFuBLBBNM6UyHQpChyapWyh0YsoLubqaYLRTlngvlUPFCcjeDBBVk3X9UU8AxrDlsyqdfL3Xt/KaiWYacHpEfovsAePZdL1B8x96UG8k9GPu+nNfFv+303kYwhGMDMYIg82KQoEACrcJfUDSzZKlAdX2QmzKYgozzuiTOEerARsa/xaQijYN+do/s/KMRdgFEXAlpdpbMpl0tA9ov+Vh2osYYcBh03XU8m8Nn5ZRLbAtmFIOd464F63jjctSkk/btzYO9CEDwdDCkgs/JVgtoslRiwRBHucm5beaWk8FED4PhdUgfVyEYq4gr60zX2d1CWDFs0vbQdRqbap35d1QNBYlCQAb5BP9aSV4P8/76KK9E1Bf+7zuBYKIU45FKgrH4VLOhEE6a02leGzzsyQSrJ/BmrhQAKONEDx8eCgqe34uGGwZNp3TFkiGddq2xX72/SZ8cWvVXGlalf3T66cRmuBu6gy0P8j4vSnwioYYNCRhiqhLdubPxyn+RxItim3IQdaEle3hpz3+R1w5Uk1t3/RlKYMxkbWuc8wxox8COG12ZOPqdDRTkr1fWS3bnTB9BIKRZpy4IY0tGAoStl6IbBNHAU+YMTU5YXE+uDG0AOTE/hB+58lD5lP6ob6BLOqiTRnCDP3TNLQAkqQgON61wJVb1UqN3MBP4ICwaFPRCNDZL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(451199024)(82310400011)(1800799009)(64100799003)(186009)(46966006)(36840700001)(40470700004)(40460700003)(107886003)(26005)(6506007)(53546011)(2616005)(6512007)(36860700001)(83380400001)(47076005)(5660300002)(4326008)(8676002)(6862004)(8936002)(2906002)(41300700001)(6486002)(478600001)(316002)(70206006)(54906003)(70586007)(336012)(36756003)(86362001)(33656002)(356005)(82740400003)(81166007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 14:59:44.7809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9cf6b5-09c9-4178-8791-08dbe52256a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10680

DQoNCj4gT24gMTMgTm92IDIwMjMsIGF0IDE2OjI3LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTMuMTEuMjAyMyAxNjoyMCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAxMyBOb3YgMjAyMywgYXQgMTE6MzEsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMDguMTEuMjAyMyAxMDo1MywgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPj4+PiANCj4+Pj4gU3RhbmRhcmQ6IEMrKzAzDQo+Pj4+IA0KPj4+PiAtLS0NCj4+Pj4gRnJv
bSB0aGUgZG9jdW1lbnRhdGlvbjogUGFyc2UgYW5kIGZvcm1hdCBDKysgY29uc3RydWN0cyBjb21w
YXRpYmxlIHdpdGggdGhpcyBzdGFuZGFyZC4NCj4+PiANCj4+PiBTaW5jZSBJIGNvbnRpbnVlIHRv
IGJlIHB1enpsZWQgLSBpaXJjIHlvdSBzYWlkIHRoaXMgaXMgYmVjYXVzZSBvZiBsYWNrDQo+Pj4g
b2YgYXZhaWxhYmlsaXR5IG9mICJDOTkiIGFzIGEgdmFsdWUgaGVyZS4gV2hhdCdzIGVudGlyZWx5
IHVuY2xlYXIgdG8NCj4+PiBtZSBpczogSG93IGRvZXMgdGhpcyBtYXR0ZXIgdG8gYSB0b29sIGNo
ZWNraW5nIGNvZGluZyBzdHlsZSAod2hpY2ggaXMNCj4+PiBsYXJnZWx5IGFib3V0IGZvcm1hdHRp
bmcsIG5vdCBhbnkgbGV4aWNhbCBvciBzeW50YWN0aWNhbCBhc3BlY3RzKT8NCj4+PiANCj4+Pj4g
VGhpcyB2YWx1ZSBpcyB1c2VkIGFsc28gaW4gTGludXguDQo+Pj4gDQo+Pj4gQ29uc2lkZXJpbmcg
aG93IGRpZmZlcmVudCB0aGUgdHdvIHN0eWxlcyBhcmUsIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcw0K
Pj4+IG92ZXJseSByZWxldmFudC4NCj4+IA0KPj4gT2ssIG1heWJlIEkgdW5kZXJzdGFuZCB5b3Vy
IHBvaW50LCB5b3UgYXJlIGxvb2tpbmcgZm9yIGEgcmVhc29uIHRvIGRlY2xhcmUgdGhpcyBjb25m
aWd1cmFibGUgaW5zdGVhZA0KPj4gb2Ygbm90IHNwZWNpZnlpbmcgaXQgYXQgYWxsPw0KPiANCj4g
Tm90IHJlYWxseSwgbm8uIEhlcmUgSSB3YXMgbWVyZWx5IHNheWluZyB0aGF0IHdpdGggdGhlIHN0
eWxlcyBiZWluZw0KPiBzdWZmaWNpZW50bHkgZGlmZmVyZW50LCB3aGF0IExpbnV4IHVzZXMgaXMg
cHJvYmFibHkgbm90IHZlcnkgc2lnbmlmaWNhbnQNCj4gZm9yIG91ciBvd24gZGVjaXNpb24uDQo+
IA0KPj4gSWYgaXTigJlzIHRoYXQsIGZyb20gd2hhdCBJIHVuZGVyc3RhbmQgY2xhbmctZm9ybWF0
IHdpbGwgdXNlIHRoZSBkZWZhdWx0IHZhbHVlIGlmIHdlIGRvbuKAmXQgc3BlY2lmeSBhbnl0aGlu
Zw0KPj4gZm9yIHRoaXMgb25lLCBzbyBpdCB3aWxsIHRha2Ug4oCYTGF0ZXN04oCZLiBJIHRoaW5r
IHdlIHNob3VsZCBwdXQgYSB2YWx1ZSBmb3IgdGhpcyBvbmUgdG8gZml4IGl0IGFuZCBkb27igJl0
IGhhdmUNCj4+IHN1cnByaXNlcyBpZiB0aGF0IGJlaGF2aW91ciBjaGFuZ2VzIGFuZCBzZWVpbmcg
dGhhdCBhbHNvIGluIExpbnV4IHRoYXQgdmFsdWUgaXMgZml4ZWQgaW5jcmVhc2VkIG15DQo+PiBj
b25maWRlbmNlLg0KPj4gDQo+PiBIb3dldmVyLCBpZiB5b3UgZmVlbCB0aGF0IHdlIHNob3VsZCBu
b3Qgc3BlY2lmeSBpdCwgSeKAmXZlIGRvbmUgYSB0ZXN0IGFuZCBub3Qgc3BlY2lmeWluZyBpdCBp
cyBub3QgY2hhbmdpbmcNCj4+IHRoZSBjdXJyZW50IG91dHB1dC4gSSBjYW7igJl0IHNheSB0aGF0
IGZvciBhIGRpZmZlcmVudCBjbGFuZy1mb3JtYXQgdmVyc2lvbiB0aG91Z2ggb3IgaWYgY2hhbmdl
cyBoYXBwZW4gaW4gdGhlDQo+PiBmdXR1cmUuDQo+IA0KPiBJdCdzIGZpbmUgdG8gc2V0IHZhbHVl
cy4gQWxsIEknbSBzYXlpbmcgaXMgdGhhdCBhdCBsZWFzdCBJIHdvdWxkIHByZWZlcg0KPiBpZiBp
dCB3YXMgYWxzbyBjbGVhciB3aGF0IGV4YWN0IGVmZmVjdCB0aGUgc2V0dGluZyBvZiBhIHZhbHVl
IGhhcywNCj4gZXNwZWNpYWxseSB3aGVuIHRoYXQgZG9lcyBub3QgcmVhbGx5IG1hdGNoIHRoZSBs
YW5ndWFnZSB3ZSB1c2UgaW4gdGhlDQo+IHByb2plY3QuDQoNClllcyBJIGFncmVlLCBJIHRoaW5r
IEFsZWphbmRyb+KAmXMgcmVwbHkgdG8gdGhpcyBjb25maWd1cmFibGUgcmVmbGVjdHMgbXkgdGhv
dWdodHMgYWJvdXQgaXQuDQoNClNvIGlmIHdlIGFsbCBhZ3JlZSB0aGF0IHdlIHNob3VsZCBzZXQg
dGhpcyBwYXJhbWV0ZXIsIGRvIHdlIGFsbCBhZ3JlZSB0aGF0IGl0IHNob3VsZCBiZSB0aGUNCnZh
bHVlIGFib3ZlPw0KDQpEbyB5b3UgaGF2ZSBvdGhlciBjb25jZXJucyByZWdhcmRpbmcgdGhpcyBv
ciB0aGUgb3RoZXIgcGFyYW1ldGVycyBpbiB0aGlzIHRocmVhZD8NCg0KDQo=

