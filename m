Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOpcEWYSjmll/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 18:48:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F8130118
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 18:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229694.1535545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqanQ-0006Vz-Hc; Thu, 12 Feb 2026 17:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229694.1535545; Thu, 12 Feb 2026 17:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqanQ-0006TW-Eb; Thu, 12 Feb 2026 17:48:08 +0000
Received: by outflank-mailman (input) for mailman id 1229694;
 Thu, 12 Feb 2026 17:48:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIml=AQ=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vqanP-0006TQ-Es
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 17:48:07 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f91c8df3-083a-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 18:48:01 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by SA5PR03MB8452.namprd03.prod.outlook.com (2603:10b6:806:474::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 12 Feb
 2026 17:47:58 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%2]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 17:47:58 +0000
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
X-Inumbo-ID: f91c8df3-083a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEU4W4vk7kJITe7tQtcmi7VPg6/lnRii1SbbD448S1UWn+wC8IqnUH6KVygqLsjf3aDCpvXhf7+FEvxi3m4PEsCybYWHFP3b1zp2owfxg+6E433i4XCed4JOJde1EdhpzA5XWMVYBcLyXy11tox5q9vktAHU/rGxqvCNlQ8jZ/giNYlyDPa6FMLYDLZ88XD7aU7NJe7LEF4qz+ZxRGgBzxIUX5AmzVv7V1CLLOwTp4lJ3SeEuhvM/4Y6VsdZqBVbKMaz7xR3T+iEpO3Q3O+5I90Cb9vLAigL027XAqZIa/nJrOQo8ZvuxlMePjvIVS7Zp9flzMm8FKRnO/7kiGrd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nindylR6gt5IUWAulANTZohw8zNKiYcYVxeL92GrJPU=;
 b=Nk+8ZA+BrIb6wTG6bmzOHfNf0K7mPqXW1WViV/MW4EX86EDK1RPXh2eMb2XGNQnI0FGARS9Fr2A4aMWY+4ZQIT1UQORWvDg718WQ0sACda1VTpePr6p+1Pk1y5akZTEAU3owKElDkVg2/jMdMyz5vbNzuL/VVTdZevUNKMbdpRXNsiE5DZDx1b0ISnsS25Js6BZHRO2nvlQrsixaCohyqHQNgtLmMc8n7C+2HJrqEhFNF4miFBBDRuJMRyh2NDbOY6bpH7MHz8/WIHDAZeIF75PiBdCBcguKTIVG8k7VnmiLP13mU58gMX0KOUJAvRZaXBY0D4q6y22446ZZRAvNHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nindylR6gt5IUWAulANTZohw8zNKiYcYVxeL92GrJPU=;
 b=D/l3Ou3m5mDAShlL+3iRc7uEA6+cmH7IQrswErMJFWXRpR16BH4IQ1Ifi/DzEBPMX0/gMrpJ2WfRAQLxkeyDyLCwS6ewrEPKQBogylWUjSbbSKwM8X3CpMR2kyXeBBDmAYiBTZHv+umgaGJvHAZQvMZ+lSfonXvyArRJWqzXJxo=
From: Edwin Torok <edwin.torok@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: RFC: unmap_page_range optimisation (avoiding emulation faults during
 VM migration)
Thread-Topic: RFC: unmap_page_range optimisation (avoiding emulation faults
 during VM migration)
