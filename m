Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEGVMDaYjmnXDAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 04:19:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE61329EF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 04:19:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230155.1535734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqji0-0005lB-6P; Fri, 13 Feb 2026 03:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230155.1535734; Fri, 13 Feb 2026 03:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqji0-0005iY-35; Fri, 13 Feb 2026 03:19:08 +0000
Received: by outflank-mailman (input) for mailman id 1230155;
 Fri, 13 Feb 2026 03:19:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QC9n=AR=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vqjhx-0005iF-RL
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 03:19:06 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf8b1d12-088a-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 04:19:03 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by VI0PR03MB10527.eurprd03.prod.outlook.com (2603:10a6:800:208::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 03:19:00 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::d2a4:da44:a0a1:e258]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::d2a4:da44:a0a1:e258%5]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 03:18:59 +0000
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
X-Inumbo-ID: bf8b1d12-088a-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqEpYKSVFUlg4KLljOJQmZb1N+yeu3XbIVoVhlgc7QhTglEKi9Yn1N3rdGNBl1cZ4dG52KrH260SU4iBid4N1UT0Ql5+kuzhPC1o3TfCwIFqY5+v94qHSRtpENL+h0P3jffZgqH0yoTZtu6cpzg283C77gV5QpvS0UAvkYDkMaYYWfinqFe7QPZl/kD5gY2qwokotgr2yrHMniQjp2NCh5yz/lkOjSAbE06nFqnN7+oF+KAq/RyiGurPps6VHB5Ho3JtC2VciWQBMt6hK2noSH4IZsf4yZaC9fxJAtNnMvT6WYbJh+CKJWMol6kQisEIW2nQ3BcvrKL2byASBTRABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAFa/ckxYSa5CZsSTZ6MwkTAveXn9hGaO+1gduzng8Q=;
 b=OvPgLr8bnQbKmhn7S0H+oFrUZqAinrbiv+jimjIBv6gxumcXbdGWmeeGgO6rQUs5L6axo8/FUEkN6xwkVOb66ZP0ydU6cff8WEjESs7FCpBNelvhzX1Z7mQQq4x6v2FU7YIlJlSiViUeFFjfUDLQDVcwLD8H89JILuovtmQE9vzQgfzbqdNtUA9EplpAJzRUWcLysfl+CrCUBaHry4P1KIQqHidZslDj63abhxeenrpQ80c9vYL8AeHGW7G/fIb0XbsNFJ60M6mzxmaxGjDkiACvAAjOXye8PFKJ4Aq6iaVcf4x7inNabclJ+oa6GczUUyT+DU9FAVLzvBBSLbY+Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAFa/ckxYSa5CZsSTZ6MwkTAveXn9hGaO+1gduzng8Q=;
 b=LbEj69E/tPqChD3In8mZEiuyhpOKwWptrGnThVHzo3j7KSP05Dfd/hSmpyX8TFLzHJiNbywf5qIG7SWOVFxJGF3+Q9yuURKj4pzImlPuA8CqaP28qmIW2CeE8QkQizj4VMMx11UtBbA1FDuxz4wAAkZcJ5e9WdE8cpHOKanauJrryxYN8k09NO+EBCgA7H5duGWVHa2tlDLtEBkpIjm3Zd64mCMepugguVqtNGCiZ8dcxjdoc6Rk2oqIUyJJovAo6wTk0txqrwKKf6/Uty58ug16XCVSKSuUGYBh6ycc5tc2zQiUnRI1l7TaEDzpYWa8R+XHiIBF5dQjI4xdowOhAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <7548efa7-2157-4e80-89e1-6a7c58c4bffd@epam.com>
Date: Fri, 13 Feb 2026 04:18:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
From: Milan Djokic <milan_djokic@epam.com>
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Nick Rosbrook
 <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
 <12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
 <b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
 <a5943713-85fa-48ad-86fe-5698604ed8c9@epam.com> <87v7m93bo0.fsf@epam.com>
 <6c80a929-8139-4461-b11c-e6ac67c3d2e4@epam.com> <875xe6ytyk.fsf@epam.com>
 <65727710-0a88-4fff-bb5b-9cf34106833c@epam.com>
 <5df30dbf-17a2-446f-83f9-0e4468622917@epam.com>
 <485a8166-5079-4c0e-a6bf-f6aee8af991d@xen.org>
 <c776c308-cda6-412f-b03c-a4b691b69d33@epam.com>
 <2d07bef7-a7a1-4458-9da6-43bf2956d7d8@xen.org>
 <9c07b1b6-4543-41ba-b58e-1494654a0425@epam.com>
