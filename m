Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A4546B98F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 11:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240862.417606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY58-0006Wc-2w; Tue, 07 Dec 2021 10:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240862.417606; Tue, 07 Dec 2021 10:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY57-0006U8-Vv; Tue, 07 Dec 2021 10:52:21 +0000
Received: by outflank-mailman (input) for mailman id 240862;
 Tue, 07 Dec 2021 10:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bINN=QY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1muY56-0006Ty-JV
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 10:52:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bebf1cc7-574b-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 11:52:18 +0100 (CET)
Received: from AM6P194CA0066.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::43)
 by AM8PR08MB5604.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 7 Dec
 2021 10:52:16 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::2a) by AM6P194CA0066.outlook.office365.com
 (2603:10a6:209:84::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Tue, 7 Dec 2021 10:52:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 10:52:15 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110");
 Tue, 07 Dec 2021 10:52:15 +0000
Received: from 4bab25662f21.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58DC2858-795D-41B0-B092-A2F33B02121B.1; 
 Tue, 07 Dec 2021 10:52:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4bab25662f21.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Dec 2021 10:52:07 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6717.eurprd08.prod.outlook.com (2603:10a6:102:131::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 10:52:06 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::b9c9:c5dc:15e:b622]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::b9c9:c5dc:15e:b622%5]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 10:52:06 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P123CA0040.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Tue, 7 Dec 2021 10:52:05 +0000
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
X-Inumbo-ID: bebf1cc7-574b-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SNRZIlkIQfr2XxDNhrlBDHkr/swtumsR7/J+3zcYVU=;
 b=q0M+J/bQadmK/4mE+zNAdAAoYr02QAmJoeoKYI7tmz/Z9pKVPg6+fVphaQf8skqqik4r8sTFEDvFyDNvuWtHABDtONLXtKvvjV0Nehny2WIlLP9JXOT7AlBQ+F801TDM1+7Ij1Ke4R4sCyV+EK2FDoUxbpLe+MLsXgRA0HCBcIQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d21ec180b7ed8a14
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xao76e67KvxzmA60XxBsM9gatkD7NpbuIzcZjHkZJKUjvhNg39SyQ8ELJjGclFYIqZ8G+xAiV0Ls4UcLWLYiQD/3bNBUR1CqaWGtWzsb1qHBHH52KDbFlCJIzh5KCrXANu1YmZECw3mCDzzxazT4yCF8aPx9f5vfjTc9ToC6gSl7s8g5QJNFOY5SxRR/kV3HeEmT0V4qwNEAFED3EA1YoYQStICAT4yxSOPmI9RPiUZ4TcPmiLctXkAIDIWXqvhVgVEV7iT+00NqfZ9yi6Ac5pW41+ejnLGYUeJJPFWN+ytF7K4izR4u0IUxhAxNy7EwaujBE8Tr9zCREA8kZYPT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SNRZIlkIQfr2XxDNhrlBDHkr/swtumsR7/J+3zcYVU=;
 b=OwFfv0h6fFzVn5eaQd6WIrXQwFO/iYR0IIPU82tvRv6d7SS24iizpU+RxBFFDMmptiH7YNwmwTNWF7kZTxg8Q8PhUhNg7sQIkod5OgobO/5twDB1s2IRso/LG5UxFRPTAb9QQWil/NK3D+G7+BOkJYXDzzUXNRbd9N5wBxP1+QbrwbCjINL+18EtUQYHw1e53tkapORKALbEth7ajxsLjcMf6PwR9ArQ5kLioFbviIb6cv/UUGuq+HOscUPYww5gULVKwJCrf2uB9JiWzjlo/IEmb7BP1obiBp7NAjJ+JYobNHIhXwCyJiDwE/4CBj0oFd1LboiulXSEcrJGewi9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SNRZIlkIQfr2XxDNhrlBDHkr/swtumsR7/J+3zcYVU=;
 b=q0M+J/bQadmK/4mE+zNAdAAoYr02QAmJoeoKYI7tmz/Z9pKVPg6+fVphaQf8skqqik4r8sTFEDvFyDNvuWtHABDtONLXtKvvjV0Nehny2WIlLP9JXOT7AlBQ+F801TDM1+7Ij1Ke4R4sCyV+EK2FDoUxbpLe+MLsXgRA0HCBcIQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/arm: Add Kconfig parameter for memory banks number
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <f439d5c4-aa6c-4066-3941-e497b67aeae1@xen.org>
Date: Tue, 7 Dec 2021 10:52:04 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 bertrand.marquis@arm.com,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C96E90F4-611E-4765-9627-EDE75A952E10@arm.com>
References: <20211206153730.49791-1-luca.fancellu@arm.com>
 <f439d5c4-aa6c-4066-3941-e497b67aeae1@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P123CA0040.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::28)
 To PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 2d2b22d2-13ba-4054-2e5f-08d9b96fa1f6
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB6717:EE_|AM5EUR03FT013:EE_|AM8PR08MB5604:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5604137535D4DD27B1E1FF53E46E9@AM8PR08MB5604.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 h1IslRp1z4/LEe9ctmY6mVFz+5/tGzcM05fIb47eaCVdLHww5Kol7v+RHJGHwPhi2o108+YD8KuYsAqeL6bGjy1ltf/HAeyMoHOck7m2p4NPDIC/GoJv1PSIv88rXnkJnd0JnaTpVkhgAs6tHHWBpED5saVbyzQfVTB/WpzseWWmp/b+pRekpKf9gfvVR/EV+2kxeoas/7/9TQ5vtGLcDrgobBV8T0WG73ksPCUbP11QH4X50XxWIy0dZEDFBpJJzyawhLBbRmb39JtUNf75K+sRS35oJDU3jzXJB9XBvg6pvC83UEibtSvje5yareAM5mVtJCf7mEXGaii7nDw/vAvHq5YOJBWdG8txHkTPG/Po9wRHGuogxfmlUmmdH0fvnjqnWmxUeTZiI+5E05pxOMnHWSeLCvudnXMUsBZqZAGhrXNt9sk/ebdWgW77BLCvVI9oJCFReS47Lbo5kKw/a9dfVApPCUj8RMyQ1KaBNo9pVfvSdD3cw6zk0F05cg9WAqW5A3jeaj8mhwTpcDUUw8L4VytDY7GX25QCjaWQUEEyLnaFCIkA+qc8u+unJl1d0Lnk8QtGjH91NeMTGgEZtju58PLY9VLfkYo2VJT9J+H1m1WNusziuDyY3QcfF8lco9aaKoCsfrunkLHnS8UbGZFjBWGCwsgWycTR2t+Ea98eQyFaqr2oiPbWWz68bxNpCuMRzf8oUQBpRG+BjSWcJO/rfaAwAup18A4EylXAJnqZ+UnQ49M5rdneW4Avoj9L
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(508600001)(6916009)(2906002)(6486002)(8936002)(52116002)(86362001)(66476007)(54906003)(66556008)(66946007)(83380400001)(26005)(186003)(15650500001)(33656002)(5660300002)(6506007)(38350700002)(6512007)(36756003)(316002)(53546011)(38100700002)(4326008)(2616005)(44832011)(956004)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6717
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a349be8c-64bd-4069-9f09-08d9b96f9bf1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U1aFxpQGTV30iDFOlgyS1Wthv9yXKKdanoulYN3EeFyFGfPcUfpTtK5qT8YaMv99N7HjiuR0YEv3s7MY0Tr8Nj9bau9i2Zq8rihz+FEb+TBZ3PiEs2SF2BmUQeCOyJRwlb4+8lEZvbhx0iMGVGUgNQh8PQepBlCN4+W+xS5DddBXxnJCTkTUwg9NPscV3AcuVdXPINlLlhKZiN2ImXSDu/anqxiWeoAUiRxbdwiJ9w/w02R0YBd5wA2ERr33/WOL/DVRtyDX+1DqRw5rOmiuaQ8L7GQv+idfHHnlC+BgZ/c3E9hzlqDsoJGy2duwsBLBG1IaNeEwiWJIKmCOq0TWKzihP9I0MV1J/LFkDknCxrm5ZgvtJVcKiNO+qMxWuoWy4CJxc/YCv06vLMgyy7a1POocRtisRHL4LW5ekfaDzcv/UdBMUNfTkQunXvf1pK1U+v75eN6WbZQmO6X3vhKT7F7IpYOlKlkNA0MA51B7FlhIFxkywFxOEahMAuwy1RXWSURF1U6WT20inU+PyOVxlMofQdBDT5DZntQgU28mYIR80tyM0dKdTemJWgY1++3y5ULCFJeRIHS4TYI82BhOgxH9aVbyihDDFo1Nt8Y3rjtgsiYBWYuO97E0Jgx4h5h2fHHG+DjieuTrRK5JkH9lg5ebgpx1svfP3DxAS/0w+glB6RYrcyYdj2Ouk1wG8sCg8VIBPf12biYU1YNsdTsK3g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6486002)(316002)(15650500001)(33656002)(36756003)(8936002)(6512007)(44832011)(6862004)(86362001)(956004)(70586007)(81166007)(8676002)(70206006)(6506007)(54906003)(186003)(47076005)(53546011)(107886003)(26005)(2616005)(83380400001)(5660300002)(36860700001)(4326008)(2906002)(82310400004)(508600001)(336012)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 10:52:15.8506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2b22d2-13ba-4054-2e5f-08d9b96fa1f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5604



