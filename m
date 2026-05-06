Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDEWA/cM+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:42:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482824D8C9E
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301460.1575745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYlZ-0002L9-Of; Wed, 06 May 2026 09:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301460.1575745; Wed, 06 May 2026 09:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYlZ-0002Im-Ld; Wed, 06 May 2026 09:42:05 +0000
Received: by outflank-mailman (input) for mailman id 1301460;
 Wed, 06 May 2026 09:42:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKYlX-0002Ie-VM
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:42:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYlX-008FDx-Bv
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:42:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb0ce3-bab6-0a2a0a5309dd-0a2a4504b54e-34
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:42:03 +0200
Received: from [52.101.48.6]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fb0ce9-1dec-0a2a45040019-34653006f471-4
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:42:02 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7196.namprd03.prod.outlook.com (2603:10b6:510:247::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:41:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:41:58 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqXVwc30vxqJclQkqUdhfcG+LHJESWzIWYiKL4WTmrVMK3cHvHP9bTuDd+GNKmhXtPpM4TR0VakpuCxPbQdmoHVBlyqHUMKQt+41c23Cc8WXWl0dp2Sg8oNtA0l1S2Og62xK4pV3XT5BfEOJAM9/G0AY8SIIOwFUarqyTrqceYBUQfGR1x7etruiX/UcnWGG8j9DwWNZGSmHDKD5YgQnNRonG4h7dn07UyYqjh8SdmeEQFlmfH2+8i0NW9Comooe0JXcXcpBEcGOUMoS1hlgg24yM0PrDvtSGXo/YTiOGjNch07EZsD3Eu7Cy7y9Is5FuFNh1jQv+3CR/MVnluJS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqsTuLNhSof9afAQBDQraaBkJujP3Vc/cSPLFr08HJs=;
 b=D9yuebb5bmRztd02urh2lk5tvvGwKV1imiDxlOiGx+7CVg7bYIc3UzVhXzAr665MbJWW9WjvGKFQIwC1WfBt1LgXGUQbcLVVUWfy/YpjLHbZODvpH+xVUteyt1ZdeewP1MQNpptQubh8tQ/vZNqDzLx4u4U5zVTDi+DwSFmDlZSkUZiVIPx2uH2NawupoDaZZC08CvfkM+RhpGO8LDbyJqqJH7ixGOd3tmB6B/QY2wy2Z9utY4oM/cczMp4DV4++TePcvQSPDP3W155GwHBAXmGMeTLq6YtVP5DO08jVjCiqTOZ3MmhB8yty6O2AQjOcqmp0TxFpbTrRtWGIEusvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqsTuLNhSof9afAQBDQraaBkJujP3Vc/cSPLFr08HJs=;
 b=cuDttuwHbJ+yHLH9NZ7M1BjKSh7QNr+SuFD/miYqJtnWWibFsqCOiYj9eqKE22d7PxW0oS+2OAZEyAcNsnkRQmobd7WQ/jNqiVn1LAk4/Zx7VuselMH/BTznp1t7hrrYCB+mGVUmav1d6x+UYbbnAkjhnicyoUd2IeaQLq1/+jM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8337539c-8a73-4222-8afa-94cf11c278d5@citrix.com>
Date: Wed, 6 May 2026 10:41:54 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260506073719.40075-1-roger.pau@citrix.com>
 <20260506073719.40075-3-roger.pau@citrix.com>
 <41ec5134-b117-47ee-8e59-682ac1e4a69f@citrix.com>
 <afsCn28tVltkg0u5@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <afsCn28tVltkg0u5@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 0808c1ab-0190-4653-4ea1-08deab53b75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9DCAAAkRmiXcnhmj88C/O75uO7XWvg2cHgFTi5unCQhGq5pZHffQGFc+/Q5Z2OKsTKKfq1mP28hGO0uRZnZ/xr1j5hcLfrBW7m39qPEGfi7Uk/sYZO0b33cF9I74/0A+kOzhab+kG7o7TijobQtaypP4UGbhZdzTj4lTPg+f8at9QFSjnZot/zhBLrv905vj52wlqF3ezKhNUxtHQODiXK3FcC1i6nmopmV9gM/s7zuTLllRmUaW46qaBa961U+uCWFxF5HDVQaZ6v6EMdUivIrOayuzaevLLcFwSzW/QCOLVHEBaFg9CNTlHVCKzqMlMlbAu4smX1W57wF4aKxPMzg9Ptkd4OfsJie2kKyDOUbt4QRO1fCHn0LK3ZYG/WKobmpB7rjVU6GWWdLtYbeZuLMUwOM4ChTIGZan8uqDteJRpYaaXnvoJ29TfctdojNwP3mtlsxecwQXCmL1DpJ72l9IjyV0YOxSKW8hFdaL1D6JWOTChOe4w/I8n28i4qMpBQytOpaNoVo1LfVxY3xIVWtaEaSTodLJbtVE+ZoOXghOmf70I6e2ddIIlbTfaWH8pXsK8yBttelZtwUCwQl8+0DJyWf4FdpguKFp6wySiXtZD/ymTMCVYI+IZEYVUjYIFJ4zJrsC+nZX3Nr+BE8FXAWFwSpPjAoXDg/T0nkm6N1pmJN98V/DAuH8lTpS5bzs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0ozdHJaZDZZWDYvYzNjcXo2eWkzbUJOVFNRYjFoWUdYYXJkcmZ5NE1tU2hG?=
 =?utf-8?B?emNpRGFRbmplam1zRzAxMzlscXFwTWFPREN0U3g0QmpKWk1RN3JjTmVXME42?=
 =?utf-8?B?MmtWMktrRzUwMkRaU04xemtFaEd1T1ZjUndJd2pWL051TTEvVzBxcDMyNkJx?=
 =?utf-8?B?cTlPQmRkSHptblNrWFFGSGtSa3g4anhSV0FseTVVYXBLcHJqa2o0eFlMOUJL?=
 =?utf-8?B?T1A0S2JvRTk5d1hZclY1VUdyR0NoalQwdzQ5SHBMSlhZdmhZN0FMVWFDK202?=
 =?utf-8?B?RnZyMmRhUnp5QlBhVkJtR2hrYlpyR0tCaVd5a2tiYVBibWFENjhORDVKVFh5?=
 =?utf-8?B?REJhZzV0cER3Z3hjUk50VUJhd3pUb3k4TnJKTXEvUFZRNk0xb2wxazQ1dFVv?=
 =?utf-8?B?WkFNejA1QnVjazhnRXNLZjRkZ01tcGh3T2dhVXYzeVZDM2RTZTZxU3lGenBn?=
 =?utf-8?B?ekJMNUovcDgxR0pJekp0T0ZXdnRoOUJVdmpiM1d1d0pjaDZpWk5sMGdCbHMy?=
 =?utf-8?B?THVXaWV0NTdLb1NJVGNDUHdlMjVIWGlYSUpxaTNMYmlpdUsrTElwcHlaYVFV?=
 =?utf-8?B?STdHZk5DbU5CUFJOM0d6ZERFQ3p6T2J5SUVndncvRVlGcjBWbkN2N0ovRllD?=
 =?utf-8?B?bXFZYlZQUUx6ZmxvWnhjQVN5dHE1Tm8xendnckpHamllQlB2Wk9tT3ZiNEVV?=
 =?utf-8?B?WlFPRjRvaXpaNzRXVE8wV1lhMGhxYkVDVjZEMGFwTU5vbXZ6d0hMZTdDZnNZ?=
 =?utf-8?B?WXlhelg3b2dVaURrV0VURkszVjB3VStTU1dZWmRmVEE1UVN3NHdJNWJCbkRq?=
 =?utf-8?B?bU1MZWlLTUEwcG52bkpDYmozRzRaUkhuWVM1bmlRTDNQZlhPMkJNVTBuVjNq?=
 =?utf-8?B?QU10QmpndVd1b1ZVNDNxSkVYM1lFOS9FQTBLQkk3U3dtNzJCRjdxSTR1OTdk?=
 =?utf-8?B?QjA4VVE1NTUxWlVMbWNENHArN0t2YkhiTGhueFdEWVUwMWpzRDZoc3grNHQ4?=
 =?utf-8?B?UTB0bC84czdXMHZSUjBrNFAwMTNQYTU1eTZNNHVvSWtYR01SeU1LYlNGRXA0?=
 =?utf-8?B?aW1lOEU0RW55dnlQRUt0RHZxSE1yMlZoTHRuVkM4Wkk1Z3lXQ1pkVlJtbU10?=
 =?utf-8?B?YUxnWFhsTFlYbWxCUWtUdnp1YUV0Y3EzOEQ5L282RnprVjQ0enJJODYyMFUr?=
 =?utf-8?B?SW8zTGhiRllKUHgyZnRwYUI3NytlN1FWbEpRWHVKYVRMbXRPSjdscTNaT2lh?=
 =?utf-8?B?WEFENisxcHZVaVAzUDJnZUdhSG5TOFRHMkhTNkxuYTFzRDFGV0ZiYjdSbHkx?=
 =?utf-8?B?RWUxdzZiRG82YTFEck5Ib0hVZ3luVXp1Qy92YUV3V3NaZzF6TkRPK2NoNGxy?=
 =?utf-8?B?aDhpd3pBTlFIeWljMmhraUt2SFdNUW5MRERCd0pITmg3Y051Ykg4M1QvSFVi?=
 =?utf-8?B?bTlTSkJTcCtNV3docGoxZVY0WTJvM0wwWm04V2t3TVpkVTFkMnIzdWpsVWh1?=
 =?utf-8?B?eElxeDZXcVJmKzJDM2VWN2JmaS9xWHkrNS80Z3BSN1lYOUFMcWJxOGFvVk04?=
 =?utf-8?B?WGNKVlVkb0FLRzVVcnRacnY5MU1DWjN0T09rSWhuWTFDbFNRblEyeWp1MlZP?=
 =?utf-8?B?YndPSlI2WndiRVJVSEpvR0p4UW1hUlRFRDhSWFIwTVdWZnJTVXBwZGN5ODN5?=
 =?utf-8?B?Y3NiS2RteG42M200elFwQTJ3WmtsZTU3RC93QTVGVFl3OW4xSGFpdE9VOGpq?=
 =?utf-8?B?Z2VJSXpVNFFuVjdYd1p2OEVvKzhNM2ZCWFlNMEpBMFlFQXBUdDNhQlJIZVR4?=
 =?utf-8?B?bk8xd3d6cWJ6TzBHWFJScHZzWVpQTFZublczMHhvTlY4YlRKYXJYZk94SFB4?=
 =?utf-8?B?L1A3UllrQWl6QldRVkoxSWg4cmwyWkEzK2owWTNCL256bW1jR2ovUXdHZSth?=
 =?utf-8?B?dDExR1NtaXB3dlNTa1pFZzNOM1NxWFVhMzVSYU94U0ltUngzc1ZoRzZEanE5?=
 =?utf-8?B?Y3FwRU1pc1R0SjhpSmtBc0YzT2s2eDBUck9aemFOMzlFMUxvSWNCbnovdlUv?=
 =?utf-8?B?SWswOHhkdFNjWkR6YjNsQklDYWZ2amZBVXVCTHVsR05ValptNU44RWs5QWFW?=
 =?utf-8?B?MHV3SWhkQVBCdUZZN00rMDIweFEralEwKzdlZjlGczdGL0pvOTFNK1VCYlE3?=
 =?utf-8?B?SHpRL0ZVRWlqN05zVmxNZUwza2hrZFpUZDVnTFRLaWZwcHpvNEhlZ3RWM24r?=
 =?utf-8?B?K0kxOUZrNERzZlJHbi9lMXdaY0F5OThmRTNIQ2RqYVN6RkZ0dGpYZWJET3Rz?=
 =?utf-8?B?TlJjUmhyZDVUdHB1dmo3YlZ6Z3VwRUdPSnpMWGloaDQ5UFVCTjNTRlRwc2Rx?=
 =?utf-8?Q?l0nw21Ro1h4ztyd4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0808c1ab-0190-4653-4ea1-08deab53b75f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:41:58.1238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cS+mlVzY11glrkdWmWvIQHLAJS+MgqA0E7GpSWObIrROJzkqnrjjRWg4/0ZjiODjyay3B0QCeEu4qP/Svx09rMam98Yjj1cwfOrW8sVGlwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7196
X-purgate-ID: tlsNG-ebf023/1778060523-4014E3FF-254269E4/0/0
X-purgate-type: clean
X-purgate-size: 3773
X-Rspamd-Queue-Id: 482824D8C9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 06/05/2026 9:58 am, Roger Pau Monné wrote:
> On Wed, May 06, 2026 at 09:20:07AM +0100, Andrew Cooper wrote:
>> On 06/05/2026 8:37 am, Roger Pau Monne wrote:
>>> Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
>>> say the least.  We don't know what registers might be there, neither what
>>> values might be safe for those registers.
>> Minor grammar.  "there, nor which values".
>>
>>> On a forthcoming platform doing
>>> the zeroing of the MMIO region can put the IOMMU in a broken state,
>> "does put"
>>
>>> which is not recovered by the IOMMU initialization procedure in Xen.
>> "recoverable".
>>
>>> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
>>> index 76ae78e5ea53..8bf5ca4de18f 100644
>>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>>> @@ -1367,11 +1355,14 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>>>  {
>>>      int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
>>>  
>>> -    if ( !rc )
>>> -        rc = map_iommu_mmio_region(iommu);
>>>      if ( rc )
>>>          return rc;
>>>  
>>> +    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
>>> +                               IOMMU_MMIO_REGION_LENGTH);
>>> +    if ( !iommu->mmio_base )
>>> +        return -ENOMEM;
>>> +
>>>      get_iommu_features(iommu);
>>>  
>>>      /*
>>> @@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>>>      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
>>>          return -ERANGE;
>>>  
>>> +    /* Read current control register and forcefully disable the IOMMU. */
>>> +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
>>> +    disable_iommu(iommu, true);
>>> +    iommu->ctrl.raw = 0;
>>> +
>>>      return 0;
>>>  } 
>> These two things are unrelated at want splitting into separate patches
>> at a minimum.  The removal of memset() critically needs backporting.
> But is it safe to backport the memset without also backporting the
> disabling side?  We might then be dealing with an enabled IOMMU which
> could lead to all sorts of fun.

