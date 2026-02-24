Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNU1LqxxnWmAQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:38:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0860A184C01
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:38:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239649.1541047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuosM-00045x-Ki; Tue, 24 Feb 2026 09:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239649.1541047; Tue, 24 Feb 2026 09:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuosM-000448-HZ; Tue, 24 Feb 2026 09:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1239649;
 Tue, 24 Feb 2026 09:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lmg=A4=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuosL-000440-0H
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:38:41 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96754aba-1164-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 10:38:35 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by MW4PR03MB6586.namprd03.prod.outlook.com (2603:10b6:303:129::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:38:31 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:38:31 +0000
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
X-Inumbo-ID: 96754aba-1164-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jetU5IdlywYO3wo1ABbOwxGpcS8DEJs5t/lKnWYJA7EAOIlY6q9fzH5XhaROFcq5FP/LtaV04p9RYx1+2qodGaAjvIHe55s0inFHudQ2d32eNC5qP1CTYpPP6NAD3Eu5pbJnAhvuKk9B34NfORfZ3Aes9gPlHiDNVifTYPlXDtP45mNdvTNJwgZ5l1Ba6h11OBPyUBJiXhUCpK1U+2Nsoru4sKpNjtpHixy9a8O+yssU+Pcy+OesHJ0X+Zna6CFEU6Eo1mNlcB9Tt2vuDGLm46HTBWcW/5VLJJcRRBP8hbAWuaossUjaLI//yKo4mV7y3swaQqryqaKtPc5JgOCxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOZubTdsiOzrnf4BstJ6DozdEDs++6HU0dKHiLxr+WA=;
 b=JQCy/5fXBK1vDD8mbdEBcAUtbPMOPxhMFK32ZC8dhvLc+LxCJsEzvpcofNFB3sNWGyYzO1gh1HCLo9Cbh42/la9HOpuYEOR1MY6IJzr3yKZnOiYa0ux3DF8C+Z/JghWG28B6nZaIHsD/7Y+xT689fdqDgD3ZPJdd3bUtb/hFdARTn39vyBtBPvT/iGi9rUyAq4RkSPxFUdPtwKr9WY8wDYmF8XTpFBjzChkwFB4NVnwtf9CHSGTpRhcRQNk3Z9VIL6gg1DKT5vlc2ugBpa1D3a4VTKQlJjgh5CcqA+ineeklZ3uVB5+0V2RHD2LEkQQdqWlvc5vUotuJHYFPFfBa3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOZubTdsiOzrnf4BstJ6DozdEDs++6HU0dKHiLxr+WA=;
 b=hPqXtb1lYwZm9Rhde+iCVTcFJaoqoGPoDnyAhFHEyosLgxGWV0wbAmiCz/rO/intkLVUEaCDQ8SMH4CVKt4fNu6qsz/bQSzwYLqJ3JbkmsaJD8Hr0sqN5RxPjcssqWn3tBZVcjMCoJyh5Pa5yS8BY/+jWDynOhhYRp2/BdWF0ow=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/7] tools/tests/*/Makefile: factor out common PHONY rules
 into Rules.mk
Thread-Topic: [PATCH 1/7] tools/tests/*/Makefile: factor out common PHONY
 rules into Rules.mk
Thread-Index: AQHcpK0tQx2+yGxKK0yu3GIXOaCAi7WQe++AgAEdWAA=
Date: Tue, 24 Feb 2026 09:38:31 +0000
Message-ID: <6616BFC6-2ABC-4DEF-A799-BC660BBE31BC@citrix.com>
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <6fa0d95dad3d223cf8aaa923ae59fd0b3a97d4a0.1771840831.git.edwin.torok@citrix.com>
 <20e3edf8-9aba-40e9-af57-e5eddf001a7b@suse.com>
