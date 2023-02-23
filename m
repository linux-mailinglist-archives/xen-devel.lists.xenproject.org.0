Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879356A0BD9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 15:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500439.771813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCY2-0005z4-3V; Thu, 23 Feb 2023 14:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500439.771813; Thu, 23 Feb 2023 14:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCY2-0005wJ-0X; Thu, 23 Feb 2023 14:26:14 +0000
Received: by outflank-mailman (input) for mailman id 500439;
 Thu, 23 Feb 2023 14:26:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERnD=6T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVCY0-0005wD-Ee
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 14:26:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0500c54c-b386-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 15:26:11 +0100 (CET)
Received: from DB6PR07CA0177.eurprd07.prod.outlook.com (2603:10a6:6:43::31) by
 AS8PR08MB8014.eurprd08.prod.outlook.com (2603:10a6:20b:573::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.19; Thu, 23 Feb 2023 14:26:09 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::ff) by DB6PR07CA0177.outlook.office365.com
 (2603:10a6:6:43::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.7 via Frontend
 Transport; Thu, 23 Feb 2023 14:26:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21 via Frontend Transport; Thu, 23 Feb 2023 14:26:08 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Thu, 23 Feb 2023 14:26:08 +0000
Received: from b73b0e3ed1e3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A8F2693-CE8E-4321-917B-72B3191D04AC.1; 
 Thu, 23 Feb 2023 14:25:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b73b0e3ed1e3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Feb 2023 14:25:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB8650.eurprd08.prod.outlook.com (2603:10a6:10:3d2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20; Thu, 23 Feb
 2023 14:25:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 14:25:50 +0000
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
X-Inumbo-ID: 0500c54c-b386-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjfGa5qgXaobxgB33Zt1xWWCHqNEAzSASqZRyeZXA38=;
 b=JexJDMeqKKfhRoYAX7ZaOYH3r0ocZc+ya6hgGOOF34Z3aPbdOCtEPnZtyBWaKxfbY+UeAUsZeqL+E75Wg3mMAJKwyL4zEDEqWFug25oAbwZXZmUYxqQAe9K0WVEFFRUZXXly87h+0BQqBmkXvpePRVHwlW/6+Ew4szXO/KWRZDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1b20a0e1a257d006
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZFhZTlmdrIpYw9wwXltGlMZeCInT+Y2Awg5RmPtDwLtxzewe62u8KIknRkjzXjqA8eDsQPHudRdcPgM8Hx8yeqs/Q//XAE8ig96wa16xSehnCn7HtiSTqyc6fsvjzbyDPsmdL5fCiILBG0g0xtFVAaM8//Sx/9t4ei//WDVUd9IDeJ3Jtj5OgAgb7yX9gYeudO/8ym4B8eZU7/lrrNfCMeo3XY5bKS9lCv7+G/AdR9irAKFjPlMju6QQo+PIMj8yilMlo5Y7VaWEr2KSo7OZ+NJ/hz9G85zNkkMOXwJ/foNCupqZtsIRT2RrQxo3UBkXqt/4fOZ7wcxeL2yuyPbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjfGa5qgXaobxgB33Zt1xWWCHqNEAzSASqZRyeZXA38=;
 b=F7apHjqqG7MIkay6VXfbboVdHRH5Szi4eDgmXoXSK/93TdosqjSxuqmA58Go0i++B3T0JrSbs2u082y/He+Fmha6SB+keiuUkosF+5YR6sZwzkohyD+swyy9FH+zvZdycSCUBOK41OSTK0nCXkH81AirkaMr4mmf5mstodjM7J8GEkgu0PcOIObcmji4WnN54MnYp5nkCcQV4lwChn1vtCaRYsUYvFeNxv3ySPMo98ncp4ovN9/Z3bGEKo62Kd/CBPBqB+yNxJOj1LNZq8Sph2NFzLM/kryEyZX9Z/MKWYU/nBuhb6IRkxwAToEILXyd8Am5xlIrc1/FFQZ/Hqxa2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjfGa5qgXaobxgB33Zt1xWWCHqNEAzSASqZRyeZXA38=;
 b=JexJDMeqKKfhRoYAX7ZaOYH3r0ocZc+ya6hgGOOF34Z3aPbdOCtEPnZtyBWaKxfbY+UeAUsZeqL+E75Wg3mMAJKwyL4zEDEqWFug25oAbwZXZmUYxqQAe9K0WVEFFRUZXXly87h+0BQqBmkXvpePRVHwlW/6+Ew4szXO/KWRZDs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 5/5] xen/arm64: smpboot: Directly switch to the runtime
 page-tables
Thread-Topic: [PATCH v5 5/5] xen/arm64: smpboot: Directly switch to the
 runtime page-tables
Thread-Index: AQHZMolVWqpcyUlS5UyY9RlLEvMrLa7cutqAgAAFeoA=
Date: Thu, 23 Feb 2023 14:25:49 +0000
Message-ID: <EA6E4E38-82C4-4646-9E5A-089CB2F5C512@arm.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-6-julien@xen.org>
 <4B07FF54-33ED-4DF4-94D7-B852C67A286A@arm.com>
In-Reply-To: <4B07FF54-33ED-4DF4-94D7-B852C67A286A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB8650:EE_|DBAEUR03FT023:EE_|AS8PR08MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1dd1c3-68ab-4ed8-d61d-08db15a9e7c2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RYPgydGuqkBxboKjoINouMFUFW+JL14BP8+3Hb17HXuoc63a5SMi+bF75gwiVSSZ3kJn4PmvIT8MBjn33KV+bO9iREls134lPFp7jIqnSRXClqSP4Vpy5UUETDy3qMwG4e9udfweM+ooka42ruOe+IMVE+h9P6K/CSEYqbqmK6vqVE2ZvffdtHicpxZUqoNHXRL3CjdI7HgDS8FxfU3hIhvDwf+Q2VzZxzwJR1Ca2BJ6bytzZfhN8OhlMO9u1Q85Whzh9dz+rwwcg749Jj2C2TE/tulCUAw+S7GYP0oOzdqWBaGlAB8ACY17tRwLMW8s8ARIubWEOD39v6re35jpHcCRgltt5K0vSxqxJ7tLA+G6LBrLdAodeaJZQkD5Imt0h9i9nlXZuoCU1ixc/gHAKhZ/PTMnpySrcWmDqj45k02HdPqB9m/cDxJST6VGI2sWlqOJZ9NiHkVpQgMMRY9KMZRPUFuu/TQq9AMizRAPdXt7SoWSwLBB4BlpGZROK/sBDarkz5xVxbhEuOB+6xlo8Z5k5LLRe3P+373cCotRcGOdqEc/8IMRcDzyON9QvDp+NwS6badBwUVQ1H3co898VhdqWxHlS1YCO7LCLbuSqIGDiVqsEwiEb6RUYwuePA7qRsROpMJzKKYQpLe4aTw/hc7HX7fsTUT1BuzZDN/FUFaZSO0U9Ss6b3OSLZ3OtETb+8/czUP64IquoUk6p5nq5EHbudC3ySHAin48hmtGcnk0QvsaTJ5udqAOHBMU2R4EsgwJka4XQT8KqWzRTSNUlPRQDerupfKUuYPuuk3dJj3g2RIIahqNqOOI2XHIuj6M
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199018)(6486002)(76116006)(71200400001)(66556008)(122000001)(6916009)(4326008)(8676002)(66446008)(66476007)(38070700005)(66946007)(64756008)(86362001)(2906002)(41300700001)(91956017)(5660300002)(8936002)(38100700002)(2616005)(316002)(33656002)(54906003)(83380400001)(36756003)(478600001)(26005)(6512007)(6506007)(186003)(53546011)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <68090FFF21C54441871E28A41AF4330F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8650
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7cf6b5d3-5492-4692-7714-08db15a9dc77
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RwXQrO7SdHivGp99FRRxH26a4fwP+0rbv3YNNk9RBVg0i38YeBN3XmSoa2hnLd9pQrHq1IRix5DhS6JesOkDcdLRu0T22AG+OTai0TxhR9YwkONI5mFvoEgvj+ra1qNSzW7UXfsVxutl0CKNcARkNknWoxhxzPOLGZvPIHaEsKdo46aAj4jy3Y+T8RrISWPzWqVNzOyxnIBokR6F3wPXQA5ZFbOGNg7MQ0j932g0iUmm/JDzIPDJ5nebvlXZF8uIss6oYQff3c/flIbMAdqFxTE8ifKSVvkEi0PxuGwr++p20sRY2Rh/WCoz6/xzwNJHR/xbcKAZK24iYraf2hUJ0xKsyZOaLqa1QVGQA6jgqxWnPwq9bnoWnYbDGbvZ7n4NIcsEChiW6NN+RNlLtERlVFU61/j68Ngmq0dPVlW10fD7Qb30vdvzPMDXXuKXZzKXt4aAlQKqzCcdVQa7CVhNUtJEPnWPE1tC5z1ExpmvFcAM8Xpcfv7oUkd9M77Jw82Hk3GmrxjiL99iaOsjILBY110xQVOLgqo4nuoJIImw4LGU2eR34hdTwYke46HRxzqpaDc48QbHCk90S7aYlKHtsak4bS8iS02qMpNGm7p9U/dkElB3J0bY838kAK0AbkKP2MSbH7XAOQvtFBi5liuevYHg34JJ5KocdQp6BsVyvmzDLODi5Lg56Lxiwms58ol5VS5SbS5yegFs1F+WGe6D8pFmX9b/u8Aa0WeBO36S+Bk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199018)(36840700001)(40470700004)(46966006)(26005)(186003)(36860700001)(2616005)(6486002)(6512007)(107886003)(336012)(6506007)(53546011)(54906003)(478600001)(47076005)(316002)(83380400001)(5660300002)(40460700003)(8676002)(356005)(4326008)(8936002)(6862004)(41300700001)(40480700001)(70206006)(70586007)(36756003)(82740400003)(81166007)(86362001)(33656002)(82310400005)(2906002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 14:26:08.5019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1dd1c3-68ab-4ed8-d61d-08db15a9e7c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8014


> On 23 Feb 2023, at 15:06, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi Julien,
>=20
>> On 27 Jan 2023, at 20:55, Julien Grall <julien@xen.org> wrote:
>>=20
>> From: Julien Grall <jgrall@amazon.com>
>>=20
>> Switching TTBR while the MMU is on is not safe. Now that the identity
>> mapping will not clash with the rest of the memory layout, we can avoid
>> creating temporary page-tables every time a CPU is brought up.
>>=20
>> The arm32 code will use a different approach. So this issue is for now
>> only resolved on arm64.
>>=20
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com <mailto:bertrand.=
marquis@arm.com>>

Sorry for that.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> Cheers
> Bertrand
>=20
>>=20
>> ---
>>   Changes in v5:
>>       - Add Luca's reviewed-by and tested-by tags.
>>=20
>>   Changes in v4:
>>       - Somehow I forgot to send it in v3. So re-include it.
>>=20
>>   Changes in v2:
>>       - Remove arm32 code
>> ---
>> xen/arch/arm/arm32/smpboot.c   |  4 ++++
>> xen/arch/arm/arm64/head.S      | 29 +++++++++--------------------
>> xen/arch/arm/arm64/smpboot.c   | 15 ++++++++++++++-
>> xen/arch/arm/include/asm/smp.h |  1 +
>> xen/arch/arm/smpboot.c         |  1 +
>> 5 files changed, 29 insertions(+), 21 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/arm32/smpboot.c b/xen/arch/arm/arm32/smpboot.c
>> index e7368665d50d..518e9f9c7e70 100644
>> --- a/xen/arch/arm/arm32/smpboot.c
>> +++ b/xen/arch/arm/arm32/smpboot.c
>> @@ -21,6 +21,10 @@ int arch_cpu_up(int cpu)
>>    return platform_cpu_up(cpu);
>> }
>>=20
>> +void arch_cpu_up_finish(void)
>> +{
>> +}
>> +
>> /*
>> * Local variables:
>> * mode: C
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 5efd442b24af..a61b4d3c2738 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -308,6 +308,7 @@ real_start_efi:
>>        bl    check_cpu_mode
>>        bl    cpu_init
>>        bl    create_page_tables
>> +        load_paddr x0, boot_pgtable
>>        bl    enable_mmu
>>=20
>>        /* We are still in the 1:1 mapping. Jump to the runtime Virtual A=
ddress. */
>> @@ -365,29 +366,14 @@ GLOBAL(init_secondary)
>> #endif
>>        bl    check_cpu_mode
>>        bl    cpu_init
>> -        bl    create_page_tables
>> +        load_paddr x0, init_ttbr
>> +        ldr   x0, [x0]
>>        bl    enable_mmu
>>=20
>>        /* We are still in the 1:1 mapping. Jump to the runtime Virtual A=
ddress. */
>>        ldr   x0, =3Dsecondary_switched
>>        br    x0
>> secondary_switched:
>> -        /*
>> -         * Non-boot CPUs need to move on to the proper pagetables, whic=
h were
>> -         * setup in init_secondary_pagetables.
>> -         *
>> -         * XXX: This is not compliant with the Arm Arm.
>> -         */
>> -        ldr   x4, =3Dinit_ttbr         /* VA of TTBR0_EL2 stashed by CP=
U 0 */
>> -        ldr   x4, [x4]               /* Actual value */
>> -        dsb   sy
>> -        msr   TTBR0_EL2, x4
>> -        dsb   sy
>> -        isb
>> -        tlbi  alle2
>> -        dsb   sy                     /* Ensure completion of TLB flush =
*/
>> -        isb
>> -
>> #ifdef CONFIG_EARLY_PRINTK
>>        /* Use a virtual address to access the UART. */
>>        ldr   x23, =3DEARLY_UART_VIRTUAL_ADDRESS
>> @@ -672,9 +658,13 @@ ENDPROC(create_page_tables)
>> * mapping. In other word, the caller is responsible to switch to the run=
time
>> * mapping.
>> *
>> - * Clobbers x0 - x3
>> + * Inputs:
>> + *   x0 : Physical address of the page tables.
>> + *
>> + * Clobbers x0 - x4
>> */
>> enable_mmu:
>> +        mov   x4, x0
>>        PRINT("- Turning on paging -\r\n")
>>=20
>>        /*
>> @@ -685,8 +675,7 @@ enable_mmu:
>>        dsb   nsh
>>=20
>>        /* Write Xen's PT's paddr into TTBR0_EL2 */
>> -        load_paddr x0, boot_pgtable
>> -        msr   TTBR0_EL2, x0
>> +        msr   TTBR0_EL2, x4
>>        isb
>>=20
>>        mrs   x0, SCTLR_EL2
>> diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
>> index 694fbf67e62a..9637f424699e 100644
>> --- a/xen/arch/arm/arm64/smpboot.c
>> +++ b/xen/arch/arm/arm64/smpboot.c
>> @@ -106,10 +106,23 @@ int __init arch_cpu_init(int cpu, struct dt_device=
_node *dn)
>>=20
>> int arch_cpu_up(int cpu)
>> {
>> +    int rc;
>> +
>>    if ( !smp_enable_ops[cpu].prepare_cpu )
>>        return -ENODEV;
>>=20
>> -    return smp_enable_ops[cpu].prepare_cpu(cpu);
>> +    update_identity_mapping(true);
>> +
>> +    rc =3D smp_enable_ops[cpu].prepare_cpu(cpu);
>> +    if ( rc )
>> +        update_identity_mapping(false);
>> +
>> +    return rc;
>> +}
>> +
>> +void arch_cpu_up_finish(void)
>> +{
>> +    update_identity_mapping(false);
>> }
>>=20
>> /*
>> diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/s=
mp.h
>> index 8133d5c29572..a37ca55bff2c 100644
>> --- a/xen/arch/arm/include/asm/smp.h
>> +++ b/xen/arch/arm/include/asm/smp.h
>> @@ -25,6 +25,7 @@ extern void noreturn stop_cpu(void);
>> extern int arch_smp_init(void);
>> extern int arch_cpu_init(int cpu, struct dt_device_node *dn);
>> extern int arch_cpu_up(int cpu);
>> +extern void arch_cpu_up_finish(void);
>>=20
>> int cpu_up_send_sgi(int cpu);
>>=20
>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>> index 412ae2286906..4a89b3a8345b 100644
>> --- a/xen/arch/arm/smpboot.c
>> +++ b/xen/arch/arm/smpboot.c
>> @@ -500,6 +500,7 @@ int __cpu_up(unsigned int cpu)
>>    init_data.cpuid =3D ~0;
>>    smp_up_cpu =3D MPIDR_INVALID;
>>    clean_dcache(smp_up_cpu);
>> +    arch_cpu_up_finish();
>>=20
>>    if ( !cpu_online(cpu) )
>>    {
>> --=20
>> 2.38.1
>>=20
>>=20
>=20
>=20


