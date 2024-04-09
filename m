Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3289DC74
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 16:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702485.1097550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCbr-0001hZ-8r; Tue, 09 Apr 2024 14:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702485.1097550; Tue, 09 Apr 2024 14:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCbr-0001eu-60; Tue, 09 Apr 2024 14:38:03 +0000
Received: by outflank-mailman (input) for mailman id 702485;
 Tue, 09 Apr 2024 14:38:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0lRi=LO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ruCbp-0001em-Pr
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 14:38:01 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2606::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c35f2241-f67e-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 16:38:00 +0200 (CEST)
Received: from DU2PR04CA0313.eurprd04.prod.outlook.com (2603:10a6:10:2b5::18)
 by PAVPR08MB8821.eurprd08.prod.outlook.com (2603:10a6:102:2fc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 14:37:54 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::32) by DU2PR04CA0313.outlook.office365.com
 (2603:10a6:10:2b5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Tue, 9 Apr 2024 14:37:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Tue, 9 Apr 2024 14:37:54 +0000
Received: ("Tessian outbound ff4e98f65004:v300");
 Tue, 09 Apr 2024 14:37:53 +0000
Received: from f3db432659a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 951DC119-5118-489F-AB96-C4CE62E48EFC.1; 
 Tue, 09 Apr 2024 14:37:48 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3db432659a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Apr 2024 14:37:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8565.eurprd08.prod.outlook.com (2603:10a6:20b:568::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 14:37:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%5]) with mapi id 15.20.7409.053; Tue, 9 Apr 2024
 14:37:46 +0000
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
X-Inumbo-ID: c35f2241-f67e-11ee-b907-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aj3snASZVxp8X36NmNkNJ4xVDHDuYfh2Kro1stP5KtwkR2hbN9ImQGAhCfso5/5FhmX1srFpXwUMyOBzP/VV2RVvqGNFciPVmZ00+VbKbpSt/dC7IgI8reKeBjVzjUIVIzsI9CcPBaYcfWu20/Pthut4sOeOSSFosxrfENKJXLG/g+WzIfHmfI54KQGb0K6u89jBZ9zbeKzT7Rx9CalZv3dSvGhGU50GFD1O68j6UUS11oQPnbj/mD08FxRRel12yqukdk4DAvqUEm50QClXGSn0QlV5WFuFfQnRnJOABnswMaQbPz3ibVm0c2IACibqwI4qY5RVmW5hcynSojM03g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pG+vC1Pu0qLn7IahqeWMalRGteEWL1LJMGbyUbwFqQ0=;
 b=nlBUnQYLMphaLOT1GtztrGN2P6E/2JxwaGJVad/1w713P68pwTO5dsFeXMp5l4VKpLzdXpJkHRyt2Ry/hPPDiEMzCJ9JmFTveYI5Vo+Ffiv5FCzGfQe4qRUi+PDeQKZ3s/WV2loUReO+cEObrQxaj3GNeWm1A9nEafXkqKpe+HacFGxMumEopB4BXQp32Cq7HBm2eaOp9TvrYehZleT/u339CvU8c4esNpLgR5tbwQUauvYaNvh4PMEkrbQsSyd2dqj+t8k2v7u7+14AijP9tScrO91BtyPyRlAU2ox0M9/Z9nopZuKeHpSLzxi+4YPbDaUNlw75QWezRUUKeZe4Nw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pG+vC1Pu0qLn7IahqeWMalRGteEWL1LJMGbyUbwFqQ0=;
 b=iizWo5k7p9L2qb8d7nD8ca07RwykdOw09ODJZ0p0yifWhvd3LciU2vX84e/eT38EvepArW1oI5PTZABtekZdEnBmV3V7ysUtlZ6XY2yeph5hWhANQzehZ880YwpgO0dJK9vUhB5JIAYRP+5U9lDVNMbXwb9Hsojb6z1+2MZ3PaQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e29d77798d7127b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6Ciqfe/t98u5g2Devhi8ZjWVbOfZj364IPQn0zuKFeFNjRrCvlpvEE3+zGQASAs13++K2o7Fq9q9eDbrBGDTPFZFJ5JrpGjRJ+b1UHloqQUQAp77SMIJAcXJV00v26QJKzEiEYw3qfJO++I2yzJG2FQeqNkgKST/JLn6h5KmnERJNmRVCCJACVAK7OVRCUFr0KqwClH/S7a7FcUqIN0sqSCKjK5EawcvpdYTN3IOqHjkq8TTqvEDFRWhWP3Ewn0qSr0ouJTJCDnvDoc5OlijImNsA/SsR+Eg8gqq2/0WXSjzUn1nlisbhN7kAmTS/2Mg5zh7MiToqGm3NkBN6zq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pG+vC1Pu0qLn7IahqeWMalRGteEWL1LJMGbyUbwFqQ0=;
 b=f8JQwg/zfQppYRFtfcIb26Nz8RTIkMETGxm+IP0vdHs+Pmn0PzDELKS/gwtYI9Yw4hL93VQmTpVAeI9aPSkYm8V8OkpRSPYulcfKF7BY60iZLsCB+xNDKhUbspOScVcOoBBuDdzAbqMZbGFVe012vfyfMLtdCeozIU4WTvDwAVbp0RkOzBfjv8019TwtYE0QLqyCuNHJgl0kJ9Py6dTS34mDm+YBEkbDH7j7Erxas9ALuWBpJdgHrDJq+ngZdnlXwjVl9diRV+wzM1SMQXqA9Oy1JrMzqACqwmtfh1b/k6VEtR2CAxGNkqmD/mJrZ+wbFEwiNB/m/mXFnS6l8BZy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pG+vC1Pu0qLn7IahqeWMalRGteEWL1LJMGbyUbwFqQ0=;
 b=iizWo5k7p9L2qb8d7nD8ca07RwykdOw09ODJZ0p0yifWhvd3LciU2vX84e/eT38EvepArW1oI5PTZABtekZdEnBmV3V7ysUtlZ6XY2yeph5hWhANQzehZ880YwpgO0dJK9vUhB5JIAYRP+5U9lDVNMbXwb9Hsojb6z1+2MZ3PaQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 06/13] xen/arm: Avoid code duplication in
 find_unallocated_memory
