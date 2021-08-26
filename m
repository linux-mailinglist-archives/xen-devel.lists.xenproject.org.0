Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4340C3F8A18
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 16:29:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173120.315858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJGMF-0006xG-L1; Thu, 26 Aug 2021 14:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173120.315858; Thu, 26 Aug 2021 14:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJGMF-0006v6-Hw; Thu, 26 Aug 2021 14:27:55 +0000
Received: by outflank-mailman (input) for mailman id 173120;
 Thu, 26 Aug 2021 14:27:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJGME-0006v0-1y
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 14:27:54 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 874c514e-86a7-49cc-aebd-bde59031906f;
 Thu, 26 Aug 2021 14:27:51 +0000 (UTC)
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
X-Inumbo-ID: 874c514e-86a7-49cc-aebd-bde59031906f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629988071;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3dvps4dIVGfOnBpA8T7ohguNqF8Q6o1s1xoDROZbWJ8=;
  b=Xx/LcdqFtyNakm401lKor6DhjA37COO/nZpsLzxQaDaoLE8yNkEzXLKb
   GjwOfUBodFjLabPz38M7SBrGyWPSuFQAVU7F9Ypz4b95NQFpSAk8DIl1N
   5Hj1rPaVStcynrWO3Uz0qBIflC9QMY4PtLtytDH78KnVLLIu8jggPn5Nn
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tYxvixytcE8qAnWZa413qV56ZyXhE64Uh9YRxiTnZbWSNqKH2HaaYflU7wu/2/M51gkXFkU53G
 PPrLdvGNvMYUKcNTaAmqTQTuNhVXApQtl7Tve+si4bRxF15RXy1HCzfu09klKxIpCEU/PJjZTw
 yGzN0GWP6jm+HV0MgABj4vA5F4xGnAx3N//8dQpDhJc1nKlNRhHSr+VpynaJeOhxNlRpowPo7J
 ag6seLwpEYzPQtQlWjpS7r8WYNG0cNKGoOSqgJRp66MD0ZNOBilMIVslNdWFvK/LoQpdb8QKPZ
 qkS0tELeLQI0e36iFBhGTGhx
X-SBRS: 5.1
X-MesageID: 51764416
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xuW/Q6A3RZrLPWDlHeg7sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LW90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkdK1kJ
 0QCZSWa+eAfWSS7/yKmTVQeuxIqLLskNHK9JXjJjVWPGVXgslbnnZE422gYytLrWd9dPgE/d
 anl7F6T23KQwVoUi33PAhIY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX222oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iCnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAoqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocXTbqjVQGdgoBT+q3pYpxqdS32BXTq+/blkgS+pUoJjXfxn6ck7zE9HPtXceg22w
 zGWp4Y3I2mAPVmNJ6VP91xNfdfPFa9CC4kAFjiVGgPK5t3TE4li6SHqondt9vaNaDh8vMJ6e
 L8uRVjxDYPR34=
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="51764416"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvCv9/d2mGBg/9rWtUKcvIjQJzTtQFp1wlB6u0mkFAoN33I9OtALlLCAYXRMXcUwp5XsiyjTujKTQsYOpwHiLPQCVfCNBFWD/MI2ItXbnuYlUEoElnRkJVfvqTBCJYRLLZhCRbkpnctm1edbV55IJtsNZOvNUTuuFguV1U8KwZB59PVqYivuLCYAK2D+So5WacT6OY/D8vXNo+EZa8qt+YXtF7jUVZW6TtNwyNM8Av5bYXdBiDPd2Re2/9MBewBm+TbbKMMFLwoh9xNKnGGo8yi9gQT3oT8TecZm3DPKz83n8llhLy7OZop7ferD1UlLLhp30s/zq4fcebgvk2rOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCvo9tp6pPpG7PWOudbDEPx2JfF8W3LrD2EtNHQFKyk=;
 b=OxsOQ7j72O7tu4TUc1QcxjVTGbtNpK9QaKJ2eYYDkPcX/Ix3g3rmCIhQjz+EHOM1e351vqbSuNXlbAp4uyBp+RYjcTmh2CUmbLPy5sGYTQWMGm3lsJRLY2w5y6aMYU9pUHB1H69eFnZQ4XGnIPNpzMtTG75ZWSoN8FDoAnRdLKRNFz+byFZY0t+6sXWmgbU+B9wD2aNSSYjqyfdVLEmyunrS+HMyTm0JmWXvj72IxpA5Qma7e6TSgjUiMyviXUnwQhDfMgkvxOHPCb48Kp0NB360KVGwKN5M1UmIDoNAnMm0xaLFQd39/3peJucsxc0ifOlq6m1v1XbSCG2CyktZ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCvo9tp6pPpG7PWOudbDEPx2JfF8W3LrD2EtNHQFKyk=;
 b=NxGLudAX4Gb4xMoa7lrkjATK0uJXetf/0r0xDZTBjMu8MMb9P3P35OWN6Py9EE915ccuopls+0W16OB2UQVACkNpsEXTBRbjgnUanjqsx5b+z1Sj+jAemifn7KVtzzrDI1FLz/HSC0JPq1QP09Ve+sOZBIji5xvLFQkc+l7MlME=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <6807e3ab-375c-884c-db01-0c25f76b8f02@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 8/8] AMD/IOMMU: respect AtsDisabled device flag
