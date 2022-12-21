Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CBD652E18
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 09:50:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467631.726673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7unf-0006b5-8t; Wed, 21 Dec 2022 08:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467631.726673; Wed, 21 Dec 2022 08:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7unf-0006Yb-4j; Wed, 21 Dec 2022 08:50:07 +0000
Received: by outflank-mailman (input) for mailman id 467631;
 Wed, 21 Dec 2022 08:50:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCPi=4T=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1p7une-0006YV-8j
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 08:50:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76c597be-810c-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 09:50:05 +0100 (CET)
Received: from DB9PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:10:1d9::16)
 by PAVPR08MB9531.eurprd08.prod.outlook.com (2603:10a6:102:313::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Wed, 21 Dec
 2022 08:50:03 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::7f) by DB9PR02CA0011.outlook.office365.com
 (2603:10a6:10:1d9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.21 via Frontend
 Transport; Wed, 21 Dec 2022 08:50:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.6 via Frontend Transport; Wed, 21 Dec 2022 08:50:02 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Wed, 21 Dec 2022 08:50:02 +0000
Received: from 04b82bb8b32b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4BB97DE-0B61-4804-AE16-A4877DE4C0A4.1; 
 Wed, 21 Dec 2022 08:49:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04b82bb8b32b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Dec 2022 08:49:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB8123.eurprd08.prod.outlook.com (2603:10a6:150:78::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Wed, 21 Dec
 2022 08:49:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5944.006; Wed, 21 Dec 2022
 08:49:47 +0000
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
X-Inumbo-ID: 76c597be-810c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6H3OeDq4dJ8+8maydKJJQO2JjLRX+rmegoR9U9NtPk=;
 b=Bm93370uPa43BpTeOkqpQzCSGCfxePdxSIUeU8qQFWjVX0C4RVvl6dytZRH1RSfs8u6Mla0hF1VEh22gF6HsjvLAtGJOi9wR2MIQb9NSpOV9+2nAy/ax+MCJTbPd2pO7OCKSzyrIgEQpc2ARsA5rZaNYqr8Igyo0YdITTJz4CXw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b042f9a31caf1a90
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKosutLIvE20hf/zC4Yle6V1f16Fd5nApbboFDWzJQbKYf5r8/utrCUCw6MgDqG01TZOBTx4EsRrdGu9jnBb8KMGiRwqEUcWWczctKV3IkjGzGe7Nqu4QZdxep2QnXEashg8CdvMXL9D8PAIeRylrk91mKfIMs4lI7aDJs5GLmmRZ/Gtnazfa6OV+fAQQOhgX+77iEYEMbVurhwAnmjrXMYYOIsAqNL6+R16CSRplcuBuUZ4p63X32IHtV2/hge88R/+qkVcLHcNTFkcMY5nOnEsUuqZFhD+FczMV5cn6C9p82EynJw4WpAzdhUwIobNYs4Mz93aE2jLppikHn75XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6H3OeDq4dJ8+8maydKJJQO2JjLRX+rmegoR9U9NtPk=;
 b=fGh1+cMu4ImN0TW0TjgX0tPgldMwQaUDK68Oo5RNsVGG67Ymw4mcEaa1wemHyAiqdpEwwseA3VqdwMUrs5OW1hL4/Dd+llO7F3A0ILO8WzWcZoDJY8N8qMo+1EVz8V2tv9ybKlCf3B+4tX1kDmlSQoRzDHNPIIIvjlUmyOMF9bnGNCb5fnMobL89jTMds+BOC8jdNnStKUcvvjmPLx1WPUa0kYnHaDYVzon56b5bcJRWqCzEFQbHiHo4eGSM0p8ELi+Vq2nng3FFZ9zXadv3HMXN0l7LkZVPMh0dxP9Q12I9T8xNhNY3fKZmyE16YePo8SnctvupNEKAPfzu18cWTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6H3OeDq4dJ8+8maydKJJQO2JjLRX+rmegoR9U9NtPk=;
 b=Bm93370uPa43BpTeOkqpQzCSGCfxePdxSIUeU8qQFWjVX0C4RVvl6dytZRH1RSfs8u6Mla0hF1VEh22gF6HsjvLAtGJOi9wR2MIQb9NSpOV9+2nAy/ax+MCJTbPd2pO7OCKSzyrIgEQpc2ARsA5rZaNYqr8Igyo0YdITTJz4CXw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 00/18] cppcheck rule 20.7 fixes
Thread-Topic: [RFC PATCH 00/18] cppcheck rule 20.7 fixes
Thread-Index: AQHZFFBPtCSX3ZUNhU2CEBonqqEppq52ibCAgAF//QA=
Date: Wed, 21 Dec 2022 08:49:47 +0000
Message-ID: <32A958CA-01DC-469F-91F2-D8B8EA7FF966@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <28180048-87c6-c0b5-dcdf-34fa10580145@suse.com>
In-Reply-To: <28180048-87c6-c0b5-dcdf-34fa10580145@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB8123:EE_|DBAEUR03FT049:EE_|PAVPR08MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: 4511c8ee-e822-44a7-241f-08dae3305951
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WeQy5Wkd2RcM/jyh00EzDn27nBW9aDMTY3ntuXxrEOA9WjBV+IP+q/0FBgACVV/d8Oxs2G3xr4id0N+n7OniaMOucCK9Epv4sKU8ruUVp402NWn/J7caXmAt3RpNX1OWGfxqlMqB0JPMOV7Lqsz2gNr/ynIe8eG1NOWaO6d6V1aZABR1jIF+HnovfiZIphTH9v1wWywSTZw1kTzXxbk8NYoGFLGZSLyFpCPZ6JxIghFNdGtzBgWTNHjG8AOul1/UgWDkOqf+7BSmkUVm650GpB9TIMScShjLnZKnTy6aJ4qShc82FG5DKWaUpGqaHjMijqIZE2BYlsMg5EzPIGLOvUaGsvW3I+T0PIeia+kLRXi+a/Ekui6v/gUSPIHVNs7RFWmXNMi/SS28btafNJk2JVg4L+dTg6X2v3uAPD3iLkQ8oi0JUH6niNZC4Q6QTvqpmpqoR36vIAJS4jiYP1kVIQ94+F5H0K5q/1EYM8jRA6Aqhu0L2aWIK9RkzwUP7EZ8m1n4Hjk1XX+y+OfZmBouhYlh1NGW0tnEotNJxfAdLOxZDHDYtcIr/oOKQBQ9z/E82e3R8BNW7KhZedfSXI/BI71Q8cvMayyISn1y5IF3RY9bmxOnY5lHFalLXpNEkqFNkYP/ZuAa+TQGa9EU29Ozv1CijcLliGOhpSXklYgjMYGkQI7A3rGmvJuus0QaIitqe5XHrKtGXmXVj5aya7+kGjnGo+bOxKi6NpAq4y4sPCI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199015)(33656002)(36756003)(2906002)(122000001)(38100700002)(5660300002)(41300700001)(8936002)(86362001)(38070700005)(54906003)(66446008)(66556008)(316002)(64756008)(71200400001)(8676002)(6916009)(66476007)(4326008)(26005)(91956017)(76116006)(186003)(6486002)(66946007)(6512007)(6506007)(2616005)(478600001)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ACEAE1127C82164995CD123588B5F163@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8123
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fbf2dc15-a78c-4ec6-6d8a-08dae3305092
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GO5opof81virHcLJne6r3Kfbj2Ro1hxhzPD7VjTH39i5N7iCI62W/YH5ws97XQRCUs8Wj8pXQIxiR4jsbty7FSBRjYtiTw31A0hB2cbUvaKSKa7aMwDuWJ4Th3y/h0ds+oPGM9kS435b2V8ZpeSXFdcbOmbv1bj9VhHd41/FEn2CRkzOuW60rS8UWRWZSW5PCb0k7WSBZm7cRO0l7irt3GrTcwpf/n7XwKXbQ4G4fKPmiyjY4jLCqwutn0+4f/IrIjn0mLI9eY9ZO8ZhLX+0NYmIJaLiOG0L8g9B6WS/QTiZLuk14NIKWyrqoialsz+tDoi0E0BgFywfWw2upkhjn3h81UCGeZDsqpmCk5kKQK10DGVWRdfV32Vp8GDkr3ZV74pw53MyVxVD95+naVb7iN0r1f9p/WTShsQTskGHvizq/Cum63UjWZVDDHE4fth2iiw8/Ee7ESBXYYKEPvfRrcEVoSUkHzQYZcsxarixTPaKlTmeAqdzoVx0muc5XvmJqRplRHlXncbBwfQAQ1+8wj27DK2tq7h1jEpS4mPsf1HWhGxmBq04mQNK7lu83WiEVENh9IC0XCb9ehLdjreGbZwALVdBemFC0o8xBBfeDfSJRUyqssXGZRtFrjcJmwZoFkFjwQ59HlL4f21JzKQbxBZwp/icx17Zj+SeuX9ykyl9llrWUwWqhnRod/lLlnGc7QXhi0s1vpEMIKy2I3I9dg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(70586007)(70206006)(41300700001)(4326008)(8676002)(186003)(478600001)(33656002)(26005)(6506007)(53546011)(40460700003)(2616005)(47076005)(82310400005)(336012)(316002)(6512007)(86362001)(54906003)(2906002)(40480700001)(6486002)(356005)(82740400003)(6862004)(81166007)(36860700001)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 08:50:02.2615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4511c8ee-e822-44a7-241f-08dae3305951
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9531