In-Reply-To: <20e3edf8-9aba-40e9-af57-e5eddf001a7b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|MW4PR03MB6586:EE_
x-ms-office365-filtering-correlation-id: 1e5e4bdc-f206-4a68-71c8-08de73887919
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|7053199007|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?utf-8?B?bU8zeUhQc0NMcnM4NHlNTGhCU1haR2hZNi92VjVPeG93Y1hHZnB5ZWd6WTdZ?=
 =?utf-8?B?aTBQalNUTkZoYzVnYzlzMkNwN3VuYW4zR0wrSVBsUTBmZGhkUnl3b2FmelJj?=
 =?utf-8?B?bUNMblBIM2pNTmM2dEdyaEVpa24wQ1lHaGZmaSt0TVIzVElPNkM1OHhJN0Jo?=
 =?utf-8?B?NTYrRnZyRGpaOVlJMGNkRXdYWFo1M2t1eXQwV1J3cUp5QmRaRnJOOHU2ZHhk?=
 =?utf-8?B?K1BKMlI5alp2RkV3QjhpM3BmTVN0bVk3UU5EalJXRmRjVG5JZ3JkcjZPT3By?=
 =?utf-8?B?VXgrYVFUT1d4aU52WlU0UWpRdkVYcTg3Q2FleUZNNWZ2UE5CVUhCVTlhaDg0?=
 =?utf-8?B?eC93L2I2VDJVL0p2WlFJMFVzYlJmRkF2azVRKzlHNzIrQ1RZazlvQjNlSFhq?=
 =?utf-8?B?S2t4bnFHTk9oZjFWYmVkSzRVbEg4RTVveGdtV0tadC9tV1E2ODFuQmZLRkhD?=
 =?utf-8?B?NHZrMHNWbHRDamtQRmczWWFDSWszb3czeC81S0ZYTFQ3aGQ3cUNGUnhWU2Nl?=
 =?utf-8?B?UzVlNlJ0c3BmT2QzMmJ6Zzc5akZ1a0RxWS9pN21lODhWQU5lODQ1bkMxamkv?=
 =?utf-8?B?QWRxYzVuWUx0V2NzSkJTbklyNEJ5SW91RnRObVhqVVQ4LzRqNXNic0RVcEpl?=
 =?utf-8?B?aEtWdnlxNGtKdU10M0tlM3JwemExVWxKNU42aTdheE5rTzlsNzJPZDlZRnpl?=
 =?utf-8?B?VnVEbnBiOWhRWWIwUnFnWWNEZVp4MkdmSlV0WkovdUhKMmVaZ2w2UEsrQ2Zq?=
 =?utf-8?B?RllNWGxQMG1mRHJ4VVhiUUdwdTltQ1d2OVlNNlZjYythUDgyekk3SUpENUpj?=
 =?utf-8?B?bm9CeFB5TkpVS0J1dnc5SzhPYjlGVm9LR0tnZkJmdzJaL3BHdENLeFFNbVZK?=
 =?utf-8?B?bUdiL0EraUVaeEd5Tk1KYUdiUHJ4eDRMUnJzQnh0RXl5SGk3RDZ0a09OSW1i?=
 =?utf-8?B?bU1YVXZ4dTdHZU04RlA2bS9zQ0VkTDdnRXJRSS9HRnlReDkyeXRhNndyN2J0?=
 =?utf-8?B?czVWSDhRM29udis5N21uNmJqZUhoYWlJbjc1SzJqUEROYXFpWSt1RmVMSmFP?=
 =?utf-8?B?b054SGQ4UHFQS3NmWllBVG9qSUkwa0pPMUpyNCtQNHNReGMzSlV6S0F6RFU2?=
 =?utf-8?B?TWxWNmpBRWsyS1dSQUh5WkdONGtIbnpZTUNMbWJSVFhEOTV4S3ljRS9LYi8z?=
 =?utf-8?B?YmxTSmVwREZUNTFvTHRsaFNoUENGcTFSWmVOOVh2enV1MEhuNlM3UHdWVWR4?=
 =?utf-8?B?aldnWXZ1NmdsakVWeTNZU0hLWTRPYnB4RnVESGlDbllDVTU3NXJtdE9IdDdl?=
 =?utf-8?B?cHVnd0lhQnYvOEsyQk44ZTJoQ2dDTnNjeFU0NDVLeWVsaktuTU1PaUJ4QnRP?=
 =?utf-8?B?TStIV0t4TFVBQndsdGlBeHlRdElKQnVJMFlNeUpEOW1jTFUrcERZYXg5Uzdv?=
 =?utf-8?B?MEFkNENURFFPT0tkd04zSjhuNWdtejZ5bS9FTmJXMTlueStEenJmaGdHeHhJ?=
 =?utf-8?B?QUpGZGlrS3JtNkpmd21iV3BKTWU1TEZRSXd0OUFYTnJtS0JFK0xXNkViTy81?=
 =?utf-8?B?Z0Z0Uy8wZHFlSHU4aG16SVovUVpDZ3pDem0rSEs1THRhdDE2L0tlcmtKZGdS?=
 =?utf-8?B?aHh2NUEyd2g3cmtTd01WVlppd1FWUUVrZWdzWFg2ZlhhRmNDbGk3bWdpQjQr?=
 =?utf-8?B?MUNkcWtrdzlWVXdtRjhydWdUT0xDYldhdDNzL1VGMk80N0xOUEdtbHU5Y2JX?=
 =?utf-8?B?cXhObEljK1hLUlRyY1J6L3hlQ0NiYlVNVlkxY1hoNUttZnpJMU5FNXBvdFYr?=
 =?utf-8?B?cGx2RllTOU1vZ01LMC9lMVhuU01rZXBKSjVEWVFYdmVoc3c4SGhsRjh6L0Y2?=
 =?utf-8?B?TmwxdXEwU0JXUk1OYk5LMXl0NVFmTDMrMWlFQXlyVTZmczdFek8xOTZYemc4?=
 =?utf-8?B?eXhiMWg5UFQ5ZGcvRWE1emxmYUVVOHczYW01VWE4RlJ5d2g3N2RYNU9qb2Yz?=
 =?utf-8?B?M3BEa3Ftb3EyMldCRzJEcE9EQXIxVVAwMGlKNEJvL1FGRlNBcGlVcWdKUE1n?=
 =?utf-8?B?T3g4aFhGdENxVzdhQWlWdWtHaGFiOXdVajFHeGRRaEtkRzZPME52czdnMURn?=
 =?utf-8?Q?CG0s3LDGgmQ6s08m+DtetB+oU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(7053199007)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1g2TjNOSk1PSklCTDBPcmJ5SVZyd0loNU5Yekh3dmdnbnV5UEk5ZDlMMGI4?=
 =?utf-8?B?UStNMUh3eGFZdnRjNEpSdUlOWks1Zlcyb2t5eU1oTVUyVkFPaStxdVRreVFo?=
 =?utf-8?B?QlRLMmU4dmJsemJ1VlowWEdzQktwRE02T0M2VkdJSFY2S3E3aHFGMENuWTM3?=
 =?utf-8?B?ZitUTmRsbkoyZGFUQ2pYQlNiZEgxa1F6bTZGRmtveFFac0lpaGp3U2VXVFQ5?=
 =?utf-8?B?VzBOZXk5dS9YM2phMFFiRWRZNDYyaXpHMnE2bEl3MVcvYnd5MGpFYitHVzdH?=
 =?utf-8?B?cUpkR0ludE81MmRlRjFrTWV6djRLaWJjUjJLZkJPNTZMSEo2YlpoUUhGR1JK?=
 =?utf-8?B?a1pBMlVKUWtUYUhzeVVsN1lMWkd0eTdLNWFOekdmV0hiMDBHbWswNWZsTytN?=
 =?utf-8?B?VlNRUXlvNE5XcFZ1bWpDRHkrM1VCM1hhajZHMWdhdklOclhWTFBSVXZFa3dz?=
 =?utf-8?B?NzhGS0ZCUDNRSENBSlBQNnE1bWpCNUd1alZJajQ1Qm8xd3IvWVNxanhvelo4?=
 =?utf-8?B?NE44S3dFS3A1UGJxNDEvUi9NRWlHcGloU3lIZHFISTFsbW9aT1pFb1h5SUg1?=
 =?utf-8?B?ZmhBTEpXK0EwMmw4eDRKWWQvbGxLVk81UXczTFhlblo2U2Y1R2Y5dTdsNzFq?=
 =?utf-8?B?VnlsWHBZS29hYkhZZmc2ZlEwYW81ZFZVU25ZKzZMQkpLVXBRL0pEWjVCcFJj?=
 =?utf-8?B?S3Q2UHprcmdBMXZFNTd0dW9oK0QraVJDWmU1Yk5wTEtMNjRmQVhwS3BPb09I?=
 =?utf-8?B?NEZzbEthampxMDFkY1cweWh0TkJXSitqK0NRNlVMcFIrRm41VElXd1VEU3Fj?=
 =?utf-8?B?ak1iYTJtTDRiMnovdktpeElnQ0RJWUkwVmpWYTJFTk01NDFvN1FCZmVoVFM2?=
 =?utf-8?B?bDQ2SHoramljL2s4REYxSnpoQXk4L0tTbVoxenpjL2JrbVRrZXRkQUpndXdZ?=
 =?utf-8?B?QXp3ZHI3WHBISWxiR1d3Qnd2b1dtcnFuWVZvM1lIN3AwR0ZVMjFXQWZDLzZu?=
 =?utf-8?B?TGsrYmpWQ1ZUMFBvMStEL3k2eVNWekVpM2loZUt5WldQTVB3UThYbytLelE1?=
 =?utf-8?B?Q2YyS0RCWXYvMUlyYjZKd2oySnhUcUhYQ0VEeXZHVE5IMEpkV01Qa2NaWitH?=
 =?utf-8?B?Tm8vUGViUmtmbXc0eTVJMTB2Y0lRUUZHQnJhUjhLK1VHcXlLcEI4YWUweUtL?=
 =?utf-8?B?cHhvYlJwT0Z1SU9rMm9LcUc3Mm9kQVVYdmRwSU1qNGRyVVJWbE9nYzFBY2I3?=
 =?utf-8?B?dy9BTlhkcnk0TUVXNEhJcHJoaTB2dStoSVk2azhQZkFvMURjYjRqY3ZEMStS?=
 =?utf-8?B?eXdSejFrU2ZDd3ltWjByTHJjQVF0UE5mTmdQMDFLbGRLSWtwRnFBSnFRMTUx?=
 =?utf-8?B?U0tEMDRBRW8wVmRHbDR6YzFHZmMyS25lMy9QWnI1ZnhCWURFSFFsUHQweGl3?=
 =?utf-8?B?Q2g1cUlvdEdCL1FzVVBuV1ZLdmJPVmNjZmZyNlRTeWs2NC9Pd3BsWGk2QWk1?=
 =?utf-8?B?SlVvdXdtdXl4bVdKWkhKM1RYOVhFYmE0OVVlbFJoaE80MFdTY005OEFxT0pN?=
 =?utf-8?B?bU5sbkY4WmM0YU4xTFNwY1FvaVFxVHg2NWZjeTlEaVJRUU5UNVJwU3NVVmlz?=
 =?utf-8?B?MFJUQ1VNd1NOQ0ZITm9RNGpscGZsRjAzOUFSTk5JNDNnVWN1bXhrb3NOS2po?=
 =?utf-8?B?VUlxTXA5Z2piRVdvMjkyMkdOeVFid0xPWE43aFR1aTF1d3RSdzFpQXFBaG9k?=
 =?utf-8?B?RGkveTlVZGYwNXNiandEMEhTU1g3MytNZ3Uwa21iWElVcFROTVYvdXkxejRv?=
 =?utf-8?B?dTMrdE4rK3E1b2dFdDMxaUFkaUJKZ044b1pnOFZUeDJWeWdmTFB2Q3JmZVhw?=
 =?utf-8?B?TjhmeENJQjh3Zm1sbWorN0k5ajNuU09vZ1QyWGpVWFRBU1hFZFZSRzJ5cE1I?=
 =?utf-8?B?c1lYUGtjMlFIbWlqczBGQkZKMUlpendKUmcvbVh3T0dUZ3RxR0RuVWtLQnIv?=
 =?utf-8?B?dmRTOGtXcWkvcW00VCs1RDdxS2lRNHcxdWYvamVQMXkyeUg0MEJCaTRGN1c3?=
 =?utf-8?B?OFF4RXgrbzMxdTNrYTFTdmk0UkJVNFAwWGErU0Q1cW85YmgzSnFQMlRHc1h3?=
 =?utf-8?B?RTNLbVJsaWdpRDF5MVpQWlJGRnRSNlpDTTUycDFYdFc1ejhvT2hqVE52cHhi?=
 =?utf-8?B?U2Nta2VYMkcwS242T3lxNWxWRDZZZWVlQmt0Tkh2UVFDMHFTdFlxdWZJOG9U?=
 =?utf-8?B?Z1g2c21OMXJiRTFJSzJrcGlleVJjeUE5bXJuaDhvenNQeU14NjFldnkrQk8v?=
 =?utf-8?B?anliSVdZV1dEeStERWdUNFUwaG5CdGRDVGR6clpKNVZFWW9oaXVtTVp2elRq?=
 =?utf-8?Q?kUtFvorvgmpqjZxo=3D?=