Message-ID: <ef28ee1d-2d29-2e05-634e-89e882426661@citrix.com>
Date: Thu, 26 Aug 2021 15:27:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <6807e3ab-375c-884c-db01-0c25f76b8f02@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0087.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 037df359-e2c8-498d-0c22-08d9689dad4f
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5870:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5870C4AAD9E94F7FC39AD2E9BAC79@SJ0PR03MB5870.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d/8Nc4UoFZdfrIE3665QmJWxZqquHnTWw0MsBDKbYip/ndKOwUeTw+q1H9DCEk17JIcrm8GQx7RG2PKyYNttKrVkk/DpSGQh5NWup5wmS3MS5LxEbWIYxBijpieUVh7jFISrcfDCGq9U6WoJd53AFOEIp7r52v71z8MI7/6n0J0+qEGwtAIOWNgY3z41no+1X79zCkNAVGh/z8QfIvkVwCjrVYWxpOUbCjso532gMbPWW3p93MTowyydLcjFP/gvV4AlGP9bKWbojQf28OngfvTSWe4A2schGERvQjgFySKbYXYozPTPjxt1P+Hz5kjy+PkkCt0Ake6kAX+EUsQnnQ8+CKm7IJB0mLp1CA2EnhaA7Pzs+H7tKMH4W6+kSDrNqqSC4xRUw0/JrRq7joR5byf1tfne0rsQ0ejFvxiGQFaH987ZZIf8B3rGBrLWN55P2uubrsSHto6u6eK+TldGmrqRVvB9PR1yLjjM2I2DUa/p8w7MjFIlCPW6TOPHoahABWffNDQNA+FqqyolJZYCYFY8yBuvgxa0uZOPBSh9eB7lpe7HHU+7BfsqYKqSS9vdSAWFP1RVvquMfC9zDqIxHDJSnNvTUP6RuVcScOLSolh+5VAzekJRjASGazpJtuDFoWe6jJh2V9eRK93nTsRecuXQSyPKSQLu6s+zwOc1XhYxMaygGjOGoXa0jaBVIRr+NfjfCst8OWB6yXtTAQr3N5EVEkDfvGr/ob1W2MWuNqI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(83380400001)(31686004)(36756003)(2906002)(956004)(38100700002)(53546011)(2616005)(5660300002)(16576012)(8676002)(66556008)(478600001)(6486002)(66476007)(186003)(66946007)(6666004)(86362001)(31696002)(110136005)(4326008)(8936002)(316002)(55236004)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWJ5YU1BdWtNUkNlRXJ6TFlPUGpFNUsraUxWQ253MHNyWGIxZ2pNaGRKdDBk?=
 =?utf-8?B?c1VYWWRzdXlIbFlNZzJZdllTOHp4dUxtU1JQS2FZeEFoVitPT1pDR244QlVk?=
 =?utf-8?B?V0pSdU9Rak43RWltTzdKSGRaVzA4RWhROEdTMHVCODlRakZqMnJCVmxrbjB2?=
 =?utf-8?B?NGpLeW8zUEhPQ1FPbllLUUVpZlliUkZhSWZBTEZLVVZHdWFxKy9rUHhyVktX?=
 =?utf-8?B?Y2Y5cDV3blNPaytQM0p5cktUOTFQeG5hL1padkFFTGF6ZnRZQU1Td01NNjFF?=
 =?utf-8?B?b2NwdXRaK09iWkx5R28ySlQxVmw5SlNrVHpDTThwdm9iMWFPZVBPUnorNkl6?=
 =?utf-8?B?L3ZVdUZkWDBpaHZXejloek02dml3RnBOQlRBN3Vodk1BNTd1ME5KckxSeW45?=
 =?utf-8?B?TEdmeGN5cG9oa1ZwanR1Z1ZqL0VZbzViMHFqS3JwQ1lGcEJlcDRYRXFuY0lZ?=
 =?utf-8?B?Y0E2T2FVUWxWWUNwTlpHZXI4STd4K3RrTU03QzBuK08zeElBZGJ6V2pTNXU5?=
 =?utf-8?B?MzhoTHdMUEkzYkRHYkd0VWFpMkw4YVp6M0FtZ2lIQUpaYXVZajRENE9OTkJS?=
 =?utf-8?B?Z05OektiRWxKT1FML2QvOHJWQmFubDIrV2RIL2sxb25JNjZQd1lRNWtnL05q?=
 =?utf-8?B?NkRJYjc1YTQ3VXAvcTRjY1hnVW1SdWJTbTFHbElSVUg5Z2Y2ckNmeTkyZGxx?=
 =?utf-8?B?RmtRZXptWjN5ZkYxTDJJVDJTSUxHMk9qdzg1V0thSTRrbEtGRnZmUVJpODJE?=
 =?utf-8?B?MkNBdkp2dWI4K2lIeGpiYWp3a3JVSFROVnZNL2dOakxxZVozZkhNS1NrSm1Y?=
 =?utf-8?B?NUlxenZEdlFpNG40QjY5TjhseUEyeFRDaFJ4NVBpTHNwVmpZSERzSGJJcmFC?=
 =?utf-8?B?SE80OVNzRWhSa1B0UU9nenNCekVsM0VWS0hROE9YSDJ2ak0vMmxoWUFVdGQw?=
 =?utf-8?B?Mml2UGJ2ZEw0dk1sWURiZHFZRm1ORWlwTHRJdmU1amZXWHFnUDZOamdTWXA1?=
 =?utf-8?B?SllPTGEyVVF4bG5CRnlMTHZJemhSZ00rUmVxZGQvd2hJTmVsV0FUQTM2YURo?=
 =?utf-8?B?NFoxcGRqY0ltYnN1dlVaQy9LeTlFaUVlcHlLYlplNFc3UWxxN0lmQ3cxN1kw?=
 =?utf-8?B?bXpwdUFabllhZXR6aWJ5cE1uNE1hUkc1dFE1clA5UTBTcVdzOFdiUDJpcHgw?=
 =?utf-8?B?WFAwUGxXRHR6T25kVkVJU2NXSDBmS2pDVENYempsYlMzOTZpeWtHTnpZSTBu?=
 =?utf-8?B?MkFOMDhlWCtqc284MjV0T3crWEs4Kyt2bHFRSW92M3ZPWGZoelpaRzloaTBY?=
 =?utf-8?B?bnZra2hESENqck1rM0taeGxoUXBJSk4yeWxuelR1L2Nub1UyRC8vSGpPakZ2?=
 =?utf-8?B?QWJUZ042R21sQVp6bitNbkt2TWZVVzlmMERTZFM1WWtZdU5yR25CZ1FWTXI2?=
 =?utf-8?B?QzlNeElQN0tqUW82UURBdUFJQ0JrRDVHYVJ0aGtSNG9wYXF0OGZCbE5QaS9M?=
 =?utf-8?B?d2d6MG1SUk9GZTh4a2NCQUxYWjlScDl1RVZYQU41MXBXRmt2OGt2U2tHN0U1?=
 =?utf-8?B?dExEbDlpNHRGTjN5bk9uaGVSZGdJb29lVDRBTmlaUFZGcTJNVWNvaU1Sbkti?=
 =?utf-8?B?SkFZUWNWaWs3b1p0Umg2WW1ZekF5QVNweDgyRmIrL0g4eHNlcVRUWlpYdHo5?=
 =?utf-8?B?S0o3aXI4TG80RGNFc0tKWG9RckZYNW40M0QycUliall5MWRLMWloVE5ONDZE?=
 =?utf-8?Q?zd5Yiuds9HhV8NXoiraIIEJBhfVeAJcWQdMYldb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 037df359-e2c8-498d-0c22-08d9689dad4f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 14:27:47.8847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnDIpVClwccloKQxafRQz9jcNu01vdhjLcuDRT30A/7LfDFj9VdOdUkpF2vB/R1x5SgjK7UU/31DyvJbk0G6GpQ1lElYlK2Bh85c9CbAUUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5870
X-OriginatorOrg: citrix.com

On 26/08/2021 08:26, Jan Beulich wrote:
> IVHD entries may specify that ATS is to be blocked for a device or range
> of devices. Honor firmware telling us so.

It would be helpful if there was any explanation as to the purpose of
this bit.

It is presumably to do with SecureATS, but that works by accepting the
ATS translation and doing the pagewalk anyway.

>
> While adding respective checks I noticed that the 2nd conditional in
> amd_iommu_setup_domain_device() failed to check the IOMMU's capability.
> Add the missing part of the condition there, as no good can come from
> enabling ATS on a device when the IOMMU is not capable of dealing with
> ATS requests.
>
> For actually using ACPI_IVHD_ATS_DISABLED, make its expansion no longer
> exhibit UB.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: I find the ordering in amd_iommu_disable_domain_device()
>      suspicious: amd_iommu_enable_domain_device() sets up the DTE first
>      and then enables ATS on the device. It would seem to me that
>      disabling would better be done the other way around (disable ATS on
>      device, then adjust DTE).

I'd hope that the worst which goes wrong, given the problematic order,
is a master abort.

But yes - ATS wants disabling on the device first, before the DTE is
updated.

~Andrew