> On 20 Dec 2022, at 09:55, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 20.12.2022 09:50, Luca Fancellu wrote:
>> In this serie there are some fixes for the rule 20.7, mainly violation f=
ound by
>> cppcheck, most of them are false positive but some of them can be fixed.
>>=20
>> The analysed build is arm64, to reproduce the reports here the command:
>>=20
>> ./xen/scripts/xen-analysis.py --cppcheck-misra --run-cppcheck -- CROSS_C=
OMPILE=3D"aarch64-linux-gnu-" XEN_TARGET_ARCH=3D"arm64" O=3D/path/to/artifa=
cts_folder
>>=20
>> Luca Fancellu (18):
>>  arm: cppcheck: misra rule 20.7 deviations for alternative.h
>>  arm: cppcheck: misra rule 20.7 deviation on processor.h
>>  arm: cppcheck: misra rule 20.7 deviation on asm_defns.h
>>  arm: cppcheck: misra rule 20.7 deviation on config.h
>>  arm: cppcheck: fix misra rule 20.7 on arm/include/asm/string.h
>>  public: cppcheck: misra rule 20.7 on public/arch-arm.h
>>  xen: cppcheck: misra rule 20.7 deviation on compiler.h
>>  xen: cppcheck: misra rule 20.7 deviation on init.h
>>  xen: cppcheck: misra rule 20.7 deviation on kconfig.h
>>  xen: cppcheck: misra rule 20.7 deviation on types.h
>>  xen: cppcheck: misra rule 20.7 deviation on xmalloc.h
>>  arm: cppcheck: misra rule 20.7 deviation on asm/arm64/sysregs.h
>>  public/x86: cppcheck: misra rule 20.7 deviation on hvm/save.h
>>  public/x86: cppcheck: misra rule 20.7 deviation on xen-x86_32.h
>>  public/x86: cppcheck: misra rule 20.7 deviation on xen-x86_64.h
>>  public/x86: cppcheck: misra rule 20.7 deviation on arch-x86/xen.h
>>  public: misra rule 20.7 deviation on errno.h
>>  public: misra rule 20.7 deviation on memory.h
>=20
> Like Julien I object to the massive addition of false positive markers
> just because of very basic shortcomings in cppcheck. I find this
> particularly bad in public headers - imo no such annotations should
> appear there at all. I would suggest that you split off the actual
> code changes, which are likely going to be less controversial.

Yes I will send the patches with your review and drop the others with
False-positive or fixes that are not agreed.


>=20
> Jan