Thread-Index: AQHcnEe5W7o/9c8i6Ei0IwBnD48R1Q==
Date: Thu, 12 Feb 2026 17:47:58 +0000
Message-ID: <16133EFF-88FF-467F-B78F-E96EB148C3A5@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|SA5PR03MB8452:EE_
x-ms-office365-filtering-correlation-id: ed5ec43a-5fb7-4b2d-801c-08de6a5edc08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NmFoSGdFczRwOEluZ09KOHJsS01mSkFlaGRUYTRUdmFCRWtmdWkwNmZBbitJ?=
 =?utf-8?B?RzdFVGJOb0RsTWxNN2FpcEN3TVlxVVlraGd0RXpTOG8yZTYwdnlSZkZwcllB?=
 =?utf-8?B?UEhtWXNXOEw0cXhwMHY2QTh2OHNYMWxMZThCRllLb3lxaC80ZERFWCtJdFNB?=
 =?utf-8?B?Z094amVXSTg3aTV3cDZWVG56QWNuc1NvbXVjcFZMR081cW5CVldIRi9WTHZE?=
 =?utf-8?B?SllUekUreGYrSXFKdURJYU1uNUNSenVuSkFwUHVtTmF2WHVLRGFVcEpJUkFw?=
 =?utf-8?B?TEpMQ2cyQVAzcHF4eFpsTC9EUVU0OHZxclRISEZyTlNEV1hyMlN5cmQ4RUNt?=
 =?utf-8?B?RXVMbzFDS0ErOFYxeTdUcnJHNFgvOHNteEIraDVYQlNncVhQZ21XREIzQjRE?=
 =?utf-8?B?ZHdWRnFxRzVNbGxHUll0ZU5hckVoUTltY3JFcHFQMkxJdzRVSFFvMFRhcGJY?=
 =?utf-8?B?eDd3WTlHNDQ4NGxQSDRWaHNmUEtkS0hPUGJYa29iaFNEU2plUllQWVlqd3ZJ?=
 =?utf-8?B?WnNCS09yNDZ3dVJVMjJUbUdmZHhkNnF3cHp2aUZNcm9sajcrWTN0bDEyOE0y?=
 =?utf-8?B?TEc1ZDhOWjdYWXJkcEdEY3Q5dFJEWFdoOHl5OW8rMUdZTVNkdlliRmpOeTg2?=
 =?utf-8?B?N2ZndkxHcDdaMWVvSFBxSGVkaHRhWm5OaEVnZmxTMDJ0ZXQ4eWVhcHJSTGx1?=
 =?utf-8?B?UTljVVNJWHhQY3ZHbGVaZlN0TGZGYSsvSTlXYkRldW5UdzZuOTBIc0kyRUxY?=
 =?utf-8?B?NUwxMlA5K2g0NWFFVWlvNThGejRoUHV1ZWpHUFJVTDQ1czNYaXA4Q1FHdXRk?=
 =?utf-8?B?N0gyUUk1MG8xSWdUSkRiTHBKR3NzNGZOYUNSNkorZWtMRkM1eEoybTRic3Ny?=
 =?utf-8?B?cXdPMllSVENzNTF6NHFUaG9xWDczYzBNSjRqei9KSDJYbnVMMGFnYmdOT0U3?=
 =?utf-8?B?ZTdDZXhUUHh0b2k5S3hoUFZlZmZrclRvT2FkQ0VmOUNMVFVHVmFFS0NNbTlS?=
 =?utf-8?B?OW5YZjFvV0U0bUxqbkJSbEgvVi83bGR0aEhhM1h5YjBXbFNadkVCT2xIVmFI?=
 =?utf-8?B?WHdvM0h1eDl1bXlldHAvWlcrclRFRnRndzltVzRGUlBLd3duT0F2NEhYaDN1?=
 =?utf-8?B?NkRTMHA3bUtkTTVFYnhFSUF2RE13Y2FvSW5USVJtUE5mS1hkOXp4UlphMGhM?=
 =?utf-8?B?Sm9PSVFLek9TV3pBWndKenZNN3FGbGhVK2cxTVF5b1J1UEt5OG1aaGdDMENh?=
 =?utf-8?B?bGVHRTlVcjZVakJ6UUloWGdtQ0tYRS81bGdLeG9Qb1kxMVZTMUlaRnBROWd5?=
 =?utf-8?B?VWNrNitRMnNlTThRMEJkMGYzZFpQWGtvOGx3T1FRWlNJVkQ2enU5cDdpZGF4?=
 =?utf-8?B?aVlaa3dXaE5XRWxjZUhLaTBWeUJleVdOSjYyNzBqQzFBaU5mS2dvQkcvYTRS?=
 =?utf-8?B?NnBxcWVZODRGcFJLL1FqYVkxQVhnbkp5bU95VDdCT2VQd2x0Q2FJdnZIS3FP?=
 =?utf-8?B?Yk5hVzQ3ZGJOeXZWR1p2djJ2QTFkTjVrR1JZc0dJQkJValVycnArVXVOMEtn?=
 =?utf-8?B?NjhUZXNRWHVJVE1ZR2VkZHFrcG9Qbi84cjdQVGNhd042NW1vRU5tVWszSDlD?=
 =?utf-8?B?YVU4akFtay9Xd2RWcVFKMGxidUpYeFF4eXdpenNtb0tCdThTMGNWdjc5UTQr?=
 =?utf-8?B?WDNDdlBjYkdaSTE2TU5vZmtRbVRveFZ5YTdMUG1kc2ZLNXZhYTFtenNYOXFY?=
 =?utf-8?B?N3FJejUybmM4WmYwZWQ0UkhoSUdIdXJsVjNXZks4ck5MdmdBVW5LOXFqU2lP?=
 =?utf-8?B?WXN3OFdLdGJNWkljN21VM1JVWjVXU1dWUmhqWEJhK01YNTlmbmxWZStlb2h2?=
 =?utf-8?B?RGJDUnFXMjYrMzd3bktnaXV3VE1KaEJBYTdEbGM3elYyOWVkd2VCMEUxSmIw?=
 =?utf-8?B?NUU0bkQrR3JLdVdKbWZNS05sR0FZTkQ5MzM5MmJZWXlna0gza3hmWmNVUjhD?=
 =?utf-8?B?VDhvb0RoVjZZSGgyL1I4UGJGT21GTTBFVFZPc3VOMkMzdmRVcWxqQmZYOEhk?=
 =?utf-8?B?QURWMW5IeXcraFZ0WWFyc2JMa2Y0NmRVWDZTNkVFQUN2bnk5YlBGZUlwYnk2?=
 =?utf-8?Q?DI0E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmN5eGk2QnVaT0dvaHRkNmdKMEMxZ2ZVTkhtaEtrQktYcnBLUXNyUzdpdXlN?=
 =?utf-8?B?cEFwVHBlcEMveVJUSVF2cWlLcWhEbnBzdHFTbGVJaUJ5enRybmpVR2liOXV2?=
 =?utf-8?B?TW9XMTE1UDh5M2xnQ3VFSEk3NnhNYXlhcDg3ckdpZm1nTXlTOVdueEF0UVVO?=
 =?utf-8?B?V2lkM3FIQ011SHNQYVVaKzU3M3Z4UmFZWWpLMnRUZDRVYUd4TTBWTzg5WTRY?=
 =?utf-8?B?K2JnYktBNTJzRUpIR3lQMjRWOFY0cXNwdWdCVEFRcU1qUkpLdDZRZ3B3aE1r?=
 =?utf-8?B?OHlnam11eVJlRTVDTFFuclR5TnorL2FRZjZnamcvLzhiQ0ZPSkVLNHlKTytj?=
 =?utf-8?B?QlZTT1k5bHNrK3dmSDJ0MXNHZFRjNVA4UkE1cElwMWJJRWxZQ1R3RG1yREdC?=
 =?utf-8?B?emoxVnQ0L1BvVVNmcVFLbDRTY2oxQTZORmNPaWV1MkpiZnJ1R3NRU2NIeHdQ?=
 =?utf-8?B?U0Z4ZDdEeXg5b2d3T295bklDbXJOa3lwWXpCcjM0WGZyVmtkMlZtdWt5TXNG?=
 =?utf-8?B?WUlkaVdqdE5RQjJNZ0pGUllDaHFaNDVoeWMwazZ6S2c3eUU4bnJqMEp5NGpw?=
 =?utf-8?B?RS90cUYwM2MrRU15eXlQTGRHVUsyM3JQaTRHN1ZIYVpGblE1d3UvVFVUeVp2?=
 =?utf-8?B?WlFVclFnbkt1QXVraWx5dGw4WHp0d2dqQWhKMDlNT05hd3AvVGJDZ3hJYS9n?=
 =?utf-8?B?dVRXcVZMSXNOeWhuN3gxTERBZE5ZSEVrVnBYTEVKTEk0MFdjNkFXeStuQWdN?=
 =?utf-8?B?aGNZdmtJY3R1TUFVQXAzWFViOHpBc2pERU1hTURJdlNiTk9LMEsrQ21vRXg3?=
 =?utf-8?B?MC9XbnhJQk9GRm9oMmdxZ0FxSDFxVjlVK051dWY5d1VzcHNBUVBlU1R4RUZS?=
 =?utf-8?B?K0s0TlhOUnFBTjdGWVJxNW83d1A2VldLYjFTRVJ0RGNRU1NmdEhMclkraFpi?=
 =?utf-8?B?ZTB3eEhlSk1ySVhEMTUwekozU29sd1pQdVMrZVo4a2hqRUNIcmU5OWMvSE1h?=
 =?utf-8?B?QjRXdjFRVlYzTmJVeDVva09wdFlaU2duMGdPUlJhcFN2MXExOUlwaGVpTmt1?=
 =?utf-8?B?cDRneDQrcnh1OUMxVW9HU3plNkRteXVHS1F6RDJtY3JCYU9QWHh5RERHMXRh?=
 =?utf-8?B?d0tackhoUDh3dmI5Wk5DVTRHbGFrNmFLeHVjYmJzSElCYUdYZW9WV1ZzdnRO?=
 =?utf-8?B?cEZuYzFaUnpLcWhXNTROOCt3aW9OUmpPdWFiS0Y0Rk1QQmlNNzJZd2dtRkpr?=
 =?utf-8?B?RU9lK0VFV2FBaDhNZUVuVUpqQXgwWFFNUll4bFRNVnowUklabUgrQ1NEa3pX?=
 =?utf-8?B?YkEvZUs2U1BqKzhyekVZVHd5SW8ybHBDdmpXandTbmo3a3ZHVzFkOE5pTlFl?=
 =?utf-8?B?SkpoWldNbmNQbEhMN0U3U2pXUExtaFNndnI4WFVhaVBFZFpEaHM4aFBPV08v?=
 =?utf-8?B?d0l0U1NyaStGcFZ0Y2RDWXdhSlMwUFFxTlBCbWdVL2VNM1hnNmdkSkl1Wm9Q?=
 =?utf-8?B?ekNLWktPOXNsK3ArTkowaUpVeVk4cFlBWWVKT3RKWXAwLzBvbTh5SGR4bkVP?=
 =?utf-8?B?Wm1QbHlIc0ptL1d6aTlQZjhySDBNWkVVbnQyT2lOaGMwbzc1TnIySVdmRCtP?=
 =?utf-8?B?ZktBNng2RDlxQjhkQTRSTUlJS3FnOVNLNXBiRDNBd0JsOUdKNmhyQS9YeW9h?=
 =?utf-8?B?SDdZK0wvY0Vld2JNWTBHOXVxWElGOW1RM0d5MytVVGozY0t0dktJc0p2UWpS?=
 =?utf-8?B?RTIwNlNETVAzd1ROL0VUTWpuNUQ5NmdRcHVOWlFTb3YxeDJ1TGVlNllMMXJB?=
 =?utf-8?B?SDN3UEZ3N2w5azhoVXZvaGgwRy9DY2prVGh5Z3YyTDlNcmtGTjVFTmlIZnMw?=
 =?utf-8?B?d2FFa2FxSVI1VVdIUWk2bGJ4cTYwWFk1RWVDa3FoVTY0ci9VLzlNVEVJYkxp?=
 =?utf-8?B?Uno1cEpVc3hlTW5VODhXb2c0TUpnV1luT1JNNW9jaldOeUNkek1ia28wc0Ew?=
 =?utf-8?B?MHFwRDRSV1p1am5LUEVmV2pKdFdpU043MUdXS3ZONnlyUFFEUlZVVy8vZW5a?=
 =?utf-8?B?WmplSUhKR2JXSkt3bjRkS3I4cTg4b1dqOUt2OG05eENmTGxPRDJOWHNnVlFR?=
 =?utf-8?B?YURvRWxjL1prREdQV0dNWTFrTVNCdXpiUms4YlU3enEzRlhtd2RYS2ZabFBI?=
 =?utf-8?B?TGUyVnkrZXFneTRXRXFUSVZzeHZzaXZ5UjU1cC9za01xTGpZak1XaGUxR0x4?=
 =?utf-8?B?SXlRUEZlc1VwenZreVNQcUhOVEZueTI3S2x0dyt3aGQ2NFkwY1NiQkFRNlhW?=
 =?utf-8?B?UXlMMDREb0M5YVN3YkVzZDdKdktNQTIraC9ZWEpmcVgrMTFZd3B4TEFtWm9u?=
 =?utf-8?Q?BTT+fU6wR53YzuBE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5DA4A7884AAC54EB78B80E3D9CF0311@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5ec43a-5fb7-4b2d-801c-08de6a5edc08
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 17:47:58.3747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pRU2YpGJlhtCTG8RukGHF5eTENJ8ZpjgNLzDc+rzP0JoxB1Iscmb9hb5E4j9Hp1S/9acCpZU5v241V0xQkGcDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8452
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,jsdelivr.net:url];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7E5F8130118
X-Rspamd-Action: no action

