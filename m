Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B557975C6E2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 14:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567515.886661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMpFh-0006F9-63; Fri, 21 Jul 2023 12:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567515.886661; Fri, 21 Jul 2023 12:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMpFh-0006Ca-28; Fri, 21 Jul 2023 12:28:57 +0000
Received: by outflank-mailman (input) for mailman id 567515;
 Fri, 21 Jul 2023 12:28:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=So7w=DH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qMpFf-0006CS-Jw
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 12:28:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 281fcf1a-27c2-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 14:28:54 +0200 (CEST)
Received: from AS9PR06CA0517.eurprd06.prod.outlook.com (2603:10a6:20b:49d::21)
 by DB5PR08MB10164.eurprd08.prod.outlook.com (2603:10a6:10:4a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 12:28:52 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49d:cafe::92) by AS9PR06CA0517.outlook.office365.com
 (2603:10a6:20b:49d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25 via Frontend
 Transport; Fri, 21 Jul 2023 12:28:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.34 via Frontend Transport; Fri, 21 Jul 2023 12:28:51 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Fri, 21 Jul 2023 12:28:51 +0000
Received: from da644066141b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 350764D5-F0B2-4785-9399-A069701E5E98.1; 
 Fri, 21 Jul 2023 12:28:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da644066141b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Jul 2023 12:28:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9471.eurprd08.prod.outlook.com (2603:10a6:102:2e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Fri, 21 Jul
 2023 12:28:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 12:28:42 +0000
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
X-Inumbo-ID: 281fcf1a-27c2-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzjC3bAZGySvsK62XAcK6kjc+eOkdmMOS3G1/saiQv0=;
 b=EnVbrC3NvMbz6IYf9qczFBXHVokinsaXxrnka37X7pokU6FO1efZTPIi50Zf/YDTmwD00DyOZwXsNtcoGKM9gUDnvpznopoc9wx2JWJkGgkf4K6WT/AoKnEZBFHx82k82tQMcoN9LWhImFEDp2n60atQAfcBxyaEslSZtY+hz5w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 92ebf5c3d62949a0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktO7huNDfg1EiJ5CIyJgj1n79i1tfkVDe//EzbaXDAv41OF5R1foeheY1F9J7SOGMokMEKm0Ejwo+s+igOfqOAHys/WEZq2SQgIKHe9zEaQjsvzlZKPliwlQWOKtOK8C3gnV6x+EiiaO0Db21tA/U2DVMjcOH+C4ILZ/pFNXwzhb+91SGQo5KRkmXf/3K0xRmuuVgd4KlHd/nRBUgiuP3Vq0v0S2q/Z8Ii0Lh9FXkwnO1ydXHzYq2zifwimNtp1DUBWyqgaG+wOtA/wWNS3eq4Y/08Zyk4rCuXRFfTGN3coY+5sryM8H7UXIi+/t8rCTL4E6puCDO7pulMCvvOkwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzjC3bAZGySvsK62XAcK6kjc+eOkdmMOS3G1/saiQv0=;
 b=fW0TECznAakgrawgktBc0ODE0wd32jvpCdBptNSntqiJhcSmHYMN8YDiy1OlMgVhQbrjJsHUE+r2sJLwofVWI7are7F3IWV1VVORcU121C4ddFuitRUaZkwCUsrv5fiXuN/QbJl12KOrKxid6ziYx81ObWOnEmbcJD2i08ud6bcAfPM6CO9EHxEX/RXc82jQAeTl1S3QOSK8mPzOZypL3CnF2faqExrdehrgSazPoo0VTZ4zWGBus0XsHZjRSRYe+JXnmsdlPOKtnOOGHtYWK2Ij53vMNOBv7kbQJB/Hl/2ezTAsbOjqQAlNNEXjq7euwzdMvynXIZsLuX9qZJJ3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzjC3bAZGySvsK62XAcK6kjc+eOkdmMOS3G1/saiQv0=;
 b=EnVbrC3NvMbz6IYf9qczFBXHVokinsaXxrnka37X7pokU6FO1efZTPIi50Zf/YDTmwD00DyOZwXsNtcoGKM9gUDnvpznopoc9wx2JWJkGgkf4K6WT/AoKnEZBFHx82k82tQMcoN9LWhImFEDp2n60atQAfcBxyaEslSZtY+hz5w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jens Wiklander
	<jens.wiklander@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Topic: [PATCH v2] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Index: AQHZu7UoTgj0ElhTvUC42VsaPH5iba/D/OyAgAApYgA=
Date: Fri, 21 Jul 2023 12:28:42 +0000
Message-ID: <B5883910-D35A-404B-8EBA-8AAB6C093342@arm.com>
References:
 <c55ce2891172a696e8a29f8c9bcc9dd33ebe9e50.1689931326.git.bertrand.marquis@arm.com>
 <e6d72d9a-a146-733c-0a9b-016fb291c2ea@xen.org>
In-Reply-To: <e6d72d9a-a146-733c-0a9b-016fb291c2ea@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAWPR08MB9471:EE_|AM7EUR03FT015:EE_|DB5PR08MB10164:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb79e24-da0a-4f9b-e4ce-08db89e60a74
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k89mueGeRW8poG+BqYVCD5TFFPZvljb8SkGnyuIAw9H6e7W4yg+aHxGFLoy00RbwSjGXG52jkUKz8C9D25p9g6+QRK8IbXEtDW5XSFD6J1jtGjiDqFNprMsrXeAjoIrURl149hbaOX/KlJcJo/ip6sUfnNFLwN87OSd0M9BVwXScML2/3ae3iikjo1yG1Do8hvNBtxS9Q5CGWS63tnQkMmwDV+qPhIj2e4QZhMhaortFARejE2mFTedRrjTm/7BWikx5iOpuqUjsEc9RwMgJv3KhI9+fZWCcSyaVqopBeEu1uq+xw0wddcjmt/IFNZGbfy3TXg3YHHJN+IYqmWNMn/5gSFZnVn8ZxelU1vpi7yyXQzn6dKWASnxZcVQQZQVy8xImBAW/SCGEp5O14S/rK7QIPE3hO6nWEs75qucQf+SU1dtcov/xLw0E4es9a5sd3cgx2MYkta75laHsDJv+Tp+4uotT5XPzd6mmqHUCy3vT0Mi0egQe+7D9wXB/Q2nJg48dZUZMGqPeFTmSmzNSp1RzP0kehzK6zCtRLQVEBr/tSowdXwUL7o3FmlJZsM8hMctpVoxluQFWODhnLf08Y1dHIpr5fJTQIVtN/qsx21Py1TE3i3m2jkh3MSQDRJZ0sWgZTk9eN1w4M5cr3HNT4Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199021)(966005)(71200400001)(478600001)(6512007)(6486002)(91956017)(54906003)(186003)(53546011)(6506007)(2906002)(76116006)(41300700001)(6916009)(4326008)(316002)(66556008)(64756008)(5660300002)(8936002)(8676002)(66446008)(2616005)(38100700002)(66476007)(122000001)(66946007)(33656002)(36756003)(38070700005)(86362001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6925936932FCCF40B5164C88E18BD740@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9471
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57d95d4f-d76c-439b-703c-08db89e60510
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m2hlG5GBskx5Da7Dffk1+FQaXhdkyXTwbeVJ8C8trG+toezFCO0xBxHP9It8+oCVzxfDoFBGrX5+KGtlTgm/STfWMLjba12ZO9xs+8T3WW4wrSZQ6o9AHaNbGJ/MjYW1vN3FY6sHr1OIKmUA7W3wf61jf0Vza6x9I0+M4AJCBIxUkD1TaXFrbuwGIalrY5v8QkVIbk7xUJqh/WDb2cElb0wH3cEPgvzvWwx/W4cejZW1ng96JsP16gTdThvW9bNR6YQyBAI6lhkLTpGtKTYzgXkAHKoTqdXK/yGhhzyAypNUAnbxttlCyYBUt6dVR0k0nLymh2vSUx5FCxP2wSmbTBoZJXVDrcbQcH5JfPOggC+qzns7Ijc+ydsSC72nA79wIhnDosCnyL7D4RNQI9DY+yh3poxD7lcPT4M7cDDDc3ZZSwJuhEXVGMo186fmYy6zziBW0P5Tq/YMGcbzftgwJtK8cfsfQVEGOF+ZAAitLXLe8+tHFRt516BtKVILMRRUU4yCnZJzdMuuSUoci0soE0nDw8W0Wj/y1t2VBXKgWeJ7Di2S93J4E6Q5SYJUubsQPB6+8uGzmeuHl0ovEZiD5/4b7JmbcVMPDF6qGmcohQtjsrik+1G0IKLaifBRaI+RepGoSgRKOJ7jzYBUVnprFuX95wlr73BwWlU+bh7s9rG0F6/IhIQy2JK0F+HfNfnIqHPmUNOQc0gCMRP2GELgtxKf4DMyZmwMf7KjmvNlNLE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199021)(82310400008)(36840700001)(46966006)(40470700004)(40460700003)(966005)(4326008)(6486002)(53546011)(6506007)(26005)(107886003)(478600001)(70206006)(54906003)(70586007)(86362001)(33656002)(36756003)(36860700001)(83380400001)(336012)(47076005)(186003)(2616005)(8936002)(41300700001)(5660300002)(316002)(6862004)(40480700001)(6512007)(2906002)(81166007)(8676002)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 12:28:51.3348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb79e24-da0a-4f9b-e4ce-08db89e60a74
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10164

Hi,

> On 21 Jul 2023, at 12:00, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 21/07/2023 10:23, Bertrand Marquis wrote:
>> Rework TEE mediators to put them under a submenu in Kconfig.
>> The submenu is only visible if UNSUPPORTED is activated as all currently
>> existing mediators are UNSUPPORTED.
>> While there rework a bit the configuration so that OP-TEE and FF-A
>> mediators are selecting the generic TEE interface instead of depending
>> on it.
>> Make the TEE option hidden as it is of no interest for anyone to select
>> it without one of the mediators so having them select it instead should
>> be enough.
>> Rework makefile inclusion and selection so that generic TEE is included
>> only when selected and include the tee Makefile all the time making the
>> directory tee self contained.
>=20
> Is this a left over?

Oups yes, please remove.

>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in v2:
>> - only included tee subdirectory in makefile if CONFIG_TEE is selected
>>   (reverts to state before patch)
>> - remove help in hidden TEE config
>> - rebase on top of staging
>> ---
>>  xen/arch/arm/Kconfig      |  7 -------
>>  xen/arch/arm/tee/Kconfig  | 17 ++++++++++++++---
>>  xen/arch/arm/tee/Makefile |  2 +-
>>  3 files changed, 15 insertions(+), 11 deletions(-)
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 439cc94f3344..fd57a82dd284 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -175,13 +175,6 @@ config ARM64_BTI
>>     Branch Target Identification support.
>>     This feature is not supported in Xen.
>>  -config TEE
>> - bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
>> - default n
>> - help
>> -   This option enables generic TEE mediators support. It allows guests
>> -   to access real TEE via one of TEE mediators implemented in XEN.
>> -
>>  source "arch/arm/tee/Kconfig"
>>    config STATIC_SHM
>> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
>> index db3ea78faaaa..c5b0f88d7522 100644
>> --- a/xen/arch/arm/tee/Kconfig
>> +++ b/xen/arch/arm/tee/Kconfig
>> @@ -1,7 +1,14 @@
>> +menu "TEE mediators"
>> + visible if UNSUPPORTED
>> +
>> +config TEE
>> + bool
>> + default n
>> +
>>  config OPTEE
>> - bool "Enable OP-TEE mediator"
>> + bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED
>>   default n
>> - depends on TEE
>> + select TEE
>>   help
>>     Enable the OP-TEE mediator. It allows guests to access
>>     OP-TEE running on your platform. This requires
>> @@ -12,10 +19,14 @@ config OPTEE
>>  config FFA
>>   bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>>   default n
>> - depends on ARM_64 && TEE
>> + depends on ARM_64
>> + select TEE
>>   help
>>     This option enables a minimal FF-A mediator. The mediator is
>>     generic as it follows the FF-A specification [1], but it only
>>     implements a small subset of the specification.
>>       [1] https://developer.arm.com/documentation/den0077/latest
>> +
>> +endmenu
>> +
>> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
>> index 58a1015e40e0..1ef49a271fdb 100644
>> --- a/xen/arch/arm/tee/Makefile
>> +++ b/xen/arch/arm/tee/Makefile
>> @@ -1,3 +1,3 @@
>>  obj-$(CONFIG_FFA) +=3D ffa.o
>> -obj-y +=3D tee.o
>> +obj-$(CONFIG_TEE) +=3D tee.o
>>  obj-$(CONFIG_OPTEE) +=3D optee.o
>=20
> Same here? The rest LGTM and I would be happy to do the changes on commit=
.

This one is not, I think it is more logic to keep that one like this so tha=
t if someone
creates a TEE not depending on this it could still put it here without comp=
iling tee.o
for no reason.

Now there is still a discussion around visibility and if UNSUPPORTED that w=
e need
to settle (even though current behaviour is right and as i expected, the ef=
fect of the
"visibility" is not what I expected).

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