Content-Language: en-US
In-Reply-To: <9c07b1b6-4543-41ba-b58e-1494654a0425@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::19) To AS8PR03MB8322.eurprd03.prod.outlook.com
 (2603:10a6:20b:509::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB8322:EE_|VI0PR03MB10527:EE_
X-MS-Office365-Filtering-Correlation-Id: f320b626-29cf-4f4f-1c06-08de6aaea144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|3122999021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1YzOGk5TndEN3R5NWJFWm9YVGlXaHFyczBxNnBDdmI0TUNIQmNMMkowYXdR?=
 =?utf-8?B?WXpGY0FjRmxZSnJVSm5LZlpQWDQzbWRnV2VJMkU3STVmZzBjRVRGOXVoMzZD?=
 =?utf-8?B?MXMxM3hTM25IMERYVXpTMGlIRU5sRWZqNzEvTEdzL096bW84WGNkcTd5T2dz?=
 =?utf-8?B?OFZuUHk0MEFwck13TFM5REFUUmQ1ZG9LRlQ3MjZNa2dWeHk0RnVSN0pOaTl4?=
 =?utf-8?B?TEtEOCs3N2hRUE5XZlcyTmZsU0g2Qnh4VUF2UFBDTjgyWHZCVU5vWTY2WFJt?=
 =?utf-8?B?TU0xM2xwNEZscXZ0Q01UYU5uSXRLMXU0Y1JKNXRBM3VZcktlbzZ0S3ZqRHFZ?=
 =?utf-8?B?cmhDUmV1cXBIcmhnK1N1eFVIQmhiUFVLMVpCSFdINVVCZ3F4VUE5dVNCM2ly?=
 =?utf-8?B?WktoVlJPU0JnSkdXK1RCOXViY3Vlc0o1TU1pM0FUcGRnUDJVODYxRmVuaFdW?=
 =?utf-8?B?d0syYWtjdEI3ZXE0dVBMc2Vxd0k1WjRFM1hQbk5WNUJRY3NPMVdNenZXZTBL?=
 =?utf-8?B?K2plcWpDdzZTR2NkcytZc0NneHJ3cW5ZSm1hUFB2WnZXdExVZmZhcnk5dkR2?=
 =?utf-8?B?bHRUUkZ3NlBWOXIxdXJFYTF1K2hJWmJHV29pTTZTQk1NKzg4dGFvemhtalM5?=
 =?utf-8?B?OUZFZG9TL2RUWG5rVkdubXRDeHV2MGdQWXVvOXhkRFZDRGVzVW4vZlkzT1dE?=
 =?utf-8?B?NjhHcy96ckx3UjI2UnB0VDVXTk16VDkxeWhkWXZvQlplZG5lSktRKzEyUTdY?=
 =?utf-8?B?R0VOK0dGb1RxUCthTmhHV3NtV1UwdXdZNW9xaXRIbktFeVRqWUxFNk1aVllO?=
 =?utf-8?B?a0h0NGVoK3VDNFV2a2c3VUJHNldEOTVHMzFBdkxoNTczaUx4Wmp1UVN4ZWNF?=
 =?utf-8?B?VVFzOHZxTmxwZmlXWStEaGZTaWUvN0hUYzJwYXpJajY3RUtueW9oaFVOazJN?=
 =?utf-8?B?eUhjeXZyTlVySXdXdVh4VjYxd2lyYjJubmVldENVb3IxOEQ0cFJUU2hVUUty?=
 =?utf-8?B?U2dCM3h3K2NzTmlYVVc4S2lWbFVRV2NCNkRvQlZPcDh0WVdNdkdTYVRPQ0h0?=
 =?utf-8?B?YjhYenJrRGJYeHNwa1hiRXlhUVpkNW1TbVA5bXJEMnVKYkVKOWgxenQxd3o0?=
 =?utf-8?B?VGoraHVHTWdnbmEwRVVlNkorVW12cjhkK0g1d2hNTmpwaDRPUVVlY0FIZHI2?=
 =?utf-8?B?VFpjTDRzbzZ6R1BSbTNWUTl3Vmx4YlM0eFNJMjdjN3h1NGtWY1hKWlBaVkUx?=
 =?utf-8?B?SkJwRkRNRDdhYXcxcnh3a1RqN3Q5cDVmTHVqVjRFL0dwczNmKytnZEhzeUE0?=
 =?utf-8?B?bTlMV3FCa1dQWmQzYUpLcmQ0NTFRbmV3K2UzOWRqVVBrZ2dIa3o3SGMwVTJC?=
 =?utf-8?B?VnJDQ25Rdmo4M3FhYlJIM2diTTl5UmNLbFMwMENrV0pKZTV1bnFTSWNYOWZE?=
 =?utf-8?B?VjliZSt4R2lpTE9sWWVIVUVqR2twS0ExZzI5TzFsRm1VaWFITk5HMmYvdyth?=
 =?utf-8?B?TmZHalhnRC9RUGlCUHdCajIyWkF6b1hjcElTRXFXbFRJazZGVkwrb3pneFRn?=
 =?utf-8?B?MHRqdndUa3dCbTZ4RVJydUVpd0hiZnRBQWMxWmpFWTB4d3ppZXI4MzVIb3NJ?=
 =?utf-8?B?dkk3SGNvTUJGcDdETFZiY0dFUWQ3NWl5ZTRubDlPdUhCa1VXREtLWmdSQkZU?=
 =?utf-8?B?dlBIWHBBQ0dBZUlETTN1VDNHRjFhZlk2K1RkNERWZWVhTzQ0VWFlblpNcTlS?=
 =?utf-8?B?Q3VNRkw0Q2FhVHJyZ09GYmhHM3hvNDdxVlBVcyt0UnlNbnFzcFNFbTRDSG9E?=
 =?utf-8?B?MmVYcThHTkxMb0k5dmNDSFhkcG90bWVPRk1CRzNvdWdXZ0h5bkUyRTlHampJ?=
 =?utf-8?B?OVEyb1RMV1lqck9XTTI2UXFib0J0WkxlUnFrdEZadE1NNnoraHJsdFFad09L?=
 =?utf-8?B?cGd6dnhvRDlESmdVcXNES1dRYmwyZnZPY3BkUTdRL1FtdHpOWUZ6eVZYdzdQ?=
 =?utf-8?B?OWprYVl5bWxyUnR2OUtOUUMvdFpVK2JIY2FzTnJaZkd0UkhDZUU2dDZSTzBH?=
 =?utf-8?B?QlhYR284NklQWWlBS1R0emNOYTJib2dVYzdaS0crN1d6QU4xQUtmWEFIQUxX?=
 =?utf-8?Q?1Ko8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(3122999021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTljWndsUksyQjNaYTJiRTk3MWl1ZkduKzZwMW84ZkhiT1duQUMvRnVPTlh2?=
 =?utf-8?B?WkZYb3F4ckU1Ynd4MGVuQ0d2T0lKamtTY2I5SFpNNVFqODNLUWtNOGZPWGwx?=
 =?utf-8?B?WitCYmVrLyt0V293NDlTNXFvSnVXUlVLcEptMW9SbW9SUXRlMnBCT0o5R3BB?=
 =?utf-8?B?SW8wbXlrSCs2LzNheFk3REtkaThqSXdzNXdjMGJtZi9VN29tQUc1dzJiejVG?=
 =?utf-8?B?YU5HYytjb25DTWpEVW9Bdk5weHR1RmR6Nmd3UjU1V0h0R2szcnZOK29xOVNy?=
 =?utf-8?B?eWxsVXg0MHVzWTZ1QWl5cUJsNVA4R21FOUFaQktRQU1WbnQ0cXNuTGtJb2s1?=
 =?utf-8?B?UTJ4dDZOZjBXMnBMOVR3QUsyYWlTNHMrNGwvTjNEU1dzeHphQWlPRytJYTJD?=
 =?utf-8?B?dTErMXNYa0gzdUQ0NFBPYnJ4R0ppNy94Q1YyME1sUENkcVF0WmZXaVlPblJ2?=
 =?utf-8?B?dWRhS05xeUQyUW5DN2Z1eThCRVlIdkJrcHRZeGpPdlk2cUNLWFo3bzdkQU5S?=
 =?utf-8?B?R2FoNGJwenZQVXF6TDAvdWxYdjJYZUpoa29raDQ1d3hpSGEyR3hJSFV3N2x5?=
 =?utf-8?B?akNlQTN3TnovZkU5NFpveHVqVlJjbjNjNlBWZmcyeGZEb1JybHVaai9hOWw0?=
 =?utf-8?B?NHpIQWdGeEtyYmhEK2h6VHE3Z0twQkROb0plZ3pYUDE5MjZlNW53d3lWcGlT?=
 =?utf-8?B?Z2kwT3loTVpoTkxmQTJxNjdCd3I0Rk5hVVdRVUZUdXhWcjZlYXVnVlBSQWdK?=
 =?utf-8?B?QXBudjU2M0EzcHg1L05GcDRSZUE0d1ZYTWE2eDZxVlB1OWdUcU9MNjJzcVor?=
 =?utf-8?B?ZWlVNmN6WG55Z3RkZUQzaURmV1hmQjJZNmQxSjQ4S1d3UFJ2bit4RFFFb1Nm?=
 =?utf-8?B?UjI5a2V2TktuMUxtOVlpekpZdzJEbE5Fa0RCblFIY1paNTBFeFVEZEhkaEhl?=
 =?utf-8?B?bVQ0dWRMNzBCdjFZTVBwYXQzY3MrVjhnV1ZOdlJmYlFMT3hYZUFKQW5sUGMr?=
 =?utf-8?B?VXVzTmRSaEpMRFpxZXZKNllsUlRqMDlLV3hncHZEYkFRNm42WmcxV2loUi9t?=
 =?utf-8?B?aXdWa05xODJYLzR5SmIvWW5IdzdMTVcwcjlxV0ZqWDJpSFNkMU9uR2pYaXpR?=
 =?utf-8?B?MUhFdHQyZTNZZFhycWlTcXJxc05PRGg5cEtxOXo1bXUzRFkxMW1leml2d1Zs?=
 =?utf-8?B?TEd2U2NZRjBkMmxyaWFpb0pmL2RCMk1YTXAzSk51RzgvVkxDUVdJcFhYa3VE?=
 =?utf-8?B?bVBJb3JHWHlKc0FQTUpJRlNqaEhBTzlTSS9KeDVTM20rdUNmc29rV2l5WEdY?=
 =?utf-8?B?M0t1WENYK3ZTYURMakdiSGx0R2JXSUtIdTJzVXFjQVJMMXJ1S3ZOOGtMNG5s?=
 =?utf-8?B?MDZYYzk4QzdmYU5Ua1lCTTgrT1o5M3RWRW12b0ZEQXVSOXBaNlY4aG1yV0JD?=
 =?utf-8?B?bjEyalY1dWFiTHE4Umd1K2tIZlVhTzJMS2hjYXdPSm91ZjJ1SWsxUkFrVFYv?=
 =?utf-8?B?SkhxbEI4MkdDWFU4Y0hFMk9kVThaR2tlYS81V2ZNaU4xTlpIUWI5YitOeUVF?=
 =?utf-8?B?RFI1UXBoUURKaDlmWlorSUN0Z29OWFJTYlNrNVNNNWNnMmg1eTFzZDFReTlY?=
 =?utf-8?B?L1BtcllWZDNrcVd5UXVhTy8xMSs3UFNzV1RQYktsUVY5QnpxQXQ3dTZZVWhF?=
 =?utf-8?B?Ni90MVp1Tjk1L3JuN3ZOSXZNRzlieFZORlorMjJtWVNhTGZSNXpSejBmNk5O?=
 =?utf-8?B?ZldPMjRyeGo3SXYxS2d0dnZSTTV4QkpzR04wWG1GQi9oK2llNDA4cVRCSUJs?=
 =?utf-8?B?ZS85WE85eHU1bUVKYXliZnluSzMzSGZpcFUzY0MxbmV5bGhhN3NheDNDZ3Bq?=
 =?utf-8?B?UXhSU3NtcVBMbjdQY01OMVFWdXc0L1dDZEZxOHYyZzM3SG50d0tBdkhiM1Q5?=
 =?utf-8?B?WGJpVGNiTXNCSUo2OTErNXFFZytib0c5VC8rUlZZajNBQ0s2enZYYitZb3NJ?=
 =?utf-8?B?SVRZVXh0VVB5YTBJN2s4aGNIUjBDclBMTTJPK01BUFJjR3lRWlRkMTlpOWhp?=
 =?utf-8?B?WGpwbWZIUi8wMUl0cHBQTFZQV21rZFYxNlBOclpXcXp4YnFPYU5VT2w5N3NR?=
 =?utf-8?B?ZUhxWDRCNXdmQmJ3Y29lYmFqY0xmN0kxc1U4RHJvbUo0TXVvZ0J1Y2Z5emtL?=
 =?utf-8?B?WkZGYktUWDhPUlgraFd4cHVvOWVWMUQ1UjdBQmNScmJ0OUhnWFNva0YxaXR5?=
 =?utf-8?B?TWNHKzVKV1JjemN0YmtlOUtJL2xkMURMZ0lwZUIxWEJSaFBuYm1pS2lNeTNK?=
 =?utf-8?B?UHpzYnZiSXZFcVBkbVVwK0FiYTYvVGlheFhlMVFXejFaOEo4YUlyZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f320b626-29cf-4f4f-1c06-08de6aaea144
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 03:18:59.7810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91t0e0qfz/vwg6W+XzzkWV99hSQp4+F0/wJ20XJF0tnrFRs2eCaHCZT3jDl3eoKqrQ5YhFlw0EGgWuHP9yjgdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10527
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:mid,epam.com:dkim,epam.com:email];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:julien.grall.oss@gmail.com,m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:enr0n@ubuntu.com,m:gwd@xenproject.org,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:Volodymyr_Babchuk@epam.com,m:juliengralloss@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,arm.com,kernel.org,amd.com,suse.com,citrix.com,vates.tech,ubuntu.com,xenproject.org,epam.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BEEE61329EF
X-Rspamd-Action: no action

Hi Julien,

On 12/3/25 16:47, Milan Djokic wrote:
> Hi Julien,
> On 12/3/25 11:32, Julien Grall wrote:
>> Hi,
>>
>> On 02/12/2025 22:08, Milan Djokic wrote:
>>> Hi Julien,
>>>
>>> On 11/27/25 11:22, Julien Grall wrote:
>>>>> We have changed vIOMMU design from 1-N to N-N mapping between vIOMMU and
>>>>> pIOMMU. Considering single vIOMMU model limitation pointed out by
>>>>> Volodymyr (SID overlaps), vIOMMU-per-pIOMMU model turned out to be the
>>>>> only proper solution.
>>>
>>>    > Does this means in your solution you will end up with multiple
>>>    > vPCI as well and then map pBDF == vBDF? (this because the SID have to be
>>>    > fixed at boot)
>>>    >
>>>
>>> To answer your question, yes we will have multiple vPCI nodes with this
>>> model, establishing 1-1 vSID-pSID mapping (same iommu-map range between
>>> pPCI-vPCI).
>>> For pBDF to vBDF 1-1 mapping, I'm not sure if this is necessary. My
>>> understanding is that vBDF->pBDF mapping does not affect vSID->pSID
>>> mapping. Am I wrong here?
>>
>>    From my understanding, the mapping between a vBDF and vSID is setup at
>> domain creation (as this is described in ACPI/Device-Tree). As PCI
>> devices can be hotplug, if you want to enforce vSID == pSID, then you
>> indirectly need to enforce vBDF == pBDF.
>>
> 
> I was not aware of that. I will have to do a detailed analysis on this
> and come back with a solution. Right now I'm not sure how and if
> enumeration will work with multi vIOMMU/vPCI model. If that's not
> possible, we will have to introduce a mapping layer for vSID->pSID and
> go back to single vPCI/vIOMMU model.
> 
>> [...]
>>

I have updated the vIOMMU design following our previous discussion on 
this topic and some additional usecases which we had in a meantime. I 
have changed the implementation which now provides a single vIOMMU to 
guest, with a Xen mapping layer which translates it into physical IOMMU 
layout. This design supports multiple physical IOMMUs and also aligns 
with the ongoing vPCI/PCI passthrough work.
New vIOMMU design is provided below, could you please review the updated 
design?
Changes comparing to previous design version:
- Switched from N-N  to 1-N vIOMMU-pIOMMU model, with the addition of 
vSID->pSID mapping layer
- Added some details related to vIOMMU emulation flow (commands, events) 
and the new vSID->pSID mapping layer
- Assumptions and constraints for vPCI compatibility. PCI support is not 
yet complete, planned to be implemented in alignment with the ongoing 
PCI passthrough work
- Removed security considerations which are not directly related to 
vIOMMU (xl, libfdt)
- Expanded mitigations for scheduling-related risks
- Added initial performance measurements for the Renesas R-Car platform 
(to be extended with future PCI support work)


==========================================================
Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
==========================================================

:Author:     Milan Djokic <milan_djokic@epam.com>
:Date:       2026-02-13
:Status:     Draft

Introduction
============

The SMMUv3 supports two stages of translation. Each stage of translation
can be
independently enabled. An incoming address is logically translated from
VA to
IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to
the output PA. Stage 1 translation support is required to provide
isolation between different
devices within OS. XEN already supports Stage 2 translation but there is no
support for Stage 1 translation.
This design proposal outlines the introduction of Stage-1 SMMUv3 support
in Xen for ARM guests.

Motivation
==========

ARM systems utilizing SMMUv3 require stage-1 address translation to
ensure secure DMA and
guest managed I/O memory mappings.
With stage-1 enabled, guest manages IOVA to IPA mappings through its own
IOMMU driver.

This feature enables:

- Stage-1 translation for the guest domain
- Device passthrough with per-device I/O address space

Design Overview
===============

These changes provide emulated SMMUv3 support:

- **SMMUv3 Stage-1 Translation**: stage-1 and nested translation support
   in SMMUv3 driver.
- **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1
   handling.
- **Register/Command Emulation**: SMMUv3 register emulation and command
   queue handling.
- **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes to
   device trees for dom0 and dom0less scenarios.
- **Runtime Configuration**: Introduces a `viommu` boot parameter for
   dynamic enablement.

A single vIOMMU device is exposed to the guest and mapped to one or more
physical IOMMUs through a Xen-managed translation layer.
The vIOMMU feature provides a generic framework together with a backend
implementation specific to the target IOMMU type. The backend is responsible
for implementing the hardware-specific data structures and command handling
logic (currently only SMMUv3 is supported).

This modular design allows the stage-1 support to be reused
for other IOMMU architectures in the future.

vIOMMU architecture
===================

Responsibilities:

Guest:
  - Configures stage-1 via vIOMMU commands.
  - Handles stage-1 faults received from Xen.

Xen:
  - Emulates the IOMMU interface (registers, commands, events).
  - Provides vSID->pSID mappings.
  - Programs stage-1/stage-2 configuration in the physical IOMMU.
  - Propagate stage-1 faults to guest.

vIOMMU commands and faults are transmitted between guest and Xen via
command and event queues (one command/event queue created per guest).

vIOMMU command Flow:

::

     Guest:
         smmu_cmd(vSID, IOVA -> IPA)

     Xen:
         trap MMIO read/write
         translate vSID->pSID
         store stage-1 state
         program pIOMMU for (pSID, IPA -> PA)

All hardware programming of the physical IOMMU is performed exclusively 
by Xen.

vIOMMU Stage-1 fault handling flow:

::

     Xen:
         receives stage-1 fault
         triggers vIOMMU callback
         injects virtual fault

     Guest:
         receives and handles fault

vSID Mapping Layer
------------------

Each guest-visible Stream ID (vSID) is mapped by Xen to a physical Stream ID
(pSID). The mapping is maintained per-domain. The allocation policy 
guarantees
vSID uniqueness within a domain while allowing reuse of pSIDs for different
pIOMMUs.

* Platform devices receive individually allocated vSIDs.
* PCI devices receive a contiguous vSID range derived from RID space.


Supported Device Model
======================

Currently, the vIOMMU framework supports only devices described via the
Device Tree (DT) model. This includes platform devices and basic PCI
devices support instantiated through the vPCI DT node. ACPI-described
devices are not supported.

Guest assigned platform devices are mapped via `iommus` property:

::

     <&pIOMMU pSID> -> <&vIOMMU vSID>

PCI devices use RID-based mapping via the root complex `iommu-map`:

::

     <RID-base &viommu vSID-base length>

PCI Topology Assumptions and Constraints:

- RID space must be contiguous
- Pre-defined continuous pSID space (0-0x1000)
- No runtime PCI reconfiguration
- Single root complex assumed
- Mapping is fixed at guest DT construction

Constraints for PCI devices will be addressed as part of the future work on
this feature.

Security Considerations
=======================

Stage-1 translation provides isolation between guest devices by
enforcing a per-device I/O address space, preventing unauthorized DMA.
With the introduction of emulated IOMMU, additional protection
mechanisms are required to minimize security risks.

1. Observation:
---------------
Support for Stage-1 translation in SMMUv3 introduces new data structures
(`s1_cfg` alongside `s2_cfg`)
and logic to write both Stage-1 and Stage-2 entries in the Stream Table
Entry (STE), including an `abort`
field to handle partial configuration states.

**Risk:**
Without proper handling, a partially applied configuration
might leave guest DMA mappings in an inconsistent state, potentially
enabling unauthorized access or causing cross-domain interference.

**Mitigation:** *(Handled by design)*
This feature introduces logic that writes both `s1_cfg` and `s2_cfg` to
STE and manages the `abort` field - only considering
configuration if fully attached. This ensures  incomplete or invalid
device configurations are safely ignored by the hypervisor.

2. Observation:
---------------
Guests can now invalidate Stage-1 caches; invalidation needs forwarding
to SMMUv3 hardware to maintain coherence.

**Risk:**
Failing to propagate cache invalidation could allow stale mappings,
enabling access to old mappings and possibly
data leakage or misrouting between devices assigned to the same guest.

**Mitigation:**
The guest must issue appropriate invalidation commands whenever
its stage-1 I/O mappings are modified to ensure that translation caches
remain coherent.

3. Observation:
---------------
Introducing optional per-guest enabled features (`viommu` argument in xl
guest config) means some guests
may opt-out.

**Risk:**
Guests without vIOMMU enabled (stage-2 only) could potentially dominate
access to the physical command and event queues, since they bypass the
emulation layer and processing is faster comparing to vIOMMU-enabled guests.

**Mitigation:**
Audit the impact of emulation overhead effect on IOMMU processing fairness
in a multi-guest environment.
Consider enabling/disabling stage-1 on a system level, instead of 
per-domain.

4. Observation:
---------------
Guests have the ability to issue Stage-1 IOMMU commands like cache
invalidation, stream table entries
configuration, etc. An adversarial guest may issue a high volume of
commands in rapid succession.

**Risk:**
Excessive commands requests can cause high hypervisor CPU consumption
and disrupt scheduling,
leading to degraded system responsiveness and potential
denial-of-service scenarios.

**Mitigation:**

- Implement vIOMMU commands execution restart and continuation support:

   - Introduce processing budget with only a limited amount of commands
     handled per invocation.
   - If additional commands remain pending after the budget is exhausted,
     defer further processing and resume it asynchronously, e.g. via a
     per-domain tasklet.

- Batch multiple commands of same type to reduce emulation overhead:

   - Inspect the command queue and group commands that can be processed
     together (e.g. multiple successive invalidation requests or STE
     updates for the same SID).
   - Execute the entire batch in one go, reducing repeated accesses to
     guest memory and emulation overhead per command.
   - This reduces CPU time spent in the vIOMMU command processing loop.
     The optimization is applicable only when consecutive commands of the
     same type operate on the same SID/context.

5. Observation:
---------------
Some guest commands issued towards vIOMMU are propagated to pIOMMU
command queue (e.g. TLB invalidate).

**Risk:**
Excessive commands requests from abusive guest can cause flooding of
physical IOMMU command queue,
leading to degraded pIOMMU responsiveness on commands issued from other
guests.

**Mitigation:**

- Batch commands that are propagated to the pIOMMU command queue and
   implement batch execution pause/continuation.
   Rely on the same mechanisms as in the previous observation
   (command continuation and batching of pIOMMU-related commands of the 
    same
   type and context).
- If possible, implement domain penalization by adding a per-domain budget
   for vIOMMU/pIOMMU usage:

   - Apply per-domain dynamic budgeting of allowed IOMMU commands to
     execute per invocation, reducing the budget for guests with
     excessive command requests over a longer period of time
   - Combine with command continuation mechanism

6. Observation:
---------------
The vIOMMU feature includes an event queue used to forward IOMMU events
to the guest (e.g. translation faults, invalid Stream IDs, permission 
errors).
A malicious guest may misconfigure its IOMMU state or intentionally trigger
faults at a high rate.

**Risk:**
Occurrence of IOMMU events with high frequency can cause Xen to flood the
event queue and disrupt scheduling with
high hypervisor CPU load for events handling.

**Mitigation:**

- Implement fail-safe state by disabling events forwarding when faults
   are occurred with high frequency and
   not processed by guest:

   - Introduce a per-domain pending event counter.
   - Stop forwarding events to the guest once the number of unprocessed
     events reaches a predefined threshold.

- Consider disabling the emulated event queue for untrusted guests.
- Note that this risk is more general and may also apply to stage-2-only
   guests. This section addresses mitigations in the emulated IOMMU layer
   only. Mitigation of physical event queue flooding should also be 
considered
   in the target pIOMMU driver.

Performance Impact
==================

With iommu stage-1 and nested translation inclusion, performance
overhead is introduced comparing to existing,
stage-2 only usage in Xen. Once mappings are established, translations
should not introduce significant overhead.
Emulated paths may introduce moderate overhead, primarily affecting
device initialization and event/command handling.
Testing is performed on Renesas R-Car platform.
Performance is mostly impacted by emulated vIOMMU operations, results
shown in the following table.

+-------------------------------+---------------------------------+
| vIOMMU Operation              | Execution time in guest         |
+===============================+=================================+
| Reg read                      | median: 645ns, worst-case: 2mμs |
+-------------------------------+---------------------------------+
| Reg write                     | median: 630ns, worst-case: 1μs  |
+-------------------------------+---------------------------------+
| Invalidate TLB                | median: 2μs, worst-case: 10μs   |
+-------------------------------+---------------------------------+
| Invalidate STE                | median: 5μs worst_case: 100μs   |
+-------------------------------+---------------------------------+

With vIOMMU exposed to guest, guest OS has to initialize IOMMU device
and configure stage-1 mappings for the devices
attached to it.
Following table shows initialization stages which impact stage-1 enabled
guest boot time and compares it with
stage-1 disabled guest.

NOTE: Device probe execution time varies depending on device complexity.
A USB host controller was selected as the test case due to its extensive
use of dynamic DMA allocations and IOMMU mappings, making it a
representative workload for evaluating stage-1 vIOMMU behavior.

+---------------------+-----------------------+------------------------+
| Stage               | Stage-1 Enabled Guest | Stage-1 Disabled Guest |
+=====================+=======================+========================+
| IOMMU Init          | ~10ms                 | /                      |
+---------------------+-----------------------+------------------------+
| Dev Attach / Mapping| ~100ms                | ~90ms                  |
+---------------------+-----------------------+------------------------+

For devices configured with dynamic DMA mappings, DMA allocate/map/unmap
operations performance is
also impacted on stage-1 enabled guests.
Dynamic DMA mapping operation trigger emulated IOMMU functions like mmio
write/read and TLB invalidation.

+---------------+---------------------------+--------------------------+
| DMA Op        | Stage-1 Enabled Guest     | Stage-1 Disabled Guest   |
+===============+===========================+==========================+
| dma_alloc     | median: 20µs, worst: 80µs | median: 8µs, worst: 60µs |
+---------------+---------------------------+--------------------------+
| dma_free      | median: 15µs, worst: 60µs | median: 6µs, worst: 30µs |
+---------------+---------------------------+--------------------------+
| dma_map       | median: 12µs, worst: 60µs | median: 3µs, worst: 20µs |
+---------------+---------------------------+--------------------------+
| dma_unmap     | median: 15µs, worst: 70µs | median: 3µs, worst: 20µs |
+---------------+---------------------------+--------------------------+

Testing
=======

- QEMU-based ARM system tests for Stage-1 translation.
- Actual hardware validation to ensure compatibility with real SMMUv3
implementations.
- Unit/Functional tests validating correct translations (not implemented).

Migration and Compatibility
===========================

This optional feature defaults to disabled (`viommu=""`) for backward
compatibility.

Future improvements
===================

- Implement the proposed mitigations to address security risks that are
   not covered by the current design
   (events batching, commands execution continuation)
- PCI support
- Support for other IOMMU HW (Renesas, RISC-V, etc.)

References
==========

- Original feature implemented by Rahul Singh:

https://patchwork.kernel.org/project/xen-devel/cover/cover.1669888522.git.rahul.singh@arm.com/ 


- SMMUv3 architecture documentation
- Existing vIOMMU code patterns (KVM, QEMU)


Best regards,
Milan

