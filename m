Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJP4C+yzj2l8SwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 14 Feb 2026 00:29:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96075139FC3
	for <lists+xen-devel@lfdr.de>; Sat, 14 Feb 2026 00:29:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1232106.1536961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2b9-0007Ca-Lr; Fri, 13 Feb 2026 23:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1232106.1536961; Fri, 13 Feb 2026 23:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2b9-0007A1-If; Fri, 13 Feb 2026 23:29:19 +0000
Received: by outflank-mailman (input) for mailman id 1232106;
 Fri, 13 Feb 2026 23:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v8h/=AR=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vr2b8-00079v-1q
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 23:29:18 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd085b87-0933-11f1-9ccf-f158ae23cfc8;
 Sat, 14 Feb 2026 00:29:12 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7940.namprd03.prod.outlook.com (2603:10b6:303:26e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 23:29:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 23:29:09 +0000
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
X-Inumbo-ID: cd085b87-0933-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXw/900nEtowcLbbt1XYxyb8IEcm66CPYNCi1NWXD55l/zwlfAN+zWlZS2xz0h7XxJ/VTvhqMtdynA2kccm6pEcjfd/BQLp9ARK3MX+e/NrJMLgdqULTDK0rDBALv2qcIAXHR1P2rF1IGHzBgPKYYopCqtVXVo2bON0+/UBOp89pyr0fFc/OKqHruTzCjbWM8B+0t9UbAm7bH7ihLz7PmcTwOwoCU/POK+2TSKKfACd7Jgax+4ZS3kmCG5DHA+i2K7sBSsqd5R9efRITHI75nyt8BSLm6c3DuZ+jHq0azDWUQwpipM/QvCXDqe7DB2DTLxkvy8zGuAIXmSzIAzEe0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/g+F66yAnqm+rTToTy7w1e4leW9teOXDS7vODxbAYhk=;
 b=y+XDAHco6m9ydkNfXcRqCeqgiUfrMFBHZ02fOTppKfiLG6tanEUrU9lppOHU62FX8KmYelBRHUcq6BsAvTe0rgrZo+m2uJBivg15+v8YO3tfUCfLP8u8csCHCryXL9jfN9k2JDaVHDDTLAFzi/QgjAvawjXMxDV75cScqqCWnw9mJp7eXw/R89umUmkirjHQsAEvek0wgcgz7u5BLJhTj64810K3Z1ClG3ieXoFSFTNAYO85bNUhxkItxibsCuELQqubGAsZfV/SxEBX33r8SlqsPOTdkkMIY2BwkkgUByQPdwzzaNivrZ17sCz/uB40VKXmpnasARM50UPEmNGeZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/g+F66yAnqm+rTToTy7w1e4leW9teOXDS7vODxbAYhk=;
 b=qMGyWdjHKdoRAOY/UiWSKqUnXxQnzXDI9ywKmnJwTnhZqfbFA0BPlWfy+5TRJIYMBQ1rllrgX2pr0I4efwSCr0kxVmip7zBh3L9NfDrX/5Ys22M4hC9gGfcMJQyzSPxRmjtGsV8M0Gvak5OlUWtKvtMDkiuZwRFsTEx4nV7qHE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d1765cd9-b95a-4032-bc0b-ada50e1a05d6@citrix.com>
Date: Fri, 13 Feb 2026 23:29:06 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com, jason.andryuk@amd.com, alejandro.garciavallejo@amd.com
Subject: Re: [PATCH v3] x86/cpufreq: Add Kconfig option for CPU frequency
 scaling
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260213222818.271685-1-stefano.stabellini@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260213222818.271685-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0207.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f299ddb-c106-45aa-1c88-08de6b57aff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUFwNnFlZC9MMldMMVFLRytNZjRrNnd6M2x4ejJ4bkFneFhWQmthU1JXZU84?=
 =?utf-8?B?anFwMlNmWnVQQUNkTDV0djdvQUpSNnhYLzhFZnNCYnV0bHBibkVZdk8wNTUw?=
 =?utf-8?B?MTQ5b1d6VUJjVzRIcE0vcGwzZ3BFUWxCeDhCenFTbS9aSVpHL2ErNnBxL1hK?=
 =?utf-8?B?a0NLYmovVmhtd2JsaXkrUFd4TmxNL1QydmNaZ3RlVmQ1dFpmWk9WcC9qam56?=
 =?utf-8?B?Tk9pbzB2V0c4MG93RXdya2kxUkg4aEdpbUFueFJXb2NPK3NNTWh2UlVzYi9S?=
 =?utf-8?B?QjNVZ1B0dzlsZ00xTU5DOFV3WjlKQlRHYkpkUWw3Vk5wSWEwdWdKTmFvbHd0?=
 =?utf-8?B?TU1BdU5LckNjN01qZ2JwUkplaTJ1ekpEUXNvZnIxVFZybnMxdTVKNWdSK0xP?=
 =?utf-8?B?YWRKWVJQOEtMT3MwK2g1WTVDekNBMTc0L0R5ajZhM3lDdkNuTmlmQmpiTTF2?=
 =?utf-8?B?dElLamRKOU5jWHBaRHlKb2JMYmlDUkduUktpTDNNdU9IZmFhNkhGZ2Q5ZDJn?=
 =?utf-8?B?bm5XNTRmcWVhTmtkWnBjSkdsWmVnbHVCL3AxUXlmd2dJLzVEYU5yNjZCVG51?=
 =?utf-8?B?bWRxVDFjd1NGM2NhM1lTbHMvRmJXMDJ5SnV5UXJ1VlBqcE40YWFUSmszVmtq?=
 =?utf-8?B?bFhyOUFRR1ltM0F0T0tVMTRYV0ZsMTRSY0x3UTdydm9veVg1Z2VBMGYyTVRo?=
 =?utf-8?B?OWhOMjYzVC9iWk85Vjh1N2JrZVdLSnVsUVhRN1daMHdCR0dVYm1yMjZpa2FY?=
 =?utf-8?B?M2Zka3hQRVZEMjJ3bnBubkFrZmlUakhNRm9DRGtVdzlNUzRPN09IdWxqYlJ4?=
 =?utf-8?B?WFR1NytOT1l4dXdkYVE0NmQzdkpJSnRvZFR1YkJnUEFyVFNMdzNTOUlDR1Zv?=
 =?utf-8?B?dk9XTzVvcnpxR0NaaXNRQngvZjNkQUZUM0JjMVAxTGtiU0hhaDBiM2MxM21q?=
 =?utf-8?B?NkVDYk1kZmovSWxZak5oVy9HQ0ZweXhzR1AxcEd5TkErc3g0OWNOTFJIUUJw?=
 =?utf-8?B?NnBub3ZHZFk3MTROeUJGUnB6WVppWlJOVUEvWVYrZE9BRjZNU2ZzVHlBZ1Nv?=
 =?utf-8?B?QXN1aSsxRWZDcWQwQkpkLzF5VUZUUkFra01GTm9UWU5qYmlHR016WHVDVnN4?=
 =?utf-8?B?V3FHZVUyRDlPb2JQdGpxanZLWHBjaXpROVRWQ0YzdFZLU1ZlMk43UUs2RXI3?=
 =?utf-8?B?MFlLOFpBdjhmcDUrZjk2cThpN2NVVjZUV2RzMEtrTFBhdXV6ZWNhYkF3TEMv?=
 =?utf-8?B?QUY5MWY1VTQxMExuVUxsdzlKVHFuaFJvUFZnQzY4RDllUlZtUzRlOUsrN3lB?=
 =?utf-8?B?TGNkQkNEcFFSSE1VbFk3NVpIUVlQY0VhUkdraVFiOCtoTUdhMGxXaXdCNCsx?=
 =?utf-8?B?TGp3ZUE5eEY0SjJYcTlJd1VwLzhtVVNKNVM4YS8zaVFlQ3hlZnRjRTRZSEsz?=
 =?utf-8?B?cy9FN3FQVC85L25lZ1E4RThlNm54TEtrL2JJU0pnZUdlRjFwSFZpUk1zY2ZX?=
 =?utf-8?B?a3dyb3R4MHVjS3ViYWZZSDIxM2hIa0V5T2EyUkNSVFl1cDZiSXhxQkZvdm5J?=
 =?utf-8?B?am1RMHVpdmtKVjhLeUdtMWJqaThHOFNWeldEcWhWR3RPVUtoWjZ2KzBEMmg4?=
 =?utf-8?B?WHVpaVB0VGhpdW1iZm1qRkkzQTBEajBwTVdlWFhsck9wNktCYUMyZFhmMkow?=
 =?utf-8?B?YXhFL21YT0VxYWFFZkNQQ3k1ZVRjYUZ1S3ZGSUV2OFdnMXh6YUx5eGNkL0pn?=
 =?utf-8?B?akU4TVZEdjFHQURXWGFDOUdiU1RPWnM2K1NPam1tS1VrblVSSzVWd2M5MTBN?=
 =?utf-8?B?bUdZZTl3WGdhelBQenVRNnhEM28xWnh6T0pXK2hvZUhHeHJHbFg1TmYwVVNU?=
 =?utf-8?B?NXVsM2F1Z3o2c3pQMnM2S214MExpeHBQaXRQekVEWVFuRzUrTUNKNVhiK0dP?=
 =?utf-8?B?WGZneHZoQ2JMYm9Fa243eFpRUWxORzJZRTFGN1RsRU51RmEzQ2ZvWWJ2bkV6?=
 =?utf-8?B?NGF3bG1nZkI0UFpJdG03VTlMQ2U5Q1JrNU9HZmgxazNEeUFPZVdULzJHN2Jw?=
 =?utf-8?B?RGlPYTZDM2pqUHkwOTVZbitpR0J0VFl6NkZOYjlPQU1qbVM5d0VOc1ZjNmJ4?=
 =?utf-8?Q?+nvs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFgxUmgxQU41emVLS3lxQ3ZrbU5xTlJwZ29qTHo1d010SExsdlo3WEFVektS?=
 =?utf-8?B?a2xXU3BQandzK2NKLzU1cG13Nzh0YzdUcG9UT1FpcEVYRjAzMjlSbTlLSC85?=
 =?utf-8?B?dWxESUxRRm1ZRVl3QUdTL2hZZWROeVRRQTJ6L1ZOMklnNitmWG5CR1lMY1Nu?=
 =?utf-8?B?ZWVrUHN0dEhnbmFaYW5xOXZmSEFXaC9RcFhWaHZlbDhiZ0xOMzJvSkZHQUxD?=
 =?utf-8?B?SzlyNUg2SkloMFNQSVcvUVFNUUZMbHdrNkNSeGNINU52OHMvVjVyNFlNcjFC?=
 =?utf-8?B?aVRVQWFkakREZ3JXVDdkN3BYenhLTHEyVDVVWHlKdk1VMDNPR3laQ0g0Ti9P?=
 =?utf-8?B?bCtQa2ZmYzV3N2dJOEI3Zy9ic0RUNWdpNGwvbGVLY0tvNk5DNFpkUTFSNGlR?=
 =?utf-8?B?c0YwZkROcWRMaXE4RmxrMXQyUGZSNWFFaTFaU0VJSHViZ3JmK3JpUVUwa1Uw?=
 =?utf-8?B?b0xHOWMxZUV1VHlvNm5yUk02RHFGUnNKL3FoTk84SDJrYnBPeWhnYzYweUc4?=
 =?utf-8?B?dzVRaklHRnhsbURJWG5LYXRadWdacDZVd0c3ZkRkWkczOHYrNjFvaEI1aUNj?=
 =?utf-8?B?WDU4VmpIQ1orbVNQV2NVNmg0d1NpVW9RODJQNkxUQVl3ZUNZMEhzMWkzR3pF?=
 =?utf-8?B?K3hPcUU2ZnpZUHFyTFNYbWNZZ1dCdTNsblEwdGp1SDlONmhKOSs2V3RQdW1l?=
 =?utf-8?B?aXkwQzJCVzhPWnY2aDJtSVpDa1I5djFvUStLMDc4ejB6MVFaTERpMWxDTlM2?=
 =?utf-8?B?Zk1LY1Q3c3JOcWs0SFMzMFY2OWVDbHZjblNYK1VmdzZXbXJtNjVERm1kQjR5?=
 =?utf-8?B?UVVBSk5pQWs4TDNjVlM5Y2RyRENYTVU1QUpMSUE2UFZQMzlqYzhOWVRRTi9S?=
 =?utf-8?B?OElKQTFXWSsrVlVwWEVGREkyVjc3b2xnYnBqbHZmL1JvOTFDc3pKbkpOUktC?=
 =?utf-8?B?bHpPRVZlRi9QSnJNbThxVTJlbjE0NzZFazBreU9NdytpREN0TVB6Y3FQdCtM?=
 =?utf-8?B?VVZ5dEF0cEpMc2tab29GZmF2Nk0raFlBLzFidVYvT0pTd2dqREZKWlpBeHcv?=
 =?utf-8?B?YU1WY2l3RWNjZ1NHQ2xjZU51SDVuRENDY0dOajJ3bStqT1N0RkJ2bmpwcDd4?=
 =?utf-8?B?TFk5UVZRWWNzYXJtWFhOKzM5QUNTSnJST1pteFJZeVNhQWZ3TWJTMzdVSmw5?=
 =?utf-8?B?dW9hQitkNVJNdm1qaE9oTnlZeEZodjZQckhRYzU0VTFYZUpJcWNlanR2Wm1s?=
 =?utf-8?B?ZTRLdktjaFdmanNoMy8yQUtKdk5oNW9aMmNvazhLcURMNDhrdk9lbTFGQWRL?=
 =?utf-8?B?NW5lUzFUL0FHRmllRnhFQXZzRnZWSWlLUzNrVndFRk9UVGtMdzkrcXlxT3Fh?=
 =?utf-8?B?OFZ5RGxrd2ZJT1Rma2xVeTVOUVdRUHdWVkRQQWt4eURmVGJ0SDhQK1NoclBx?=
 =?utf-8?B?OEVnVFZBdml0TEFVNU9TSGt1SjFUR0FVcTZCK0RHeitLUG9TUG1rR2xqbXdo?=
 =?utf-8?B?d095dDZWaUcvTG1qdkhMUTNlRXdXOEtEY3VXaVVGNVVxR0x2SkM1aHFSb3VC?=
 =?utf-8?B?TC9GNVV0VkpjQnp4aU52eVBGK1d3TUhpUFlpdHUwSFlTNzVjQnFzek0vak9Z?=
 =?utf-8?B?ZzZLUEtFaWdiUHRKNEV1RTFKcHh6N2MzYlBlaUpQNS9BOFhPWi9Qc1kzMys4?=
 =?utf-8?B?QVYzb0xxclZ6c1RuME9JZ0M4eExSNGhaSVU2UXJEUWVla3JDbEdpVkp5eU95?=
 =?utf-8?B?TE5LSGxkN21KQnlhTkE0UVV3QTd1TURVc3FVVWp1RTl6MXE3Zjl4SDVZNEdy?=
 =?utf-8?B?UWFudXFlOXRoSVNXY3ZZa1p6aU9CdFFpQnpScE96bWp4THBuaEpIaHBzL2tB?=
 =?utf-8?B?dHA0UFBnNWZ0MXBmR0dvcGZmSlZpOVd3cS84Qjl2TGdWaHpnbk1UUEp3aVBU?=
 =?utf-8?B?eUVwakNNaDdzc09RMTkybnZES01XMjRqd2FrZnlQRUw3UE5XanFJRXNTaDlr?=
 =?utf-8?B?YmlRemVCZUpFdjJtQ0ZJUmdQMlpSeUEydGdubXJJNlZmMUdlS2ROcnVTNVlL?=
 =?utf-8?B?eDMyODJIWCsrNXpTNGtMVGVDV05RTEhIZnRDMkNkZENTOUhRaVUvcDhxWC9k?=
 =?utf-8?B?TVBVRDZQNnpvaUU5M0ZWU0dvb0lpNkpUNlEzOFV3cURsOWQ4d3EyVUtvNVJW?=
 =?utf-8?B?cmx0ZjZ0STFZb2ZubWtJUWxGc2dSTVFkSnMycWZWcTB3TUplY01VQjZQWHBt?=
 =?utf-8?B?eHNkTE1BNmVzc2FxQ2hhS3dJazhObis5dWFvOWhQY2JubzBvVjZqS3lVOXZC?=
 =?utf-8?B?c0tSYjdhSmdUd0xnWEFRK3krR2xYODJtOWtEWFdKUFN5NTF3M1hmQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f299ddb-c106-45aa-1c88-08de6b57aff3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 23:29:09.2195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrTL36AfhnmI09+CApTv6blr4KZ6sNptz0EGPy+SfyoAAlOIHwo4BnZS7XVN2OugL+/VdN3Z+jCLAintKlvdleHgg1NgwIAR6E5Gf1ubwlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7940
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 96075139FC3
X-Rspamd-Action: no action

On 13/02/2026 10:28 pm, Stefano Stabellini wrote:
> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
> index c6c5135806..a4669090e0 100644
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -485,6 +485,7 @@ ret_t do_platform_op(
>          ret = acpi_enter_sleep(&op->u.enter_acpi_sleep);
>          break;
>  
> +#ifdef CONFIG_CPUFREQ
>      case XENPF_change_freq:
>          ret = -ENOSYS;
>          if ( cpufreq_controller != FREQCTL_dom0_kernel )
> @@ -544,6 +545,7 @@ ret_t do_platform_op(
>              ret = -EFAULT;
>          break;
>      }
> +#endif

You must not hide case labels like this.  Instead, use:

    case XENPF_change_freq:
        ret = -ENOSYS;
        if ( !IS_ENABLED(CONFIG_CPUFREQ) )
            break;
        ...

which in turn ...

>  
>      case XENPF_set_processor_pminfo:
>          switch ( op->u.set_pminfo.type )
> @@ -936,7 +938,7 @@ ret_t do_platform_op(
>          break;
>      }
>  
> - out:
> + out: __maybe_unused;
>      spin_unlock(&xenpf_lock);

... removes the need for this hunk.

> diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
> index 07bddc58d9..f5caeebb9a 100644
> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -367,7 +367,8 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
>          return ret;
>      }
>  
> -    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
> +    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) ||
> +         !IS_ENABLED(CPUFREQ) )

Everywhere else in this patch, CONFIG_CPUFREQ.

You won't get a compile error for typo-ing a name inside IF_ENABLED(),
but it won't function correctly either.

~Andrew