I would absolutely take working with a potentially active IOMMU over
zeroing the registers which don't appear in the public documentation.

This is where BIOS norms save us.  The IOMMU can't be enabled without
active OS negotiation, or DoS wouldn't be able to boot.  It is only in
the past couple of years where this has not been the base compatibility
case on all systems.

But I see your point.  Given that we were clearing the main enable bit,
we ought to continue to do so for backport purposes.

It would be nice to have a printk_once() in there so we can spot when
the IOMMU is enabled.  I expect it not to trigger but if it does
trigger, we've got more investigation to do.

>> As for disabling the IOMMU, I'm not certain it's wise.
>>
>> Linux can already "bring up" an already-live IOMMU and Xen needs to gain
>> this ability in due course.  This is mainly for supporting PreBoot DMA
>> Protection, but also for things like the kexec environment.
> Note that Linux (when not booted from kdump) will do a similar sequence of
> what I'm attempting to do here for Xen and will call iommu_disable()
> ahead of attempting to enable the IOMMU.

Lovely...  That's broken.

The AMD IOMMU makes this especially easy to do.  Each of the ring
buffers have enable bits separate to the general IOMMU enable, so you
can temporary disable, move the buffer and clear the ring pointers, then
re-enable.

What is critical for Preboot DMA protection is that DMA translation
doesn't get turned off.

~Andrew

