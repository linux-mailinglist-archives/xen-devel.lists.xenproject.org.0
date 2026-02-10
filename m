Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKalM0DkimnTOgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 08:54:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3916111810A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 08:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226083.1532629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpiZo-0001Se-7b; Tue, 10 Feb 2026 07:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226083.1532629; Tue, 10 Feb 2026 07:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpiZo-0001Q0-3M; Tue, 10 Feb 2026 07:54:28 +0000
Received: by outflank-mailman (input) for mailman id 1226083;
 Tue, 10 Feb 2026 07:54:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpiZm-0001Pp-V1
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 07:54:26 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4e8b62e-0655-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 08:54:20 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS2PR03MB8157.namprd03.prod.outlook.com (2603:10b6:8:27d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Tue, 10 Feb
 2026 07:54:16 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 07:54:16 +0000
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
X-Inumbo-ID: b4e8b62e-0655-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dD9asLIROkRL8ESyZD7z2kSUDEdzMdLEVu2ZBRgKNHOOJmemH7KR3qtVfbFaOMvu3swpHiTajxRmzyxfogFeEQTXgNgWiNqlz42BDVeSfrleT7IIJDVUYaGb3YOfis8FKv0W+O1yhZTksPhPqrY0Gf6n1iWOmXQkbmK34/0DObKBYeeyeHK3xJpAcbgy+13fB8+RRL8iyiTlJPm1PbTP6YCmG6alTvpcSVNkbcQybpk7+vqU7yCEpLtMnBtE3yJElbJ19uwTBVPftJTNnsfi+dD+B7BP8g4I4s10TbFdCEklOLgHHayYytSlGO0ABpPAL1NtBAUZ+PZhMvylQpMCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IScWUnGK8f5DidLI0ViOf/3bCFiDMjuKwWd7MGWjGl4=;
 b=AXrkBn5OdGt4/vwElXwXVuLFdQvb096lZ+qBizzFBYxX1bQR1DXp0p/8hl6A87C3vFW0TcfmwSSMao6GxtdxGrEzPzNTzvqaETNh7INU2LsSVYZUdAHUVEwN+Yi3YaPoNgqRSk42CaqvqY88rfi04uO/sx0DyvEbDSfH+yvt54NgZaLeZdIn8tkIINdjg49/xrsO03allkxiE+9k0OBvCxu3IGR1MKT0iSN/s0Ru7n37egfs6bZRhRqAPZJZxSTG/wqs2+mmU5rl/chNKrAgCngSSLfrGDacUfHbgVglRlhJujL3XtUqdfgEjPvLpZeFvlPA9RyPWTgusTfffD7B8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IScWUnGK8f5DidLI0ViOf/3bCFiDMjuKwWd7MGWjGl4=;
 b=XFPugjAnQE5ZMLQl6fp734UgGgWKgztru287wiJvs8apFpaoykRBKoG8TBASRh1ZDiW0aQ37qjSg23jueUDXyuSXniXBRpm3JOrWMdKQ3ks8G6kmHAWmJQbDnnNkx+K888I6+aTGl4DDKlLqOsKKcZeLYnE+4kFDl69f0mhJDn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Feb 2026 08:54:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: short-circuit HVM shadow guest creation earlier
Message-ID: <aYrkJZZd293bhSSZ@Mac.lan>
References: <20260209144049.86535-1-roger.pau@citrix.com>
 <DGAK325RDOQA.3QQFQYK6R0KWP@amd.com>
 <aYoHO2WDnVR4wIL5@Mac.lan>
 <DGAKLSGGUD3Z.36NW0SSYZ8ZW4@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGAKLSGGUD3Z.36NW0SSYZ8ZW4@amd.com>
X-ClientProxiedBy: MA2P292CA0018.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::8)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS2PR03MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 2624e2c7-7493-4c77-6da1-08de687996e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFJDSzd5Nm5DWWpaS0oyN0w1RlhnMXY2MFhTMWRHUmxxZEVTNWozMUhjS1FX?=
 =?utf-8?B?Y2lGKzhOQmEvbUlZMjFZKzNTZytERUVJaHB2MnJmYWJXNHVuaUpIalpmVGE0?=
 =?utf-8?B?d1QxMDRqSnFzVWU5RVVUdXM5YlY5b056SUxJM3ZhYjNGOHhYblBHQi9ZNWtG?=
 =?utf-8?B?REwxR2J5UnBTNkcrU3UyZjJNSmt0T0gwQ0NqSzc5ZzlBRmtCcVFQSzhZdEEr?=
 =?utf-8?B?dU9DV0ZVUXJFMFAxVVkvVnF1ZDcxaXBpT3ZRLzBQWWNJR1ZXaUw2TjJQdHdv?=
 =?utf-8?B?VGRsL0w4b1l1T29MQUYwTkdnVzVNU2s3SkorU1RHNTdCYkF2cHdDUVFtZHR5?=
 =?utf-8?B?RzRkRGVxTGNLMjlmNkY5d3gxdjUycW5oK3hUZXJFRzVISjFDclMrYnVVTGo2?=
 =?utf-8?B?YlFNQnFWV2Y4ZFc4L2RiRGs0ZDlkakg3YXJ0NHN5Q29jQmMwWmF4LzVWcERH?=
 =?utf-8?B?b3Raa3h4bVFWK2JtTHg4djVoUUJEZ05wTHh2aGViWXhRYWpWeHZrTmI2UUlI?=
 =?utf-8?B?aGduWDQ2WDdMZ1lseUNidlZmTGcwL0pyVUp1RkZEQnZXWXVNcnhmQWtJQmxY?=
 =?utf-8?B?YjJDNkIwWFlEY2FtNUh1NXp2Q1l0WVVmRHZtSXM1WjNmRmk1NW5rS0Z5enhw?=
 =?utf-8?B?VEN0dHVlT2JRQ0UxV21mbWVQeTVZTVhaWVlOM0hoT2E5Um5SZmxSTXNoSFMr?=
 =?utf-8?B?V2h2eTF6ZW1sRzR0NitzWjhEbE9sYS9oSUZ6amx3YUlWdmF0Smd3TkplYm9H?=
 =?utf-8?B?aVRTTmsvcE5aa2d4d29QMWlrTGZqK1h6ZHRxRitaWEhrVzdCcXVET3orRE5P?=
 =?utf-8?B?YkZlVm8xSVRucFErNldhdzhrRUkyYmgwN281UW10ZGpPaktFQXI3MG1rbXNo?=
 =?utf-8?B?S09VMGd0Zjhzbmcvdlc5UnhZQW8yS2dISVNOSXpwSVFTbmJhK0RUL2FrK2Q5?=
 =?utf-8?B?MU5SWS9iSFluekFwem1HWHVYMXYwaUhzSFpKMWs2NnVZazJMV3hTTzhNczJI?=
 =?utf-8?B?SC9NamhaRENlcFZqaDJwdTl1T3N0ejd5RXJydmxYL2FIbHR0VHN1L3k1emcr?=
 =?utf-8?B?dnBmUzE2TzJNNXZOazB1eDZrZVhlRTdqamcxbS9Xa0R4ZHA4azFqTm9YSWQ4?=
 =?utf-8?B?RzQrTnJvYklvY0dSdnZwcDEzeGdwdTYxamRyayt0Um1LSXBiTGdzK2ZyaHJV?=
 =?utf-8?B?eWJNRFhFT2l2YWw1UWtlaFUva1A1YTdkcnBzbkpLWkJPeDRmTnYxeFV6WWdV?=
 =?utf-8?B?WlIySmxQdHhDWTdlZE02SlcwUXlNZ0NXcnNlYUVsZ1djWnh3R1cwSW5rRGZX?=
 =?utf-8?B?RHJGbnd2V0V0NU84NU1kN2x4KzlvODV4aHRxMnpUelBBb0tOVDlNUkZIbjJS?=
 =?utf-8?B?TjZIZ0tWak1iSFVqL1BQbExpYytIbEx2WTMwc1RFaWRVS0NEQXFPbk9Gb0p0?=
 =?utf-8?B?RVlaem5NVE1KTXNpMHJ5UmxUQlR5bkdEeW84Y1dKa1MxbVgyOGdTOXhBeUNF?=
 =?utf-8?B?cTI0eitJQWhrMHhKdTg3WVRVSWNkeFRwWGNRSmhoRmpiTVNNdllEUXdmVitC?=
 =?utf-8?B?S3NNMVRrck9VZGxVUG1TRWJ2SGZ0K2tBdk0rdHhpZzZiYlk5T0grTTgyYmFY?=
 =?utf-8?B?M09CZGpZd1cwWHJ4K2oxRUhQcGlQOVJJZXpzcFJmOWpkUjNJbUwvSmJ3NEFs?=
 =?utf-8?B?NGxEbyttSm9ObDlHa0I4MVpHYkJvMFdqUmhRVEJBeUlWVVRBaTl5N2ZMdXRZ?=
 =?utf-8?B?U3lYK1hPNmVOdlM1SGExWGJ0U1phZkpzeHNJRytjbEg5Nys1NFBmTUp0am9F?=
 =?utf-8?B?R0ozM2RjNUlVd1BmZWhJRlNZQllmNGp0VjlMTkx5clpWLzVKYkYwVHp6NWsz?=
 =?utf-8?B?a0FDcHdudlhTZlZNa21LQkhRc25WdjBlN1g0ZWxtejBjSnIwSUFPbTJtYndD?=
 =?utf-8?B?TTRYS2Rac3YyV2tJQUpkY3BETEczb1MxeFNYWEZvc0lBRXQ3dy8zQmNDOVJF?=
 =?utf-8?B?ckNybnR2czFzZDZmdVd1akVUbVgvc1FHN2htTG41MDl2cG80cy9GVEg1TlZB?=
 =?utf-8?B?TXV0OEJySXJsZWNqUTZvRHN6SktiQ0NORElRSGNhcEF5bXAzZGptYjFJUzhX?=
 =?utf-8?Q?yHbY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWZqUTlxVi9TRDJyMWxUb3BGMmU3RFg1QkNIV0VpMUZaTzZ0bGJDb2tRVDRu?=
 =?utf-8?B?bVJXcUVzb2ZSUEtGYURtY0dob1VRck5XeWIzS0wwZ2U0YVY2Z1hWeEIySlAz?=
 =?utf-8?B?eXh2QTEzSjYwa2EwOHJRVHA5KzNUUHhZVmhRV1lxdGVNbURlRHVSK054aWRn?=
 =?utf-8?B?WlZYajVsTjZkb1FVTXF2cVNZY1RyR0l5TXFSUHIyWFQ3b0V5RFVudmhvRlFG?=
 =?utf-8?B?NUJKeEtkZTFINy93cHJTWFFMSC9QWWhUUWZaWjVTdnlCRDl1eVlETDhtRGp3?=
 =?utf-8?B?bE1XYVRuSjl3Nnhwd0NCbmJ6ekUvL1JJRkJlU2hhKzlSenFyYXg2K3NPVGQx?=
 =?utf-8?B?UlRGWXdyNkNhb0g2cUc1Mm5lUUZQSjg5YldOelo3RjNnUmFJTmxZWW9YMFlH?=
 =?utf-8?B?KzUvVzJQQXp6Mm5Zd3N5UFNnNFlVTm1ORDlPRkNlcU1oaUxtUVBPZkxhR1Ru?=
 =?utf-8?B?MVRIMVlNMUJMV2Y1NXNJc3E3REJ5dUJIOHl2SWs2SXJGdnJVa2JLVVI1MXpN?=
 =?utf-8?B?dUNZbmROZzdLZ1FCRk9xUXZEYzFjSWRDeW0rNEJrZDFxM3NiYkRTN29WSk5G?=
 =?utf-8?B?cVMwR21pWUw4R0ljcUVBUmoxQ0lpNFZTd1lET1NQYy9tTkFObFc4TW84aFZU?=
 =?utf-8?B?RmRITE5wQStuc2QzMW11TGxLODk2SXFhMHdHOTEyS1U3V0tnRmlpSUlKS3VE?=
 =?utf-8?B?S0JPbVVzNk04R2VwY2ZaVUFodExkR2toZU4xbjY2c1FwVFVKZHYyUFlqZU16?=
 =?utf-8?B?Q0llUmFlQ282WTFteVhvZHB0RFhzVXZuTlo1OXVKWE5maFhGK1Iyd1U0ZDVx?=
 =?utf-8?B?ZjZkT2t5NnpoQk5GdGZWaWhyVW9sRCthU3dvRitISVoybDZxUHYwbUtpRE1L?=
 =?utf-8?B?U3orVmF4V2FwRU9FdFM1U0NBQVV5RExqV1dJL1ZuQmFkc1owbE9wZ1B1MG1T?=
 =?utf-8?B?RDg2elFxQVViSFB1SFFOUEtxb3pjRkFRZEl4WmptdUJWNTBRU3pIdXVUYzlZ?=
 =?utf-8?B?Y3lFZll5VEVPOUE4cjF0TlczQTNzbXI3N0NaKzRLb1Z4YVhDTE5JUjJYL2hT?=
 =?utf-8?B?QytTNU5hbDF2dG5PeG4xMkVOQVRoV29OMnY2bFhuZWN3QXhwcE9kMCtzQ2pO?=
 =?utf-8?B?SXJBSTBsQjNLOXdpbFdpc2twWG5qMFBreHZUSm1lSG1hekwzYkI2L2p3WkhY?=
 =?utf-8?B?akdTK3V2QllyMStXOGFQajFpa2pwMHBwYXVHWTlTWmk2MS9IYkIvZ3EwZnI1?=
 =?utf-8?B?VEVKZU1NUkc1cXFEVTZpc2U5a0dEOWdEOWwybUErMmN2RFMvZnN1STlZOGVR?=
 =?utf-8?B?Y3FKNjJZQnZ5M241ZlRuNGRjTzdhdi8vSFVqaGRGNXVMNGU0dnZSWHRia2lF?=
 =?utf-8?B?Y0R6RkJWN0svWCt2WjhaVHIwWUZ2UWFMZHBlZlJCNVBCV1JBNWoyVGZoOGpP?=
 =?utf-8?B?alg3OVI3dEpJWld4cTJweHVQUGJDNDIvZGxLNkxtcHhPdWI4UWUyZVlUNnJ2?=
 =?utf-8?B?NFNNNktXVHZXek5KdmJ3eC9lR3l5TlJ2aDRYSHl2Zi83MVNJYVJXTCt2UHlP?=
 =?utf-8?B?dkdJY2M0ZzV0UjU4dzBBMXFnd3VQUTNRN3ZvRWRURkZsZTQ3TEdaRUpGMDRH?=
 =?utf-8?B?VmpxTjNQZHRpdlR4YjNvNThiZVM0UytlL1BHd1gyOGdHcmVYWDhqUWJXL2M1?=
 =?utf-8?B?a2dNQXRxLzhkSVhLV09ScndOcFJCZTFkbHpaa1lGUWJMUHdGenViK1dYUkhX?=
 =?utf-8?B?UGNaTjdDMlBpK3lBTTl5NHJuQmozcnRtRnVQdFZqb2xHS0cxaFpwUFNFT2dw?=
 =?utf-8?B?eHc5aXhraU9sR0RqcTd6NnVIVCtMdnd2My9mS1BRYXA3TS9Va3ZUdmhCdkhi?=
 =?utf-8?B?MVhmd1pGdmgwQ2ZDVnVuREl1S1p2UkJRRzJPdGhaamN3ZHZ5MkEyMzZyTFlI?=
 =?utf-8?B?VW9kNmhZejk2cXhDMjNLMGswNFVhLzQyeXQ5Nm5Gd0RpNWY3aWlsZDIvSzFE?=
 =?utf-8?B?dzNOTW9uTCtJRVVnYlcySFlTSnZjb1dXODdxUGVuTjBxN0ZRU09lMnBpbUJo?=
 =?utf-8?B?bEdhSmVpK3JLOGhZNG1mTXRTUW1wZzVkcUZOTVJEUTZHWlVacHk1NVI0MjJO?=
 =?utf-8?B?a2VnMnNzTDRpbFpNQS9zZ1pKWDFSR2FXek5nbTlDd0VkcWppQWRML2I3ZS9Q?=
 =?utf-8?B?VktBZ0Y1b2kvenFrRHhQS2VDMmlPMzNGTkdJSjlVSXZOZHNodStlczhkSjBN?=
 =?utf-8?B?aHR0bTBpUjRtY1YvS0F0N2RGM2o4UHdNaHdtS3dIOFNoQ1pzMFRSWDZzVVIz?=
 =?utf-8?B?cllNNXFxRlZNR0o2aWppdzNocUdxaWRlSXhUejVNS1BDazdqRkZHQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2624e2c7-7493-4c77-6da1-08de687996e0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 07:54:16.6305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/M7C82gz3sY1o2XXPMkDyQvKbPSfrQprdmc9UGwBcKIYUGXsL4JZmu7RQR2RK+lHwDZcSRnsK+9HpKAlk1CaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8157
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:xen-devel-bounces@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3916111810A
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 05:26:54PM +0100, Alejandro Vallejo wrote:
> On Mon Feb 9, 2026 at 5:11 PM CET, Roger Pau Monné wrote:
> > On Mon, Feb 09, 2026 at 05:02:26PM +0100, Alejandro Vallejo wrote:
> >> On Mon Feb 9, 2026 at 3:40 PM CET, Roger Pau Monne wrote:
> >> > If shadow paging has been compiled out short circuit the creation of HVM
> >> > guests that attempt to use shadow paging at arch_sanitise_domain_config().
> >> > There's no need to further build the domain when creation is doomed to fail
> >> > later on.
> >> >
> >> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> > ---
> >> >  xen/arch/x86/domain.c | 6 ++++++
> >> >  1 file changed, 6 insertions(+)
> >> >
> >> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> >> > index 8b2f33f1a06c..8eb1509782ef 100644
> >> > --- a/xen/arch/x86/domain.c
> >> > +++ b/xen/arch/x86/domain.c
> >> > @@ -627,6 +627,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >> >          return -EINVAL;
> >> >      }
> >> >  
> >> > +    if ( hvm && !hap && !IS_ENABLED(CONFIG_SHADOW_PAGING) )
> >> > +    {
> >> > +        dprintk(XENLOG_INFO, "Shadow paging requested but not available\n");
> >> 
> >> nit: s/requested/required/, maybe?
> >
> > The wording matches the rest of the messages in
> > arch_sanitise_domain_config().  I'm not saying that makes it correct,
> > but if we word this differently we should also change the others
> > IMO.
> 
> My point is rather that HAP, or relaxed MSRs, or other settings are actively
> requested via createdomain flags. Shadow is instead the consequence of not
> setting HAP. You don't request shadow, you either requested something else or
> you hit the error.
> 
> It's not terrible wording, just imprecise.

Hm, I see.  I've always considered not requesting HAP equivalent to
requesting shadow.  IOW: not setting XEN_DOMCTL_CDF_hap doesn't mean
"pick any possible option" but rather it's an explicit request to use
shadow paging on HVM.

The interface would possibly be cleaner if we had both a HAP and
Shadow flags, and lack of any being selected could mean for Xen to
pick the default one.

Thanks, Roger.

