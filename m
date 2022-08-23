Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7E459E66C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 17:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392051.630181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQWHD-0006OE-TC; Tue, 23 Aug 2022 15:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392051.630181; Tue, 23 Aug 2022 15:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQWHD-0006Lw-Q7; Tue, 23 Aug 2022 15:57:15 +0000
Received: by outflank-mailman (input) for mailman id 392051;
 Tue, 23 Aug 2022 15:57:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jact=Y3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQWHC-0006Lq-4E
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 15:57:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40b97fe4-22fc-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 17:57:13 +0200 (CEST)
Received: from AM6P192CA0071.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::48)
 by AM0PR08MB3634.eurprd08.prod.outlook.com (2603:10a6:208:d6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 15:57:10 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::fc) by AM6P192CA0071.outlook.office365.com
 (2603:10a6:209:82::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.17 via Frontend
 Transport; Tue, 23 Aug 2022 15:57:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 15:57:09 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Tue, 23 Aug 2022 15:57:09 +0000
Received: from 6c31b2fb5787.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E70CE227-5BD4-43C9-8DF9-11C161DF4900.1; 
 Tue, 23 Aug 2022 15:57:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c31b2fb5787.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 15:57:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7441.eurprd08.prod.outlook.com (2603:10a6:102:2b9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 15:56:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 15:56:59 +0000
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
X-Inumbo-ID: 40b97fe4-22fc-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SgyZHESH59XX0bvdYwhFqGvhVN8dG9NQTr8yDemlZKw63rZTz/YpjEVbVNc2QwKxZ68YDi3+pasNQiwjnAMwnp46+SPcu87qxYP3gehgWwBnLaUc/5Rfm0VpfNTiZcoLZnSq3UeWVDRo268Xjpb/2jr7HSlwnUArDu7t4Cs2AG3TiIfmYbRKRLEFe3s7B/6XEvxY5s3Bgv2H2GsnIyBRi99FPgmlb5GbEqFmqE5qZOH138p4RaA8Jkdf7h9Wb649Ol/hO5VqTnw6X7Rs2H18jucDscKzIRbZ3UHFTBcAaIKgK1gHFyOwboloJInfZi+Dt96QLF3NunBBGpSjFXmtxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcZVFge0LIqYKORMto2zGpILYilLeRdPa+Ojl9VHZ7Y=;
 b=EHgbirSNFndimh423++p7TKh1eco6UepsrjmSFvY1TLQUC44duX7Tz2ptKduv39ufm5/sG2HL6X6YP78j+C8IU/sviyIqfW9uQ74Rv4PLKoCpZ6nAwjPGfZq7nfHSVaQ3VQb8nBPNbBc1g7vOVwYnHadFhBXlVHiteq5CyiaS9+588FG9IEEmrmV012TTs1GWL2KEgXoEyQZ9+f3Yw3TUQqteINcvvKplq2KGEs//x2lyCvhm/NCC1ilI86n3Jttu/EjJ8Q+Co2XEd2xwh5ZRiqvqFx5BX3CtJu50AATrBKO1YV6o8BCDdvFsHSzmvCj63jtHTXBFvodKo+4Khh37A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcZVFge0LIqYKORMto2zGpILYilLeRdPa+Ojl9VHZ7Y=;
 b=uNrKRr3g7mIQHCcI5FlOoHWOjRS4twmXdlO1HfgtTzHX030RqmF9pYpbSSccauANFR/dBT01suotCzK3sVAhCCrwZk9u2UTrADEs5oaaPlFD+I/gJm4NGEUvPn4QBr6XiWbyPreLik/Xh4FghyIarebi0Qpckib35JxXo+qhVHE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba356667759090da
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwC/NQHbmml/8Xw9axxaLN9fq22ppCnLhgghddzdwETevoqhFiqoU2KJfqnTAxQhg7cZerXT/kXnGMKw1Gy84yATNJOB7l276Lk2666TYbx3RW/QVQPnFBtS2+Go52UFNIZXYo+sJ6cT0Mvj17wZcOhTCKKPz+k1LXpv5jFKBwVWcoGQ0HX6pVX+Ziphxbme17K80qYelx+MfZ4q7OfGYQfvz2pQmh8UvrbS7bR9HjzKCh/ImOhmhFLKSeUv/5NXPYr+UESif/9UvbCNqYtnZo8fkfIpL1ufVMJ5CvQiguHLl2/LIa8NgfTQQqIOZMsMmgGJTM2xGr7cHnFZKGqSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcZVFge0LIqYKORMto2zGpILYilLeRdPa+Ojl9VHZ7Y=;
 b=PFO2XO4SD6PmN1F+f8abv6FHZXqdKcioMcOL0wRSr7x6BuwUXoVBy5xb7UOkqeQO7V2hS455JelWVtAdTGeXqKlJd89JZybTqkblffbV5KikydGD6OEGXkHUDC3/hfCyu2HqechacMTO/k3wmcg1a+M2bgilXYpy6E79aEHTGiWwz0ro7SoYB1oFevX4k5Io3ACBQAPkCXAK0wsH0rrYJxvONCBNLv9Oin8u4Aa2vR+JitOaSc2HdYRoLfmSWJ/5BfVGcURJF5sHrHxzs2GAXWUnu0KzVEowPlqcRYdjL21YuN6DKSxOd0o/1IHihLg3ejSTSE0VdAt86SglAqqMPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcZVFge0LIqYKORMto2zGpILYilLeRdPa+Ojl9VHZ7Y=;
 b=uNrKRr3g7mIQHCcI5FlOoHWOjRS4twmXdlO1HfgtTzHX030RqmF9pYpbSSccauANFR/dBT01suotCzK3sVAhCCrwZk9u2UTrADEs5oaaPlFD+I/gJm4NGEUvPn4QBr6XiWbyPreLik/Xh4FghyIarebi0Qpckib35JxXo+qhVHE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Topic: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Index:
 AQHYttqU3r7Sk/IKHkKroerrTRS8F628a1KAgAARJACAABAJgIAAAokAgAAIAACAAAnuAIAAA0iA
Date: Tue, 23 Aug 2022 15:56:59 +0000
Message-ID: <F1E1B306-5C4C-44C1-B4BE-E546B0B67C97@arm.com>
References:
 <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
 <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
 <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
 <74994bdd-8c70-7f5c-2146-157a36c843a0@suse.com>
 <87AD61AE-5C50-4F04-AF60-300C6A113A85@arm.com>
 <C7766EB8-B741-4443-99C3-EB14C1EA9804@arm.com>
 <348e6d5c-d846-3d8a-e26c-316ba6a98938@suse.com>
In-Reply-To: <348e6d5c-d846-3d8a-e26c-316ba6a98938@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4e56af6c-4356-410c-9f3b-08da852022ee
x-ms-traffictypediagnostic:
	PAXPR08MB7441:EE_|VE1EUR03FT043:EE_|AM0PR08MB3634:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IG5dyBx4byIGe6iM950914w8QA4j6xbbZz8/PJUpSQRbg8rQ2R0n7Lkq7bjARPplaPGGhMQhJmF22yvzmLaKETfu88E4rvn1nEFK/WW/BtIijSsG8taQpTM+doNoxxPFRwPANEzoEWUDxY98HMwPr62U0zA0CJkwzY22gTjb/KVdzyaDn5xIPUi+qIK/K5st9lmTvsZxA+TxPuXDxqCY05/cEhtQQLmaYvfNSagVViFf7PbdQiM4H5614OM/rKFAIZd1Lb+6u0DzCy5K2INZw2seUFnJC7CjbFrEQ5evEBav+xU+Y9w7ogexmnYKbY4uIJWQO+RIynplB6jjUiQzV18vgWel8Rzglj3zwAc5wsVAGjFbbyGEd7sO5Sp3IoV+ySHftdsCH3NlHMNk62Cljab0A2wWGWKNy7nTv2nCzVI+j32bZ2ImVvdEWrqaxX+oBRXUTXMmkVSWD7gjZkEDeetUIan8u7KjCZZWe446lJFVdw27oqeiJmNrM/37IcBpCdigMLdASUtAEFDLHl6hmcQiZclgqsKKUR4r/7gG18jHYydhCDpJEiuXuLtgoSOw/fLBMY9zU/bUbRNMND5C9olZzfQHvcHyqUX5djQiF0hKqEKeIHfb1m4uPTOxpQYGZ760rvTNtvo41IGdNFkaof8QcoaJbS4E6zbEtKHH0o8QDsr52JSEv3L1ezPApLkOF3jnoDKkQtJdT5ypc+cS7SGYl4bxx5ScnOUT4MMdsbqsH9HHytu5yVyVxTgu0TRD5geIdfaOVYu6DB/LlXdHehR0TJurwrB9YED1SgEuAy0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(2906002)(6512007)(83380400001)(26005)(2616005)(6506007)(53546011)(186003)(33656002)(38070700005)(86362001)(38100700002)(122000001)(64756008)(6486002)(66946007)(8936002)(76116006)(41300700001)(316002)(66476007)(5660300002)(66556008)(66446008)(6916009)(54906003)(478600001)(36756003)(71200400001)(4326008)(8676002)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0364A493FA7FA146A1933A9539151748@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7441
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48be348a-809d-4bc2-6831-08da85201cfb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bfit6ZG8mbdj1NrD8qcwObCgDU4BBDLCY/XEhwn/9m7Ogws6EqW6t2cZAz40QtkbIMbXOVwO/UxDe8FycNCYnuGas33QTXpnScCs4THH3Q9fXEePE04LuC3Z6jNojXNeDGuN/j7Grn6rOhb6lJdNITrcPczK7ij0lWM2ZtKxBCCa+LqzcPwURomWkfzo896j45EhZpWfLVKYi6Zl4LYU7SzWIJoFXxPlEJ/1NOJhi5/oyd01eLqBnhsRQY6eV0Fo4lxmTeM/kYrb8omMhZSwyRO1I/Vx2+e5VwX19IqvRyJE5q0cwc2aZC3S2LHRz2k8/ZfSwnhu+mFE8yhhcO315rtTCm3eTELOeOr9AqFOqWxUxfF9XzoEU0qyNrHpcKAis9+X9/5G5UtL37UAT7unV+I0pyvBHYik2sGjCY8inx3latn+coETGx5hisTqFASyKxlIyI0/FoFcuYxCcW2+Hb8ibYQl+zq+Y08C04heOpKEuVvnu24RRPhpZ8pdjib+iCfSXJjxT0PfnlG0MyJlLqXA8X2LxilsP250pv99Hp3hb/mmsnjxosH1oD0s5niKpPCl/8nHX+UCQcLuSfjhGLjj2v8WUBK7fpjpoi4ZI6jGMBkCf1tnP4C2wLNnQZncuTVaMutTpFB1uUctSmzoXbaSRlbreaxGVK5PSsLymbZoCAevs6dIBF7I2HzRXOiX/0FFVpPFZnLm1W/e9XsV8T/uopjXHBEbx0PFU3GYi90x4/cIw1e/hNsrSsIV8PyfW+Nwzt2VVoPaCKRVYI/DRA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(40470700004)(36840700001)(46966006)(82310400005)(8936002)(70586007)(8676002)(4326008)(6862004)(5660300002)(70206006)(6486002)(6506007)(33656002)(53546011)(26005)(41300700001)(6512007)(36756003)(2906002)(336012)(2616005)(83380400001)(186003)(478600001)(47076005)(40480700001)(81166007)(40460700003)(356005)(86362001)(36860700001)(316002)(54906003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 15:57:09.6451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e56af6c-4356-410c-9f3b-08da852022ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3634

DQoNCj4gT24gMjMgQXVnIDIwMjIsIGF0IDE2OjQ1LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjMuMDguMjAyMiAxNzowOSwgQmVydHJhbmQgTWFycXVp
cyB3cm90ZToNCj4+PiBPbiAyMyBBdWcgMjAyMiwgYXQgMTU6NDEsIEJlcnRyYW5kIE1hcnF1aXMg
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+Pj4+IE9uIDIzIEF1ZyAyMDIyLCBh
dCAxNTozMSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4gT24g
MjMuMDguMjAyMiAxNTozNCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+PiBPbiAyMyBB
dWcgMjAyMiwgYXQgMTM6MzMsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6
DQo+Pj4+Pj4gT24gMjMuMDguMjAyMiAxMjoyNCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+
Pj4+Pj4gLS0tIGEvdG9vbHMvbGliYWNwaS9ta19kc2R0LmMNCj4+Pj4+Pj4gKysrIGIvdG9vbHMv
bGliYWNwaS9ta19kc2R0LmMNCj4+Pj4+Pj4gQEAgLTE4LDYgKzE4LDE2IEBADQo+Pj4+Pj4+ICNp
bmNsdWRlIDxzdGRsaWIuaD4NCj4+Pj4+Pj4gI2luY2x1ZGUgPHN0ZGJvb2wuaD4NCj4+Pj4+Pj4g
I2lmIGRlZmluZWQoQ09ORklHX1g4NikNCj4+Pj4+Pj4gKy8qDQo+Pj4+Pj4+ICsgKiBXaGVuIGJ1
aWxkaW5nIG9uIG5vbiB4ODYgaG9zdCwgYXJjaC14ODYveGVuLmggd2lsbCBpbmNsdWRlIHhlbi5o
IHdoaWNoIHdpbGwNCj4+Pj4+Pj4gKyAqIHRyeSB0byBpbmNsdWRlIHRoZSBhcmNoIHhlbi5oIChm
b3IgZXhhbXBsZSBpZiBidWlsdCBvbiBhcm0sIHg4Ni94ZW4uaCB3aWxsDQo+Pj4+Pj4+ICsgKiBp
bmNsdWRlIHhlbi5oIHdoaWNoIHdpbGwgaW5jbHVkZSBhcmNoLWFybS5oKS4NCj4+Pj4+Pj4gKyAq
IFRvIHByZXZlbnQgdGhpcyBlZmZlY3QsIGRlZmluZSB4ODYgdG8gaGF2ZSB0aGUgcHJvcGVyIHN1
YiBhcmNoIGluY2x1ZGVkIHdoZW4NCj4+Pj4+Pj4gKyAqIHRoZSBjb21waWxlciBkb2VzIG5vdCBk
ZWZpbmUgaXQuDQo+Pj4+Pj4+ICsgKi8NCj4+Pj4+Pj4gKyNpZiAhKGRlZmluZWQoX19pMzg2X18p
IHx8IGRlZmluZWQoX194ODZfNjRfXykpDQo+Pj4+Pj4+ICsjZGVmaW5lIF9feDg2XzY0X18NCj4+
Pj4+Pj4gKyNlbmRpZg0KPj4+Pj4+IA0KPj4+Pj4+IEJlc2lkZXMgYmVpbmcgY29uZnVzaW5nIHRo
aXMgZGVwZW5kcyBvbiB0aGUgb3JkZXIgb2YgY2hlY2tzIGluIHhlbi5oLg0KPj4+Pj4+IA0KPj4+
Pj4+PiAjaW5jbHVkZSA8eGVuL2FyY2gteDg2L3hlbi5oPg0KPj4+Pj4+PiAjaW5jbHVkZSA8eGVu
L2h2bS9odm1faW5mb190YWJsZS5oPg0KPj4+Pj4+PiAjZWxpZiBkZWZpbmVkKENPTkZJR19BUk1f
NjQpDQo+Pj4+Pj4gDQo+Pj4+Pj4gQXQgdGhlIHZlcnkgbGVhc3QgeW91IHdpbGwgd2FudCB0byAj
dW5kZWYgdGhlIGF1eGlsaWFyeSBkZWZpbmUgYXMgc29vbg0KPj4+Pj4+IGFzIHByYWN0aWNhbGx5
IHBvc3NpYmxlLg0KPj4+Pj4gDQo+Pj4+PiBBY2sNCj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+IEJ1
dCBJIHRoaW5rIGEgZGlmZmVyZW50IHNvbHV0aW9uIHdpbGwgd2FudCBmaW5kaW5nLiBEaWQgeW91
IGNoZWNrIHdoYXQNCj4+Pj4+PiB0aGUgI2luY2x1ZGUgaXMgbmVlZGVkIGZvciwgcmVhbGx5PyBJ
J3ZlIGdsYW5jZWQgdGhyb3VnaCB0aGUgZmlsZQ0KPj4+Pj4+IHdpdGhvdXQgYmVpbmcgYWJsZSB0
byBzcG90IGFueXRoaW5nIC4uLiBBZnRlciBhbGwgdGhpcyBpcyBhIGJ1aWxkIHRvb2wsDQo+Pj4+
Pj4gd2hpY2ggZ2VuZXJhbGx5IGNhbid0IGNvcnJlY3RseSB1c2UgbWFueSBvZiB0aGUgdGhpbmdz
IGRlY2xhcmVkIGluIHRoZQ0KPj4+Pj4+IGhlYWRlci4NCj4+Pj4+IA0KPj4+Pj4gQXMgc3RhdGVk
IGluIHRoZSBjb21tZW50IGFmdGVyIHRoZSBjb21taXQgbWVzc2FnZSwgdGhpcyBpcyBub3QgYSBn
b29kDQo+Pj4+PiBzb2x1dGlvbiBidXQgYW4gaGFjay4NCj4+Pj4+IA0KPj4+Pj4gTm93IEkgZG8g
bm90IGNvbXBsZXRlbHkgYWdyZWUgaGVyZSwgdGhlIHRvb2wgaXMgbm90IHJlYWxseSB0aGUgcHJv
YmxlbQ0KPj4+Pj4gYnV0IHRoZSBoZWFkZXJzIGFyZS4NCj4+Pj4gDQo+Pj4+IFdlbGwgLSB0aGUg
aXNzdWUgaXMgdGhlIHRvb2wgZGVwZW5kaW5nIG9uIHRoZXNlIGhlYWRlcnMuDQo+Pj4gDQo+Pj4g
WWVzIGJ1dCB0aGUgdG9vbCBpdHNlbGYgY2Fubm90IHNvbHZlIHRoZSBpc3N1ZSwgd2UgbmVlZCB0
byBoYXZlIHRoZSB2YWx1ZXMNCj4+PiBpbiBwcm9wZXJseSBhY2Nlc3NpYmxlIGhlYWRlcnMuDQo+
Pj4gDQo+Pj4+IA0KPj4+Pj4gVGhlcmUgaXMgbm90IHN1Y2ggYW4gaXNzdWUgb24gYXJtLg0KPj4+
PiANCj4+Pj4gVGhlbiB3aHkgZG9lcyB0aGUgdG9vbCBpbmNsdWRlIHhlbi9hcmNoLWFybS5oIGZv
ciBBcm02ND8NCj4+PiANCj4+PiBCZWNhdXNlIHRoaXMgaGVhZGVyIGRlZmluZXMgdGhlIHZhbHVl
cyByZXF1aXJlZCBhbmQgYXMgbm8gc3VjaCB0aGluZyBhcyBpbmNsdWRlIHhlbi5oLg0KPj4+IFRo
ZSBwb2ludCBpcyBvbiBhcm0sIHRoZSBhcmNoLWFybS5oIGhlYWRlciBkb2VzIG5vdCBkZXBlbmQg
b24gcGVyIGNwdSBkZWZpbmVzLg0KPj4+IA0KPj4+PiANCj4+Pj4+IFRoZSB0b29sIG5lZWRzIGF0
IGxlYXN0Og0KPj4+Pj4gSFZNX01BWF9WQ1BVUw0KPj4+Pj4gWEVOX0FDUElfQ1BVX01BUA0KPj4+
Pj4gWEVOX0FDUElfQ1BVX01BUF9MRU4NCj4+Pj4+IFhFTl9BQ1BJX0dQRTBfQ1BVSFBfQklUDQo+
Pj4+PiANCj4+Pj4+IFdoaWNoIGFyZSBkZWZpbmVkIGluIGFyY2gteDg2L3hlbi5oIGFuZCBodm1f
aW5mb190YWJsZS5oLg0KPj4+Pj4gDQo+Pj4+PiBJIGFtIG5vdCBxdWl0ZSBzdXJlIGhvdyB0byBn
ZXQgdGhvc2Ugd2l0aG91dCB0aGUgY3VycmVudCBpbmNsdWRlDQo+Pj4+IA0KPj4+PiAxKSBNb3Zl
IHRob3NlICNkZWZpbmUtcyB0byBhIHN0YW5kYWxvbmUgaGVhZGVyLCB3aGljaCB0aGUgb25lcw0K
Pj4+PiBjdXJyZW50bHkgZGVmaW5pbmcgdGhlbSB3b3VsZCBzaW1wbHkgaW5jbHVkZS4gVGhlIHRv
b2wgd291bGQgdGhlbg0KPj4+PiBpbmNsdWRlIF9vbmx5XyB0aGlzIG9uZSBoZWFkZXIuDQo+Pj4g
DQo+Pj4gU2hvdWxkbuKAmXQgd2UgdHJ5IHRvIHVuaWZ5IGEgbGl0dGxlIGJpdCB3aGF0IGlzIGRv
bmUgb24gYXJtIGFuZCB4ODYgaGVyZSA/DQo+Pj4gTm90IG9ubHkgZm9yIHRoaXMgdG9vbCBidXQg
aW4gZ2VuZXJhbCBpbiB0aGUgcHVibGljIGhlYWRlcnMNCj4gDQo+IFdoZXJlIHBvc3NpYmxlIEkn
bSBhbGwgZm9yIGl0Lg0KPiANCj4+PiBJIHdpbGwgdHJ5IHRvIHJlZHVjZSB0aGUgcHJvYmxlbSBh
IGJpdCBtb3JlIHRvIGZpbmQgd2hhdCB3ZSB3b3VsZCBuZWVkIHRvDQo+Pj4gcHVsbCBvdXQgaW4g
YSBzdGFuZGFsb25lIGhlYWRlci4NCj4+IA0KPj4gT25seSB0aGUgMyBYRU5fQUNQSV8gYXJlIG5l
ZWRlZA0KPiANCj4gWWV0IFhFTl9BQ1BJX0NQVV9NQVBfTEVOIGRyaXZlcyBmcm9tIEhWTV9NQVhf
VkNQVVMuDQo+IA0KPj4gYW5kIHRob3NlIGFyZSBpbiBmYWN0IG9ubHkgdXNlZCBieSBta19kc2R0
LmMuDQo+IA0KPiBXZWxsIC0gdGhhdCdzIHRoZSBvbmx5IHRoaW5nIHdlIHRhbGsgYWJvdXQgaGVy
ZS4gQnVpbGRpbmcgdGFyZ2V0IGNvZGUNCj4gaXMgZmluZSB0byB1c2UgdGhlIGhlYWRlcnMuIEJ1
aWxkaW5nIGNvZGUgdG8gcnVuIG9uIHRoZSBidWlsZCBzeXN0ZW0NCj4gaXMgd2hlcmUgdGhlIGhl
YWRlcnMgc2hvdWxkIG5vdCBiZSB1c2VkLg0KPiANCj4+IEhvdyBhYm91dCBtb3ZpbmcgdGhvc2Ug
dG8gYSB4ZW4tYWNwaS5oIGhlYWRlciBhbmQgaW5jbHVkZSB0aGF0IG9uZSBpbiB4ZW4uaCA/DQo+
IA0KPiBJbiBwcmluY2lwbGUgb2theSwgaWYgdGhlcmUgd2Fzbid0IHRoZSBuZWVkIGZvciBIVk1f
TUFYX1ZDUFVTLiBXaXRoIGENCj4gc3VpdGFibGUgY29tbWVudCBpdCBtYXkgYmUgb2theSB0byBs
aXZlIHRoZXJlLiBJJ2QgYmUgY3VyaW91cyB3aGF0DQo+IG90aGVycyB0aGluay4NCg0KVGhlIHBy
b2JsZW0gd2l0aCB0aGlzIGFscmVhZHkgZXhpc3RzIGluIHRoZSBjdXJyZW50IHN0YXR1cyBhcyB0
aGlzIGlzIGRlZmluZWQgaW4NCmh2bV9pbmZvX3RhYmxlLmggd2hpY2ggaXMgbmV2ZXIgaW5jbHVk
ZWQgZnJvbSBhcmNoLXg4Ni94ZW4uaA0KDQpJbmNsdWRpbmcgaHZtX2luZm9fdGFibGUuaCBmcm9t
IHhlbi1hY3BpLmggY291bGQgY3JlYXRlIGluY2x1ZGUgcGF0aCBpc3N1ZXMuDQoNCkJ1dCBhcyB0
aG9zZSBhcmUgdXNlZCBub3doZXJlIGFwYXJ0IGZyb20gbWtfZHNkdCwgSSB3b3VsZCBwcm9iYWJs
eSBza2lwIHRoZQ0KaW5jbHVkZSBvZiB4ZW4tYWNwaS5oIGZyb20geGVuLmguDQoNCkFueSBjaGFu
Y2UgdGhhdCB0aG9zZSBYRU5fQUNQSV8gYXJlIG5lZWRlZCBieSBzb21lIGV4dGVybmFsIHRvb2xz
IHRoYXQNCmNvdWxkIGdldCBicm9rZW4gYnkgdGhpcyBtb2RpZmljYXRpb24gPw0KDQo+IA0KPj4g
T3RoZXIgc29sdXRpb24gYXMgdGhvc2UgYXJlIG9ubHkgdXNlZCBpbiBta19kc2R0LCBJIGNvdWxk
IGp1c3QgZGVmaW5lIHRoZW0gdGhlcmUg4oCmDQo+IA0KPiBQbGVhc2UgbGV0J3MgdHJ5IGhhcmQg
dG8gYXZvaWQgZG9pbmcgc28uDQoNCkFncmVlDQoNCj4gDQo+Pj4+IDIpIFNlZGRlcnkgb24gdGhl
IGhlYWRlcnMsIHByb2R1Y2luZyBhIGxvY2FsIG9uZSB0byBiZSB1c2VkIGJ5IHRoZQ0KPj4+PiB0
b29sLg0KPj4+IA0KPj4+IFlvdSBtZWFuIGF1dG9nZW5lcmF0aW5nIHNvbWV0aGluZyA/IFRoaXMg
d291bGQganVzdCBtb3ZlIHRoZSBwcm9ibGVtLg0KPiANCj4gV2h5Pw0KDQpZb3Ugd291bGQgaGF2
ZSB0byBoYW5kbGUgdGhlIGFyY2ggc3BlY2lmaWMgcGFydCB0aGVyZS4gSSB3b3VsZCByYXRoZXIg
cHJldmVudCBhbnkNCmF1dG8tZ2VuZXJhdGlvbiBoZXJlIGFuZCBzdGljayB3aXRoIGJldHRlciBk
ZWZpbmVkIGhlYWRlcnMuDQoNCj4gDQo+IEphbg0KDQo=

