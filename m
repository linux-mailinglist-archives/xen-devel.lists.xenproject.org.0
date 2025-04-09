Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1ADA8238F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 13:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943935.1342534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2TbP-00030f-9T; Wed, 09 Apr 2025 11:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943935.1342534; Wed, 09 Apr 2025 11:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2TbP-0002ya-6S; Wed, 09 Apr 2025 11:28:19 +0000
Received: by outflank-mailman (input) for mailman id 943935;
 Wed, 09 Apr 2025 11:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yx2+=W3=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2TbN-0002yN-Nt
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 11:28:17 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba20ad15-1535-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 13:28:15 +0200 (CEST)
Received: from CH5PR03CA0002.namprd03.prod.outlook.com (2603:10b6:610:1f1::14)
 by CY8PR12MB7172.namprd12.prod.outlook.com (2603:10b6:930:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 11:28:11 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::7b) by CH5PR03CA0002.outlook.office365.com
 (2603:10b6:610:1f1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.23 via Frontend Transport; Wed,
 9 Apr 2025 11:28:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 11:28:11 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:28:08 -0500
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
X-Inumbo-ID: ba20ad15-1535-11f0-9eab-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVMvieJsfZkVZ+8lv2X+eGD+ayrbtEJVvZ6e1ufb47PxaYHgnkMtBEeKbKJNhvcJbJyMJVtVgxIpNvynrWnxnq8GuxTNpftXTL0ci8W4sdpWoqDDIJi/sgHNTEUQQLflzi//+AC9EeTc1qONonxwxTa7fzJmPCihLtOfMjg2MM/GXmZKBq8ys6DVbxF7hXE0UWdKA7RXxNVxmTVhjEnHFJQFxSPKbl+vJOKPcFNNdY/tfqevMUn0RcDVZrJzq82xe2lJkW0l0qsSE4DvnsouiaT59KaviTRnP3NmgznyB3vYZ7vtdXuKKo5OeJfIWWhJLVMFrSME1RDtbakPgmmvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DowtmgwRIK88JgB6IjV7FGb2nBUtbyDSiEL9cfroBg=;
 b=g10SUICceXatt1ZAnVLXPA5uxPAKtO356IFDYadTCJ73BBAeLg12Jb3qiwh/I2Y1LjDLrohLhzJwQ09ZsOeolCjumPurSSNKrRODtKKU/siCs7pn6fEHF2ZEVo2I5QuV/1SR2HQ2Qb8pqS990MZSCcmdlAq2xxnfhNCd+0/uBZ/xx4VC6MXo+HAiepJxJjtxXDIlBBe9BA9PvmUBeEMPnjp+IiXA6L3lyAjysDCY0CB3DdNYA7Y8ZKr1n08o2jYl5Tpo30gp2RBMSsbl9U29iUPcjhgZOUYAIhW2n5KKcBI1HxbhnuWgwZ2MRojZpOddnn1CCyMuO7JQtPATcY1Bkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DowtmgwRIK88JgB6IjV7FGb2nBUtbyDSiEL9cfroBg=;
 b=p90XsMGlBRpNWqVNjGn1dQaGEMBlVTfBoIpRnJ+QEQoCSKW3iRYGen7ZnOV83VH9G30iwOOe8fjXTIYXNcMgCOYlN0c2/gKCU6ovZfNZBNiY+SeYZ1KdeATvHniU5pQouUd0NAUDW0IRaEPcdOBnUh0UGrM0aKdFWDRedlTgJLY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 9 Apr 2025 12:28:06 +0100
Message-ID: <D922MBDY2JJ4.NQXTTKRAMFEU@amd.com>
Subject: Re: [PATCH v3 03/16] x86/boot: add cmdline to struct boot_domain
From: Alejandro Vallejo <agarciav@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-4-agarciav@amd.com>
 <cdf00f8c-2143-48d6-abdc-8f56dafcc84c@suse.com>
 <D9229NGQ6QJ1.18Y8EVWZDY8U6@amd.com>
In-Reply-To: <D9229NGQ6QJ1.18Y8EVWZDY8U6@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|CY8PR12MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: c0387b9b-ccf5-4a86-e52b-08dd77599c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzJmc2lEUWtucGJ2cEMyY2kxaGt2UndTQ3dBOXRuZ3F6KzVGdTFtOTdGbXpD?=
 =?utf-8?B?LzFEUzFqQllrUjNtTmo0ZDIxV0FZUGU1b2Z0U2I3M3Y4ODBSc1ZNTVl3aCtm?=
 =?utf-8?B?MUp1d1NwOVY1WVVzVURjeXgyR3dXVEpUcFB0UFN5Wll2N0NheG85akI1eGNo?=
 =?utf-8?B?b2dnUHVYTmJjRWE5dzN1R055VlRzWUtDRWJ5Y3J1eG95eTJhR2dEZVlmSWx1?=
 =?utf-8?B?ckgxa2M3Ymp4NTdXVkYyZGFVKzJUYzU2TEFaTDJ6Z1pqSmV4WkRkYXE5S1E3?=
 =?utf-8?B?YWJNSjcrQkhjWGpHd3RzM3hSclZTd01WMUZMU2p4eTlicWUxT2NTbjBkc1Zw?=
 =?utf-8?B?ZyttVHJGRjBwM3BtTDdnbU1MdzMwMmovMkZYVVlEbmFYTlhMTkMySWhvSDd6?=
 =?utf-8?B?NktlWHE2akIyb2UxRDRoUEdpYngvZWxvUGduUnVrT2crWGRIeFhNWjdid0tM?=
 =?utf-8?B?VTFVTjJkVEw0VHFtaGxpSkJEOVZ5bW11dW5DY2V6Zy9kKy9mNEZEbE1wZmhw?=
 =?utf-8?B?VHpUaFJtellYR0tnWkx2MzJpMDJaOHJZa04xTmZZTzNqbEM2cWE4czluYWwr?=
 =?utf-8?B?K29lS3F2akRSYVlPZzFZVVFwUUErSThBSWVJYmk2L0kwUHJRR3ZqdWN6RGxi?=
 =?utf-8?B?YVY3VXdEZ2p5REVGTVEybjV0OE5MQ1ZDL1RmNzJtN2lvc0N3ZGlOZUNKOHRF?=
 =?utf-8?B?ek9PWEZyZWJTR3M5TU1wZjhOSHhsYmhoMDc1T04wRlg1MWJHZUx5dmM0S3Jh?=
 =?utf-8?B?VkhRZnNoUzNJNnFubGtXSllNYUNPN3VVMFJGVzBXTFVmQmlVOVJRbXY2TUQ4?=
 =?utf-8?B?dmNwTjFOYXBOUEN6VlRsbmp6b3A0cXIxZWZOcnh5S2tVUGpCSVB4d29NKytW?=
 =?utf-8?B?d1A2MG5IbjQrNWF2YVJtYmNJRHlsMFAzVHV4NTR1RHVjKzhhaEI2K1o2Kyty?=
 =?utf-8?B?czhvRzh2L1c4bFBTN3I5UVdMbUxyT0FDQzhaZmFXSzBTcUtvL3VWRGI5OTVR?=
 =?utf-8?B?SnBDbXFPTEFoWnc5aHI2Y1dUQUhsMm1OOTBXWGlTaTR0d2xucms0Q1pDempP?=
 =?utf-8?B?L2VOdVZWNStYOUx5MXpxMmJ4OXVjSCtDL0JlK1YyQWt0eHNjNVowdGE4bVR3?=
 =?utf-8?B?ekNCeHljTUJrcU8wV0N4VGNtNnNNd3JoYmRqVUFqd2p4K3hoY1pBMWhQY2JO?=
 =?utf-8?B?QTliVnkwMCtFUjNVdEFOKzhCRFVOd2xhS0ZUTkphb1Vsa3VPM2VueUtlYzVj?=
 =?utf-8?B?R1djTXdNdUVJbDNCSVZJMm5EdUZsOU1FWUlVV29MOWQ1czI0T3VUdHNQMy9l?=
 =?utf-8?B?Uy8xbVd0SGNlWGc0MlhZYy8xNzdLUzU1SWxRUmVieCt1NUg0WjlmTmx3UnI2?=
 =?utf-8?B?YU9CYyttKzdVQmlBUFBhcmhYWWhMdnVlczg5c1dJNm5KalovN05la0xnYitX?=
 =?utf-8?B?M215RHZGOVV3WFJpYXVCdXNIL0o1SmNwRERQZExjS2swdDZyUjNRT1pHSys5?=
 =?utf-8?B?UGM1c2NmcnFuZzgrVTlQQkZvaFFjeWdsaW5vWk5jR1dQN3diZ05FcTQwU0Zx?=
 =?utf-8?B?dTIzUmpiRHVEWDc5cWYyaExLaUs2dTBVOFFUaUwweE84enNkN0pQbW1EWXZS?=
 =?utf-8?B?S2w5bjlkTWk5dFhtWjczRThxblI1THBCVFdhTlJxd2JpY2xPRFN4NGdzYmlm?=
 =?utf-8?B?WTIydEtmTmFZZVlOUlluYUJaZW04YUJTWGVQSE1FWmdQWWV3UjR3T1RIODVi?=
 =?utf-8?B?NDd2MnQ3NjMyWWI5YmZzYWlqTlp2UDk0Q24yYlpSR2JlbFl1UGl1UUlMSk9x?=
 =?utf-8?B?MnIrTC9YdVpUS2FXejNjWTNub0tqUGVvbFM0R1k2L2RzQkxHVi8wZlkrbW1E?=
 =?utf-8?B?SG5RREpscm9nUXQxNkVYcVBlYTU2aHYvc2V0WWZ4MUtJWXRlZThXT3dVZzBk?=
 =?utf-8?B?S2FPLzl3UVhONGViWFhsM2U5eGQva3NoZ3RDaXQ0RitnSWtEeWFRUnhPSDdH?=
 =?utf-8?B?U3k5cjVyZUpBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:28:11.1286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0387b9b-ccf5-4a86-e52b-08dd77599c26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7172

On Wed Apr 9, 2025 at 12:11 PM BST, Alejandro Vallejo wrote:
> On Wed Apr 9, 2025 at 7:48 AM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -978,10 +978,30 @@ static unsigned int __init copy_bios_e820(struct =
e820entry *map, unsigned int li
>>>      return n;
>>>  }
>>> =20
>>> -static struct domain *__init create_dom0(struct boot_info *bi)
>>> +static size_t __init domain_cmdline_size(
>>> +    struct boot_info *bi, struct boot_domain *bd)
>>
>> const for both? And perhaps s/domain/dom0/ in the function name?

(missed this one)

Sure to the const pointers. But as the hyperlaunch effort progresses the
point is to turn all this into a more generic domain builders rather
than having dom0-specific stuff. Changing the name like that here to
adjust it in a few patches down the line doesn't seem worth the effort.

>> While this tidies the local variable, what about bd->cmdline? As it stan=
ds this
>> gives the impression that you're freeing a pointer here which may still =
be used
>> through passing bd elsewhere.
>
> That ought to have been bd->cmdline indeed.
>

Actually, it can't be. It's a "const char *", so XFREE() chokes on it.
I'll turn it into

    XFREE(cmdline);
    bd->cmdline =3D NULL;

instead.

Cheers,
Alejandro