Thread-Topic: [PATCH v2 06/13] xen/arm: Avoid code duplication in
 find_unallocated_memory
Thread-Index: AQHainOJn9rbiVDC1UmGGgx4oNVl2bFf8W4AgAAQl4A=
Date: Tue, 9 Apr 2024 14:37:46 +0000
Message-ID: <C945CE60-22BB-4D79-94B4-74ACBC349595@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-7-luca.fancellu@arm.com>
 <611fb8ea-1b2f-487e-956f-0aba716912c3@amd.com>
In-Reply-To: <611fb8ea-1b2f-487e-956f-0aba716912c3@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB8565:EE_|DB5PEPF00014B9D:EE_|PAVPR08MB8821:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KBQ5lVDX7hvwkI7JVsGGHZNXFLa4zSCxPEI/6yzZWRdImvmsvBIfjRsElAe6WmmNYLimS3s0+KV5HPpt1Qbnld+rQuIRm++4T0hLB8yilAf3rHfLGsKcuhd0hFKt6qECqnKEZDEpkcTfXkHJD+ELmtTVMk+6V6XQGaL84N8uTbhIdFIRzo+g9mz3ecVmc6IluTIPzGLTHe6AgKnQX9iHRbTJVGXdmTJu1VAsckdzpNsauUGhpqpscZWg4HXKxCa7kYMYho6LF8anfAxsD57JoFphPDuqPGsKylmGCU7kbtimi6qAjjDe734B+pmintD2+wPjmeMZhKvXJHYqUwPyHBOz/VIlKxa7rUfs1PJKQ9zkUoZvAw4dXwPqTVALnTfKJxe3seXb/jtANL6/stRUR3NyyE2fFAVwpUk3qUPbaDWRv3Bv5cvtZcf6e4jV6tHQHyd7S40C9TjkmGjfrybIFmEN2JCadQ6cEHwO4Q06QmYmSPdqwcBSlPhWsNJGE69wEhPao0gZi9sbTyYK0Ugoxv7Sod96H1arjInXekNG/9OAYCOalbuie7NhVB9jM8Rq0w+aQTD1QBCjeAnJxTe10BdXD2AiCPLIj1vcH36gzMvwkm6IJSFdMdU3UVamorULmrET9ch7+B2QbZ1AjMYHBozpbAczl3fkrU1IByb1LTk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B79A4D340D007B4B8D9D6086EBC6B97D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8565
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94f3c7b2-87e1-4ddb-1a3a-08dc58a2a41a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tjFJgJKDbOGr/lcxYiyVuWgNX5glnNRIXkq5azH9XgTSwzvfNJTlUipUroeOQEnNC2aOdMyN3KR61X+lE7bDROngGej8Kl8WeI1aFotepbkXR6SvUcwa0wdU/lGhPUXI0wn+PYkBNpcLPqfYLMBP0FkJMkOTdoRQVdlyqhlb3gr8LVTz54KdH85xqaGcppFEaO77eWhx3ch9O4CZjM92BJdt8G7NX175+b0+Aox/SU7Ja3LoU/qPRP6QjzbW2Y9xggXHOXKKPIl6qstlrTbVo/pwJ3c+lgFOeXDkODmXXucZxLQGoSCv0A7Y35Nub4aUNXYmC4Dbn2gwO0wIhcb1wW6QRtFNmfczbg17CCqvBEJXzrN0NTZdf6TGl8AewXhuXPGzBGLM9TpY6YcWgbzIuB7lkm3P3b67wDYi10ThejndBAy1w1spA8axDbigh/POA/5ejPaId/kn/0WmLWmqsjws0T4T2fiMDkjdOZ/uDVh5ZRwJhjeCn375c8PqZPj9ztYLZ0UkFMsX3QXIWhtwCVj7HbZ59aSr6WCr8LqArxhj9/5k12QYN/bVJVRlNvcrh+s2pGuC37ztfIlEPgpxzenogPNhE6aluQ/cYABI0zQsCxjiR2LCJ16PsWQq0g5YsINd96RHHbZ9T3EfCiVAu6rHETGzWDGC0D9hlZipCbUQoupUnPZ2tTCfXxFzr4qSCxgAvlNh2MACudBl2QAzsDjcuNUjN8/DVoseZeSKvWaJWxV6YEPllKGR3pBpgX3t
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 14:37:54.0888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f3c7b2-87e1-4ddb-1a3a-08dc58a2a41a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8821