> On 6 Dec 2021, at 17:05, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 06/12/2021 15:37, Luca Fancellu wrote:
>> Currently the maximum number of memory banks is fixed to
>> 128, but on some new platforms that have a large amount
>> of memory, this value is not enough=20
>=20

Hi Julien,

> Can you provide some information on the setup? Is it using UEFI?

Yes it is a platform with 32gb of ram, I=E2=80=99ve built Xen with ACPI sup=
port and it=E2=80=99s starting using UEFI+ACPI.

>=20
>> and prevents Xen
>> from booting.
>=20
> AFAIK, the restriction should only prevent Xen to use all the memory. If =
that's not the case, then this should be fixed.

The code that it=E2=80=99s failing is this, inside efi_process_memory_map_b=
ootinfo(=E2=80=A6) in the arch/arm/efi/efi-boot.h:

#ifdef CONFIG_ACPI
        else if ( desc_ptr->Type =3D=3D EfiACPIReclaimMemory )
        {
            if ( !meminfo_add_bank(&bootinfo.acpi, desc_ptr) )
            {
                PrintStr(L"Error: All " __stringify(NR_MEM_BANKS)
                          " acpi meminfo mem banks exhausted.\r\n");
                return EFI_LOAD_ERROR;
            }
        }
#endif

>=20
>> Create a Kconfig parameter to set the value, by default
>> 128.
>=20
> I think Xen should be able to boot on any platform with the default confi=
guration. So the value should at least be bumped.
>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  xen/arch/arm/Kconfig        | 8 ++++++++
>>  xen/include/asm-arm/setup.h | 2 +-
>>  2 files changed, 9 insertions(+), 1 deletion(-)
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index ecfa6822e4d3..805e3c417e89 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -25,6 +25,14 @@ menu "Architecture Features"
>>    source "arch/Kconfig"
>>  +config MEM_BANKS
>> +	int "Maximum number of memory banks."
>> +	default "128"
>> +	help
>> +	  Controls the build-time size memory bank array.
>> +	  It is the upper bound of the number of logical entities describing
>> +	  the memory.
>=20
> NR_MEM_BANKS is going to be used by multiple internal structure in Xen (e=
.g. static memory, reserved memory, normal memory). So how could an admin d=
ecide the correct value?
>=20
> In particular for UEFI, we are at the mercy of the firmware that can expo=
se any kind of memory map (that's why we had to increase the original numbe=
r of banks).
>=20
> So maybe it is time for us to move out from a static array and re-think h=
ow we discover the memory.
>=20
> That this is probably going to take some time to get it properly, so
> I would be OK with bumping the value + a config gated UNSUPPORTED.

I can do that.

Cheers,
Luca

>=20
>> +
>>  config ACPI
>>  	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUP=
PORTED)" if UNSUPPORTED
>>  	depends on ARM_64
>> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
>> index 95da0b7ab9cd..785a8fe81450 100644
>> --- a/xen/include/asm-arm/setup.h
>> +++ b/xen/include/asm-arm/setup.h
>> @@ -6,7 +6,7 @@
>>  #define MIN_FDT_ALIGN 8
>>  #define MAX_FDT_SIZE SZ_2M
>>  -#define NR_MEM_BANKS 128
>> +#define NR_MEM_BANKS CONFIG_MEM_BANKS
>>    #define MAX_MODULES 32 /* Current maximum useful modules */
>> =20
>=20
> Cheers,
>=20
> --=20
> Julien Grall