Content-Type: multipart/alternative;
	boundary="_000_6616BFC62ABC4DEFA799BC660BBE31BCcitrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5e4bdc-f206-4a68-71c8-08de73887919
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 09:38:31.7334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2RROuKdbJCxzfHVI43BD9+qYaBBSGThXccT6Puyuq215691BtmeVd3VIKNltBRfpqpKjW7jxCKf/Uxi4nLo/SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6586
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,repology.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.980];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0860A184C01
X-Rspamd-Action: no action

--_000_6616BFC62ABC4DEFA799BC660BBE31BCcitrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDIzIEZlYiAyMDI2LCBhdCAxNjozNywgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToNCg0KT24gMjMuMDIuMjAyNiAxMToxNCwgRWR3aW4gVMO2csO2ayB3cm90ZToN
CkludHJvZHVjZSBhIG5ldyB0b29scy90ZXN0cy9SdWxlcy5tayB0aGF0IG11c3QgYmUgaW5jbHVk
ZWQgKmxhc3QqIGluIGENCk1ha2VmaWxlLCBhZnRlciBUQVJHRVRTIGlzIGRlZmluZWQuDQoNClJl
cXVpcmluZyBpbmNsdXNpb24gYWZ0ZXIgVEFSR0VUUyBpcyBkZWZpbmVkIGlzIGNlcnRhaW5seSBv
a2F5LiBSZXF1aXJpbmcgaXQgdG8NCmJlIGluY2x1ZGVkIGFic29sdXRlbHkgbGFzdCBpcyBpbW8g
Z29pbmcgdG9vIGZhci4gVGhlcmUgc3VyZWx5IGFyZSBnb2luZyB0byBiZQ0KY2FzZXMgd2hlcmUg
c29tZXRoaW5nIHdhbnRzIG92ZXJyaWRpbmcgb3IgYWRkaW5nIHRvLg0KDQoNCknigJlsbCBjaGFu
Z2UgdGhpcyBzbyB0aGF0IHRoZSBNYWtlZmlsZSBkZWZpbmVzIFhFTl9ST09ULCBDRkxBR1MsIExE
RkxBR1MsIFRBUkdFVFMsIGFuZCB0aGVuIGluY2x1ZGVzIHRoZSBmaWxlLg0KDQoNCi0tLSAvZGV2
L251bGwNCisrKyBiL3Rvb2xzL3Rlc3RzL1J1bGVzLm1rDQpAQCAtMCwwICsxLDQ4IEBADQorIyBV
c2FnZTogaW5jbHVkZSB0aGlzIGxhc3QgaW4geW91ciBNYWtlZmlsZS4NCisjDQorIyBGb3IgZXhh
bXBsZToNCisjDQorIyBYRU5fUk9PVCA9ICQoQ1VSRElSKS8uLi8uLi8uLg0KKyMgaW5jbHVkZSAk
KFhFTl9ST09UKS90b29scy9SdWxlcy5taw0KKyMNCisjIFRBUkdFVFMgOj0gLi4uDQorIyAuLi4N
CisjIGluY2x1ZGUgJChYRU5fUk9PVCkvdG9vbHMvdGVzdHMvUnVsZXMubWsNCisNCitpZm5kZWYg
WEVOX1JPT1QNCiskKGVycm9yIFhFTl9ST09UIGlzIG5vdCBkZWZpbmVkKQ0KK2VuZGlmDQorDQor
LlBIT05ZOiBhbGwNCithbGw6ICQoVEFSR0VUUykNCisuREVGQVVMVF9HT0FMOiBhbGwNCg0KTWFr
ZSAzLjgwLCB3aGljaCAuL1JFQURNRSBzdGlsbCBzYXlzIHdlIHN1cHBvcnQsIGRvZXNuJ3QgbG9v
ayB0byBrbm93IHRoaXMuDQoNCkRvIHlvdSBrbm93IHdoaWNoIChMaW51eCkgZGlzdHJpYnV0aW9u
IGFuZCB2ZXJzaW9uIHdvdWxkIGhhdmUgTWFrZSAzLjgwIHNvIEkgY2FuIHRlc3QgbXkgY2hhbmdl
cyB0aGVyZT8NCkkgdHJpZWQgbG9va2luZyBhdCBodHRwczovL3JlcG9sb2d5Lm9yZy9wcm9qZWN0
L21ha2UvdmVyc2lvbnMsIGJ1dCB0aGUgb25seSBPUyB0aGF0IGhhcyBtYWtlIDMuODAgaXMgQUlY
LCBhbmQgSSBkb27igJl0IGhhdmUgYWNjZXNzIHRvIHRoYXQuDQoNClRoYW5rcywNCuKAlEVkd2lu
DQo=