SGksDQoNCldoZW4gcHJvZmlsaW5nIGEgVk0gbWlncmF0aW9uIEkgbm90aWNlZCB0aGF0IG9uIHRo
ZSBzZW5kZXIgc2lkZSBhIHNpZ25pZmljYW50ICh+NDUlKSB0aW1lIGlzIHNwZW50IGluIFBWIERv
bTAgTGludXggdGFraW5nIGFuIGVtdWxhdGlvbiBmYXVsdCBpbiB1bm1hcF9wYWdlX3JhbmdlIFsx
XToNCg0KVGhlIGNhbGwgY29tZXMgZnJvbSB6YXBfcHRlX3JhbmdlIChwZ3RhYmxlXzY0LmgsIGlu
bGluZWQpOg0KIHB0ZW50ID0gcHRlcF9nZXRfYW5kX2NsZWFyX2Z1bGwobW0sIGFkZHIsIHB0ZSwg
dGxiLT5mdWxsbW0pOw0KDQpUaGlzIGhhcyAyIGltcGxlbWVudGF0aW9uczogbmF0aXZlIGFuZCBh
IGdlbmVyaWMgb25lIHdoZXJlIHB0ZV9jbGVhciBpcyBpbXBsZW1lbnRlZCB1c2luZyBzZXRfcHRl
X2F0IHdpdGggYSBYZW4gcHZvcC4NCg0KQXMgYSBwcm9vZiBvZiBjb25jZXB0IEnigJl2ZSBkZWxl
dGVkIHRoZSBuYXRpdmUgaW1wbGVtZW50YXRpb24gWzJdLCB3aGljaCBtYWtlcyBpdCBmYWxsIGJh
Y2sgdG8gdGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gWzNdLg0KVGhpcyBpcyBub3QgbmVjZXNz
YXJpbHkgc2FmZSBvbiBTTVAgKGl0IHJlYWRzIGFuZCBjbGVhcnMgYXMgMiBzZXBhcmF0ZSBzdGVw
cyksIGJ1dCBzaG93cyB0aGF0IGEgcGFyYXZpcnQgb3AgaXMgZmFzdGVyIHRoYW4gZW11bGF0aW9u
Lg0KDQpUbyBmaXggdGhpcyB3ZSBtYXkgbmVlZCB0byBwYXJ0aWFsbHkgcmV2ZXJ0ICBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5n
aXQvY29tbWl0Lz9pZD00Y2RkOWM4OTMxNzY3ZTFjNTZhNTFhMTA3OGQzM2E4YzM0MGY0NDA1DQoN
ClRvIHRlc3QgdGhpcyBtb3JlIGVhc2lseSBJ4oCZdmUgd3JpdHRlbiBhIHNtYWxsIHRlc3QgcHJv
Z3JhbSB0aGF0IG1hcHMvdW5tYXBzIHBhZ2VzIGZyb20gYSBkb21haW4gaW4gRG9tMCBbNF0uDQpC
ZWZvcmU6IDMuMjY5MzIgKy0gMC4wMDUwMyBzZWNvbmRzIHRpbWUgZWxhcHNlZCAgKCArLSAgMC4x
NSUgKQ0KQWZ0ZXI6IDAuNzU2NDIgKy0gMC4wMDIwMiBzZWNvbmRzIHRpbWUgZWxhcHNlZCAgKCAr
LSAgMC4yNyUgKQ0KDQpJdCBpcyBtb3JlIHRoYW4gNHggZmFzdGVyIHRvIHVzZSB0aGUgcGFyYXZp
cnQgb3BzIHRoYW4gdHJhcHBpbmcgYW5kIGVtdWxhdGluZy4NCkZyb20gYSBmdW5jdGlvbmFsIHBv
aW50IG9mIHZpZXcgdGhlIGFib3ZlIGNvbW1pdCBpcyBjb3JyZWN0LCBYZW4gZG9lc27igJl0IG5l
ZWQgYSBkZWRpY2F0ZWQgUFYgb3BlcmF0aW9uOiB0cmFwIGFuZCBlbXVsYXRpb24gd29ya3MuDQpC
dXQgZnJvbSBhIHBlcmZvcm1hbmNlIHBvaW50IG9mIHZpZXcgSeKAmWQgc2F5IHRoYXQgWGVuIGRv
ZXMgbmVlZCBpdC4gVGhpcyBpcyBhIGhvdC1wYXRoIGR1cmluZyBtaWdyYXRpb24sIGFuZCBpdOKA
mWQgYmUgd29ydGh3aGlsZSB0byBvcHRpbWlzZSBpdC4NCg0KSnVzdCBkZWxldGluZyB0aGUgbmF0
aXZlIGltcGxlbWVudGF0aW9uIGlzIHByb2JhYmx5IG5vdCB0aGUgc29sdXRpb24sIHNpbmNlIHdl
IGFsc28gd2FudCBhIHZhbHVlIHJldHVybmVkLCBhbmQgdGhlIGV4aXN0aW5nIFBWIG9wZXJhdGlv
biBpcyB2b2lkLg0KSXQgcHJvYmFibHkgbmVlZHMgYSBuZXcgUFYgb3BlcmF0aW9uIChyZSlpbnRy
b2R1Y2VkIHdpdGggdGhlIGRlc2lyZWQgc2VtYW50aWNzPw0KDQpCZXN0IHJlZ2FyZHMsDQotLUVk
d2luDQoNClsxXTogaHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L2doL2Vkd2ludG9yb2sveGVuQHBt
dXN0YWNrLWNvdmVybGV0dGVyL2RvY3MvdG1wL21pZ3JhdGUtc2VuZC5zdmc/eD05NTAuNiZ5PTIx
OTcNCg0KWzJdOg0KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUuaA0KaW5kZXggNjkwYzAzMDdhZmVkLi5hYjYz
MThiYjU2NzYgMTAwNjQ0DQotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCisr
KyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUuaA0KQEAgLTEwOTcsMTMgKzEwOTcsOSBA
QCBleHRlcm4gaW50IHB0ZXBfdGVzdF9hbmRfY2xlYXJfeW91bmcoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsDQogZXh0ZXJuIGludCBwdGVwX2NsZWFyX2ZsdXNoX3lvdW5nKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgYWRkcmVzcywgcHRlX3QgKnB0ZXApOw0KDQotI2RlZmluZSBfX0hBVkVfQVJDSF9Q
VEVQX0dFVF9BTkRfQ0xFQVINCi1zdGF0aWMgaW5saW5lIHB0ZV90IHB0ZXBfZ2V0X2FuZF9jbGVh
cihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLA0KLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcHRlX3QgKnB0ZXApDQotew0KLSAgICAgICBwdGVf
dCBwdGUgPSBuYXRpdmVfcHRlcF9nZXRfYW5kX2NsZWFyKHB0ZXApOw0KLSAgICAgICByZXR1cm4g
cHRlOw0KLX0NCitzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZXBfZ2V0X2FuZF9jbGVhcihzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgYWRkcmVzcywNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHB0ZV90ICpwdGVwKTsNCg0KICNkZWZpbmUgX19IQVZFX0FSQ0hfUFRFUF9HRVRfQU5EX0NM
RUFSX0ZVTEwNCiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZXBfZ2V0X2FuZF9jbGVhcl9mdWxsKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLA0KDQpbM106IA0KI2lmbmRlZiBfX0hBVkVfQVJDSF9QVEVQX0dF
VF9BTkRfQ0xFQVINCnN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlcF9nZXRfYW5kX2NsZWFyKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBhZGRyZXNzLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcHRlX3QgKnB0ZXApDQp7DQogICAgICAgIHB0ZV90IHB0ZSA9ICpwdGVwOw0KICAgICAg
ICBwdGVfY2xlYXIobW0sIGFkZHJlc3MsIHB0ZXApOw0KICAgICAgICByZXR1cm4gcHRlOw0KfQ0K
I2VuZGlmDQpzdGF0aWMgaW5saW5lIHZvaWQgcHRlX2NsZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwKSB7IHNldF9wdGVfYXQobW0sIGFkZHIs
IHB0ZXAsIF9fcHRlKDApKTsgfQ0KDQpbNF06DQokIGNhdCA+bWFpbi5jIDw8RU9GDQojaW5jbHVk
ZSA8YXNzZXJ0Lmg+DQojaW5jbHVkZSA8c3RkaW8uaD4NCiNpbmNsdWRlIDxzdGRsaWIuaD4NCiNp
bmNsdWRlIDxzeXMvbW1hbi5oPg0KI2luY2x1ZGUgPHhlbmN0cmwuaD4NCiNpbmNsdWRlIDx4ZW5m
b3JlaWdubWVtb3J5Lmg+DQoNCmludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pIHsNCiAg
aWYgKGFyZ2MgIT0gMykgew0KICAgIGZwcmludGYoc3RkZXJyLCAiVXNhZ2U6ICVzIDxkb21pZD4g
PGJhdGNoc2l6ZT5cbiIsIGFyZ3ZbMF0pOw0KICAgIHJldHVybiAxOw0KICB9DQogIHVpbnQzMl90
IGRvbWlkID0gYXRvaShhcmd2WzFdKTsNCiAgdWludDMyX3QgYmF0Y2hfc2l6ZSA9IGF0b2koYXJn
dlsyXSk7DQoNCiAgaWYgKCFkb21pZCB8fCAhYmF0Y2hfc2l6ZSkgew0KICAgIGZwcmludGYoc3Rk
ZXJyLCAiSW52YWxpZCBhcmd1bWVudHMsIGV4cGVjdGVkIDIgaW50ZWdlcnMiKTsNCiAgICByZXR1
cm4gMjsNCiAgfQ0KDQogIHhlbmZvcmVpZ25tZW1vcnlfaGFuZGxlICpoYW5kbGUgPSB4ZW5mb3Jl
aWdubWVtb3J5X29wZW4oTlVMTCwgMCk7DQogIGlmICghaGFuZGxlKQ0KICAgIHJldHVybiAzOw0K
DQogIHhjX2ludGVyZmFjZSAqeGMgPSB4Y19pbnRlcmZhY2Vfb3BlbihOVUxMLCBOVUxMLCAwKTsN
CiAgaWYgKCF4YykNCiAgICByZXR1cm4gNDsNCg0KICB4ZW5fcGZuX3QgbnJfcGZuczsNCiAgaWYg
KHhjX2RvbWFpbl9ucl9ncGZucyh4YywgZG9taWQsICZucl9wZm5zKSA8IDApDQogICAgcmV0dXJu
IDU7DQoNCiAgdW5zaWduZWQgbWFwcGluZ3Nfc2l6ZSA9IG5yX3BmbnMgLyBiYXRjaF9zaXplICsg
MTsNCiAgdm9pZCAqKm1hcHBpbmdzID0gY2FsbG9jKG1hcHBpbmdzX3NpemUsIHNpemVvZih2b2lk
ICopKTsNCiAgaWYgKCFtYXBwaW5ncykgew0KICAgIHBlcnJvcigiY2FsbG9jIik7DQogICAgcmV0
dXJuIDY7DQogIH0NCg0KICBmb3IgKHhlbl9wZm5fdCBpID0gMDsgaSA8IG5yX3BmbnM7IGkgKz0g
YmF0Y2hfc2l6ZSkgew0KICAgIHhlbl9wZm5fdCBhcnJbYmF0Y2hfc2l6ZV07DQogICAgaW50IGVy
cltiYXRjaF9zaXplXTsNCg0KICAgIGZvciAodW5zaWduZWQgaiA9IDA7IGogPCBiYXRjaF9zaXpl
OyBqKyspDQogICAgICBhcnJbal0gPSBpICsgajsNCg0KICAgIHVuc2lnbmVkIGxvbmcgaWR4ID0g
aSAvIGJhdGNoX3NpemU7DQogICAgYXNzZXJ0KGlkeCA8IG1hcHBpbmdzX3NpemUpOw0KICAgIG1h
cHBpbmdzW2lkeF0gPSB4ZW5mb3JlaWdubWVtb3J5X21hcCgNCiAgICAgICAgaGFuZGxlLCBkb21p
ZCwgUFJPVF9SRUFELCBzaXplb2YoYXJyKSAvIHNpemVvZihhcnJbMF0pLCBhcnIsIGVycik7DQog
ICAgaWYgKCFtYXBwaW5nc1tpZHhdKQ0KICAgICAgcmV0dXJuIDc7DQogIH0NCg0KICBmb3IgKHhl
bl9wZm5fdCBpID0gMDsgaSA8IG5yX3BmbnM7IGkgKz0gYmF0Y2hfc2l6ZSkgew0KICAgIHVuc2ln
bmVkIGxvbmcgaWR4ID0gaSAvIGJhdGNoX3NpemU7DQogICAgYXNzZXJ0KGlkeCA8IG1hcHBpbmdz
X3NpemUpOw0KICAgIGlmICh4ZW5mb3JlaWdubWVtb3J5X3VubWFwKGhhbmRsZSwgbWFwcGluZ3Nb
aWR4XSwgYmF0Y2hfc2l6ZSkpDQogICAgICByZXR1cm4gODsNCiAgfQ0KDQogIGZyZWUobWFwcGlu
Z3MpOw0KICB4Y19pbnRlcmZhY2VfY2xvc2UoeGMpOw0KICB4ZW5mb3JlaWdubWVtb3J5X2Nsb3Nl
KGhhbmRsZSk7DQoNCiAgcmV0dXJuIEVYSVRfU1VDQ0VTUzsNCn0NCkVPRg0KDQokIGNhdCA+bWVz
b24uYnVpbGQgPDxFT0YNCnByb2plY3QoJ3hmbV9zY2FsZScsICdjJywgZGVmYXVsdF9vcHRpb25z
OlsnY19zdGQ9Z251MTEnXSkNCnhmbSA9IGRlcGVuZGVuY3koJ3hlbmZvcmVpZ25tZW1vcnknKQ0K
eGMgPSBkZXBlbmRlbmN5KCd4ZW5jb250cm9s4oCZKQ0KZXhlY3V0YWJsZSgneGZtX3NjYWxlJywg
J21haW4uYycsIGRlcGVuZGVuY2llczogW3hmbSwgeGNdKQ0KRU9G