> On 9 Apr 2024, at 14:38, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Luca,
>=20
> On 09/04/2024 13:45, Luca Fancellu wrote:
>>=20
>>=20
>> The function find_unallocated_memory is using the same code to
>> loop through 3 structure of the same type, in order to avoid
>> code duplication, rework the code to have only one loop that
>> goes through all the structures.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v2:
>> - Add comment in the loop inside find_unallocated_memory to
>>   improve readability
>> v1:
>> - new patch
>> ---
>> ---
>> xen/arch/arm/domain_build.c | 70 +++++++++++++------------------------
>> 1 file changed, 25 insertions(+), 45 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 57cf92668ae6..269aaff4d067 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -869,12 +869,14 @@ static int __init add_ext_regions(unsigned long s_=
gfn, unsigned long e_gfn,
>> static int __init find_unallocated_memory(const struct kernel_info *kinf=
o,
>>                                           struct membanks *ext_regions)
>> {
>> -    const struct membanks *kinfo_mem =3D kernel_info_get_mem_const(kinf=
o);
>> -    const struct membanks *mem =3D bootinfo_get_mem();
>> -    const struct membanks *reserved_mem =3D bootinfo_get_reserved_mem()=
;
>> +    const struct membanks *mem_banks[] =3D {
>> +        bootinfo_get_mem(),
>> +        kernel_info_get_mem_const(kinfo),
>> +        bootinfo_get_reserved_mem(),
>> +    };
>>     struct rangeset *unalloc_mem;
>>     paddr_t start, end;
>> -    unsigned int i;
>> +    unsigned int i, j;
>>     int res;
>>=20
>>     dt_dprintk("Find unallocated memory for extended regions\n");
>> @@ -883,50 +885,28 @@ static int __init find_unallocated_memory(const st=
ruct kernel_info *kinfo,
>>     if ( !unalloc_mem )
>>         return -ENOMEM;
>>=20
>> -    /* Start with all available RAM */
>> -    for ( i =3D 0; i < mem->nr_banks; i++ )
>> -    {
>> -        start =3D mem->bank[i].start;
>> -        end =3D mem->bank[i].start + mem->bank[i].size;
>> -        res =3D rangeset_add_range(unalloc_mem, PFN_DOWN(start),
>> -                                 PFN_DOWN(end - 1));
>> -        if ( res )
>> +    /*
>> +     * Exclude the following regions, in order:
>> +     * 1) Start with all available RAM
>> +     * 2) Remove RAM assigned to Dom0
>> +     * 3) Remove reserved memory
> Given this commit and the previous code, I expect one call to rangeset_ad=
d_range() and
> 3 calls to rangeset_remove_range(). However ...
>> +     * The order comes from the initialization of the variable "mem_ban=
ks"
>> +     * above
>> +     */
>> +    for ( i =3D 0; i < ARRAY_SIZE(mem_banks); i++ )
>> +        for ( j =3D 0; j < mem_banks[i]->nr_banks; j++ )
>>         {
>> -            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr=
"\n",
>> -                   start, end);
>> -            goto out;
>> -        }
>> -    }
>> -
>> -    /* Remove RAM assigned to Dom0 */
>> -    for ( i =3D 0; i < kinfo_mem->nr_banks; i++ )
>> -    {
>> -        start =3D kinfo_mem->bank[i].start;
>> -        end =3D kinfo_mem->bank[i].start + kinfo_mem->bank[i].size;
>> -        res =3D rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
>> +            start =3D mem_banks[i]->bank[j].start;
>> +            end =3D mem_banks[i]->bank[j].start + mem_banks[i]->bank[j]=
.size;
>> +            res =3D rangeset_add_range(unalloc_mem, PFN_DOWN(start),
> ... here you always call rangeset_add_range() which is wrong. For direct =
mapped domain
> you would e.g. register its RAM region as extended region.

Right, I read it wrong initially, my mistake, here we are adding all availa=
ble ram and later removing the dom0 regions
and reserved regions. Will fix

>=20
> ~Michal