--_000_6616BFC62ABC4DEFA799BC660BBE31BCcitrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <FEF1C496AC699E4CBFFD87F7601F9864@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgYXJpYS1sYWJlbD0ibWVzc2FnZSBib2R5Ij4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPC9o
ZWFkPg0KPGJvZHkgc3R5bGU9Im92ZXJmbG93LXdyYXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJz
cC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0ZXItd2hpdGUtc3BhY2U7Ij4NCjxiciBpZD0i
bGluZUJyZWFrQXRCZWdpbm5pbmdPZk1lc3NhZ2UiPg0KPGRpdj48YnI+DQo8YmxvY2txdW90ZSB0
eXBlPSJjaXRlIj4NCjxkaXY+T24gMjMgRmViIDIwMjYsIGF0IDE2OjM3LCBKYW4gQmV1bGljaCAm
bHQ7amJldWxpY2hAc3VzZS5jb20mZ3Q7IHdyb3RlOjwvZGl2Pg0KPGJyIGNsYXNzPSJBcHBsZS1p
bnRlcmNoYW5nZS1uZXdsaW5lIj4NCjxkaXY+DQo8ZGl2Pk9uIDIzLjAyLjIwMjYgMTE6MTQsIEVk
d2luIFTDtnLDtmsgd3JvdGU6PGJyPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+SW50cm9kdWNl
IGEgbmV3IHRvb2xzL3Rlc3RzL1J1bGVzLm1rIHRoYXQgbXVzdCBiZSBpbmNsdWRlZCAqbGFzdCog
aW4gYTxicj4NCk1ha2VmaWxlLCBhZnRlciBUQVJHRVRTIGlzIGRlZmluZWQuPGJyPg0KPC9ibG9j
a3F1b3RlPg0KPGJyPg0KUmVxdWlyaW5nIGluY2x1c2lvbiBhZnRlciBUQVJHRVRTIGlzIGRlZmlu
ZWQgaXMgY2VydGFpbmx5IG9rYXkuIFJlcXVpcmluZyBpdCB0bzxicj4NCmJlIGluY2x1ZGVkIGFi
c29sdXRlbHkgbGFzdCBpcyBpbW8gZ29pbmcgdG9vIGZhci4gVGhlcmUgc3VyZWx5IGFyZSBnb2lu
ZyB0byBiZTxicj4NCmNhc2VzIHdoZXJlIHNvbWV0aGluZyB3YW50cyBvdmVycmlkaW5nIG9yIGFk
ZGluZyB0by48YnI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8
L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PknigJlsbCBjaGFuZ2UgdGhpcyBzbyB0aGF0
IHRoZSBNYWtlZmlsZSBkZWZpbmVzIFhFTl9ST09ULCBDRkxBR1MsIExERkxBR1MsIFRBUkdFVFMs
IGFuZCB0aGVuIGluY2x1ZGVzIHRoZSBmaWxlLjwvZGl2Pg0KPGJyPg0KPGJsb2NrcXVvdGUgdHlw
ZT0iY2l0ZSI+DQo8ZGl2Pg0KPGRpdj48YnI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4tLS0g
L2Rldi9udWxsPGJyPg0KKysrIGIvdG9vbHMvdGVzdHMvUnVsZXMubWs8YnI+DQpAQCAtMCwwICsx
LDQ4IEBAPGJyPg0KKyMgVXNhZ2U6IGluY2x1ZGUgdGhpcyBsYXN0IGluIHlvdXIgTWFrZWZpbGUu
PGJyPg0KKyM8YnI+DQorIyBGb3IgZXhhbXBsZTo8YnI+DQorIzxicj4NCisjIFhFTl9ST09UID0g
JChDVVJESVIpLy4uLy4uLy4uPGJyPg0KKyMgaW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9SdWxl
cy5tazxicj4NCisjPGJyPg0KKyMgVEFSR0VUUyA6PSAuLi48YnI+DQorIyAuLi48YnI+DQorIyBp
bmNsdWRlICQoWEVOX1JPT1QpL3Rvb2xzL3Rlc3RzL1J1bGVzLm1rPGJyPg0KKzxicj4NCitpZm5k
ZWYgWEVOX1JPT1Q8YnI+DQorJChlcnJvciBYRU5fUk9PVCBpcyBub3QgZGVmaW5lZCk8YnI+DQor
ZW5kaWY8YnI+DQorPGJyPg0KKy5QSE9OWTogYWxsPGJyPg0KK2FsbDogJChUQVJHRVRTKTxicj4N
CisuREVGQVVMVF9HT0FMOiBhbGw8YnI+DQo8L2Jsb2NrcXVvdGU+DQo8YnI+DQpNYWtlIDMuODAs
IHdoaWNoIC4vUkVBRE1FIHN0aWxsIHNheXMgd2Ugc3VwcG9ydCwgZG9lc24ndCBsb29rIHRvIGtu
b3cgdGhpcy48YnI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8
L2Rpdj4NCjxkaXY+RG8geW91IGtub3cgd2hpY2ggKExpbnV4KSBkaXN0cmlidXRpb24gYW5kIHZl
cnNpb24gd291bGQgaGF2ZSBNYWtlIDMuODAgc28gSSBjYW4gdGVzdCBteSBjaGFuZ2VzIHRoZXJl
PzwvZGl2Pg0KPGRpdj5JIHRyaWVkIGxvb2tpbmcgYXQmbmJzcDs8YSBocmVmPSJodHRwczovL3Jl
cG9sb2d5Lm9yZy9wcm9qZWN0L21ha2UvdmVyc2lvbnMiPmh0dHBzOi8vcmVwb2xvZ3kub3JnL3By
b2plY3QvbWFrZS92ZXJzaW9uczwvYT4sIGJ1dCB0aGUgb25seSBPUyB0aGF0IGhhcyBtYWtlIDMu
ODAgaXMgQUlYLCBhbmQgSSBkb27igJl0IGhhdmUgYWNjZXNzIHRvIHRoYXQuPC9kaXY+DQo8ZGl2
Pjxicj4NCjwvZGl2Pg0KVGhhbmtzLDwvZGl2Pg0KPGRpdj7igJRFZHdpbjwvZGl2Pg0KPC9ib2R5
Pg0KPC9odG1sPg0K

--_000_6616BFC62ABC4DEFA799BC660BBE31BCcitrixcom_--

