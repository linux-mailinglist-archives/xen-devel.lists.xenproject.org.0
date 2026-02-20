Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id P9SWD+99mGlMJQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:29:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D14168E62
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:29:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237289.1539662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtSRb-0000aI-3B; Fri, 20 Feb 2026 15:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237289.1539662; Fri, 20 Feb 2026 15:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtSRb-0000XG-08; Fri, 20 Feb 2026 15:29:27 +0000
Received: by outflank-mailman (input) for mailman id 1237289;
 Fri, 20 Feb 2026 15:29:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rFK=AY=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vtSRa-0000X8-1e
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 15:29:26 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed131627-0e70-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 16:29:20 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA6PR03MB7831.namprd03.prod.outlook.com (2603:10b6:806:430::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 15:29:16 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 15:29:14 +0000
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
X-Inumbo-ID: ed131627-0e70-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5YjB4l4+RIBPd0dUjh178dQe0WQuNxr+YUijdKbwTOEIwZLdzZIbo4sXVJ2T48dqO5UKarbu5xGukH9uVBzl/5YeUmZjXvQPv4j2SJsND0F2el6J1ZnhPulv2ygsj2jCSDfN40N+JQKr6uq6UaH4n05wXzS5eShq44x5Q4hKouUHo2bSP4MsfcN61VKNBO9qtMUXsKiIxoyd68XiSMXJxrkGg0sYhfoKuRze0yvIb0pzP6ECLZ/FdNPHdJga/FWeOsd9h689dIAhqGhBsfpszmY8LNgbIm/ko/FdEjZvKJ1kopwwC/lZtPjn7HvNwcM5Jbj++7F0TFr5fcICNpUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/Uh+wyylVdjbeX+zh6EIwRBAwtdJNEqW8o/Kesz8cM=;
 b=lEbvj1HD22eGxShqvWNIpG4SSu8J+E4f0Y4oDG47DOoLfba9qUVJgiEu1XlNlg6/HiV7zmX58T7ubye54XM5meTKMrp2X4sUJYjDaMoJ+cJeOq7jRWQFptNQA8bL68xEBEtMXrqFZN6VvaxbPKR7Nw8SOqIAAbnGbxv8cvt8BYOeFItl+hp6D878ka7iYaETiXoFKc/tWAxR6B6Le1zJsqhT5RoS6pgWbM0OL5ZKTWyMrscnfP6bBXml5yn8ZQS55fVRYRq0fKG2Y+NoIwure9ThKw4jNTdYqqMFCB1kGjVRS0Cqr/FO3eoulwFUnS6iPWShurkBmMAA3tWBFZY1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/Uh+wyylVdjbeX+zh6EIwRBAwtdJNEqW8o/Kesz8cM=;
 b=er7KKAEBqj6PN+5ekkQwUK/lviQxo4GdW3UnGGA78uTa/JI6LHHHrlO7smlRgAwVvfmf6hDDbh5rSV4zWULl/I/2UKehObYM6fFvcXeOJl8YCVNeeNRXihrGyK0r+tF1m/C4E8tBToGmMs7pD+kmGflrobMLY8TLfeZPslHmwXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <24e8dd35-114d-4ba8-aa92-dad7cbcbd37b@citrix.com>
Date: Fri, 20 Feb 2026 15:29:11 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/shadow: don't use #if in macro invocations
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <23951625-939c-4658-8146-84c1f12381d0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <23951625-939c-4658-8146-84c1f12381d0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0489.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::14) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA6PR03MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: deeb6049-9bb7-4575-228b-08de7094cde1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3B4OWJYRW0rNFc5aWpDeVdDUzFoYmg0d0JXWnJBbTZpNFdsbjY2MUx5WWxn?=
 =?utf-8?B?TGxWOTZvK3pIcWpMRkRhRlFYeGdPQnBNVUxvRFMveEd0OEo0UFE1ZnZieVhy?=
 =?utf-8?B?dWdROVhaM1BNbm1VTGQ0eU45ZjBXa0poR1Y5dXZMNUpDTjJYWk1rWHk3Y2Yv?=
 =?utf-8?B?d1o1MUpCOGY4b3pZai9qNFdNRElsbytIQk1XcldyaW45MGlSSm5YL2t5SWhF?=
 =?utf-8?B?RFJIMHBESlYydG83b00rNmt5ZkJhVGt3aWxuNUdVV1N4SDFIMU9Kc00wMnlM?=
 =?utf-8?B?MlE2blBIblFyRFFJbDdEMlViSHhtYmVCMXgxSkZNMHhGSkxBbExoVUJKK01B?=
 =?utf-8?B?dytscHdmZm9memNmSytjcEJiQmlUN0RGWEF3c3hJWEF6OHdWTWlBUXdZREVi?=
 =?utf-8?B?Q3lCeENTY09pV2MzMDU2WXE5UEhZTGRtakNTajFYelF2TEMrL3hKYkRHQ0sw?=
 =?utf-8?B?VFZjVndjdG4zTHZzSkVheFlSVyt5ZGhZOXBrTHBnY1hGS2dxRnFQNlRNZXNY?=
 =?utf-8?B?SGpnWFhaVEEySzhsT2RJZ3FPVThweEwyM2xQRWdUOVphaW8vL3pCTTgzS3FH?=
 =?utf-8?B?TmJ2WlpnTGtIYklJcjJLTURiOFYwSnRvTi9NY01Jc0M2a09lVkwxNXROWEtU?=
 =?utf-8?B?M2RKaWhSdEdWQXNjSGVoZU9oWmdVREl3dFlEMk9JRkQ4S1FzQ3NVaUNaVGFF?=
 =?utf-8?B?QWRwRWYzQndjVmRjUW9PbGR4V0ZWOWd5c214elQ0NHVHRFRaZFRDQ3Yza2lN?=
 =?utf-8?B?T3hTRGdqcVdXQVlhUEtZdlgvVlMrcXp0QVhDVkVGaWEzaERhNjUwaTh0ODJS?=
 =?utf-8?B?UitCZ2k0VDdCYUczcWQzcWg1WDE1czdxSk5mK3dWS001TmgwbTIwYThYNk1n?=
 =?utf-8?B?a08vRjNaV2FYbWVadDY2bC9lajFYR0lXOWlaTmY3NzI1WmE3TllDanR3R0hD?=
 =?utf-8?B?YzdlK2NrNDlxYmlGR2luM3BYNkE1VmtrU0JObnA3UTFiVU1oenFMMlBSaEto?=
 =?utf-8?B?T0F0aXRhaWR4WTZZbFdhUzhXRnQvWnhWeXVZeVZ3L2pXelRRTzkrTHpnSERh?=
 =?utf-8?B?NkVQVEcydzNZQnY3enFmZUwvSkozRDVWczIyQTJNc1EwQ1dNTFkwVG94ZTUr?=
 =?utf-8?B?eWRTVk01T2tWa2xVeTVqdGMrVTI0WS96T1h4TzJoQVBPTERZQTFoWEh6elVY?=
 =?utf-8?B?OXAwd0srQnUvbkdRdjZudWU4UVFhNG1hTGw3d1BjMmFDT2VGTG8vQ3pMeFk3?=
 =?utf-8?B?VktLNXd4eFdsSWNFZ3BaSWZlQ3E1V3pXMjFYNGJDb2g2N1RRcXovRFBORHVu?=
 =?utf-8?B?OHlIZDBZdk50SUFiR2V4eTQ4cEhZSlUyd3R5cXpsS08xSDJzSWlTZlBXRTZQ?=
 =?utf-8?B?QVl0cVpneVdNTUVhZkRuTmNWSnNmWjQrRHoxK2ViSkM1RDg5dWZsbC9JTXFS?=
 =?utf-8?B?Q214ajFQWE9oVXhndUw5anFqTjZKSEIzdzZLVDdZdUFxNm5ZczJGYlc2T2dy?=
 =?utf-8?B?THM4d0M0bDhWMGdOOGhwdGMrWW8vR3NGMmFhdTY5QlRCV0VYK0wvanpBcUsr?=
 =?utf-8?B?dlM3cXVUbDZmeWY0VDhQazMweW81dVAzcThnL1dVWm1HZkpEMFdXQm1JQ2pn?=
 =?utf-8?B?SFkyK1hTRHVKUGtGeXVoM0R1M3h2bTBJeFNrc3ltM3VGeTQxRFM3Vy9DanBM?=
 =?utf-8?B?YkQzZWFJcTlwSEMxN1ZWUmwyL01oeWh5MzlsbnljVHBtSWpLWXdOaTlVVWJ5?=
 =?utf-8?B?cXVWZWcyaVVObW9MQUkyM3llYlFzaWhzTkxjVEhnMytFeW9DNUdvMC8zU1BB?=
 =?utf-8?B?aFl5ZXhWWEdUQk9WWTR0T0NZNlV1UFBmaS83dHBNeHp4TG03SDRnQ1FuTnll?=
 =?utf-8?B?NjVJd2d0SHNkYXhraVZIS09la3p3NFpxaFJORkFWOXNlb2xMMW5kUEQyazRL?=
 =?utf-8?B?YmRwZVEyUGc4RFQwM3FiczB2bmk5RFduc2pOQkJuNXdrangxVlYxZi9KL1Nw?=
 =?utf-8?B?WmxUY1FxUGM2dktTWTl6SHl0Vm1NcTdaTHIyeXNtb3k0QzQxZTFWOXhXUUZO?=
 =?utf-8?B?b3U5OWZQVFNCU2hVSklDT0ZGbWsrR09mYzBMdWswWXkyR3M2UUJOMUptOFdy?=
 =?utf-8?Q?REQo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHBzZTN4N2M3b2RBSHBsWjVWb3hRSWVjUDBLaVk4S3k5ejA2VFJXaTdFRlp1?=
 =?utf-8?B?eGpwOXpGNjdOb1AwblNZOEdkTEV3bzB5T0Q5ZzhZT1FDZkRNTmR3YXhBRWJM?=
 =?utf-8?B?QnhLdExlUURscTcvOW1ka1IzQ21vVUlycjRTVytWV2EyVXZiSTZqbVpNd2tS?=
 =?utf-8?B?cEhrdVRzRVFEYjJSRDkyV1VJRVozSVdWSlpNdnRMN2hiSE10SUN3L0x5Tlh5?=
 =?utf-8?B?T3JSenRqd1ZIT2p1STQ4TnJTd2FaWnh6Rjk3aC9GbDJ5Y2cwblBBUDhFemlU?=
 =?utf-8?B?MlU0ZVlPaXh6YTNsclRUemZ6Z3dGNy9sNlppc2dqWFZuWHNwNVZ2eklVZ0c2?=
 =?utf-8?B?Mzl5YW9pZzBOSnZzcjFXMjhzc1F0S2JaNWJUY3lTWHF5NU5DdjlSdEdENGgx?=
 =?utf-8?B?N213Si9xSzNwaC9mWE5BYmRtd0xvWi9VTElpMTlCTUo5TTZwMnhONUVraDNr?=
 =?utf-8?B?Vi90RGZOL1Ivc3MxejE0eGJZbk5zNjl5RUsvaFErTHNvM085Zm5CaGQ3cGg4?=
 =?utf-8?B?K0Y3N0ppcDVyeGovUzZWT3J1UDRnaTFZT1NrZUw0QTZuWkxnY085TVdQVDRI?=
 =?utf-8?B?NjdNU2NKZzNjSWVmRUcySnBhL2pxZWNaSkc2Z2c2RDJTdk4xQTRHcDRITGlS?=
 =?utf-8?B?cnRyMU0wSElDZVFiOHU4Qng5Y0d5NThqbXpaTDVGTlUrMzUxRXV0UHBBOTBz?=
 =?utf-8?B?YWtrQ0ZzallHV0xMSlBsZTV0S2JoT082TVZHOUtQS21OMDEvTUZ2OUx4UUUv?=
 =?utf-8?B?VXVGL3B0QVRnT09CbmZkaHQwMjJFOENsT3pLMkFxMlBMRHVUS1pvbllkVUY4?=
 =?utf-8?B?WjQzUERPbWlSeUhzRXdncFpROG51UUVmVHhseGEwWWVTVnRnMXBsTU1uNlha?=
 =?utf-8?B?ZmNESEdnOVVTU1kyUzZuQlVSRFVVVXJjVTBOUUw5V3hpaTZWOExhOTBnUEZE?=
 =?utf-8?B?MHB4K1lJSy9MN0VOQkhJQVdhUTQwNEp5b29VUysrZkMyM0xGSE5wWkx5SENR?=
 =?utf-8?B?dVh6cUxSa2V3eDNqaHNwMHR3dk1BQmhzMXVQUGlYb3lUcE9ZbUtBOEwxenlC?=
 =?utf-8?B?MDFIUTlFTFkwa3RXK3Jnclo4eGFjbmNHZ0xnUkovME1UUEpZdFdsTVN5enht?=
 =?utf-8?B?TktBNUkwNEIzaC9LbnZyVmNLSzh6RVpmblhacXIzQVluRVluclJzRU9tTkdL?=
 =?utf-8?B?Z0x2Sm9JM3VHeFZVa21nemNjZVE0czVITVRZL1QzREJ6alB6SEhrNmp0Smdr?=
 =?utf-8?B?TGJCVjVWeUtKbEZhblhIdkJDZVYvbmpWNmJXYzdWODZ0YllHMlRsdEpJaXF0?=
 =?utf-8?B?OEx1TmVyZHRlUG5hVDlESnIwbE4vdDF5bS9BVW5ZdkVOVXNLSXNPNENHYnlR?=
 =?utf-8?B?T1VVRC8vRnhQbnAweS9yK1p3SENONitxMmZDNDFFYzFVVEFkNSsyZ2dWOENG?=
 =?utf-8?B?VHVVY0VubGlDREdUVWdzQmVvWGRpMDcvQ25uUUE0SStUYnZkY3QvNWE0aWZv?=
 =?utf-8?B?YVhtTE9QVUVUNFE4SklPdm0ydUQzVkdkQkI0S1o3MkN1a3JvTkxlak5CTWlM?=
 =?utf-8?B?cC9lc0pmYW0yME5hY3JyQXNvRFh5QkFaMzBEOE9NUTc3bU1NWGRzK3N5TWg2?=
 =?utf-8?B?Sno4WEduMVVTUTkxV1RXSi8rdW45S0tMNGVYSWgvd2hvRmNPQTd3M0FXRjR1?=
 =?utf-8?B?S1ZtajVOZ1BIRXhNQVlRN3BqRWExc2YzbzYyNit4RHlWWkM4bHlMTHdvZldJ?=
 =?utf-8?B?eFE2NjlacUVSSkMzSHBFbXlibnFyNzhDYU1FaHR0YTJydGtoWC8zNno4TDNl?=
 =?utf-8?B?WGRqOElHMjN5TWh2ZGtlalpOM0toVk1QdmV1cDdCYlJvWjBiZDg5L0tpbGJp?=
 =?utf-8?B?WEtMZy9YbC81MW0yUXlTa2FRbnY3NzNrUTduemRram1aUjhFMTZpM3laUGph?=
 =?utf-8?B?dno5aWFGRVBJQjRiWmFPL3pJb3N1eXJ5WDJ1TzBrZkF4TkR6d3FrckVuTjNO?=
 =?utf-8?B?TlZaYUlkdEtRck5XWjJUdjNsbmZLOWxtdEoreFdzbDVLeW5WUWpPTFY1c2Fo?=
 =?utf-8?B?M3Fxa2srZVNFNHFRR1hmWHV2VXI1a2pqK3h1MFRPWWpXZWQrWnoxU3JQZUdF?=
 =?utf-8?B?V01zU0ZhVjBuc3R5MFB2N3lZK0FVRkhSQSs3N3phT3psbGp5cGZqenMrQkdV?=
 =?utf-8?B?SUJXOG5UZ0ozK1JmK3UySk9LRHlHOGhOODVob2N0TkcvNHk1Y3JqWG9ORHla?=
 =?utf-8?B?N1M4SWNidEpNSU4vTk0xTUk0N3JHTnp4TlhXTTNuZXZWWjF1OFlwM2xnMnJX?=
 =?utf-8?B?UllZUEZkVktFRFB0L0dFUmpVSzZrOUVVMkJCRTVkNWdSVFZlQWE2UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deeb6049-9bb7-4575-228b-08de7094cde1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 15:29:14.5499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3g3LCgUPzl83RJKDSnsA/BD9qv05uA2pKTVRK3xPaLA87UAF0CwbaDkfhi0VHMC/ihjlBLWkxfyPiEdDbhleJRi7kdthdZNVCvN3Uegy3AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7831
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,suse.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 93D14168E62
X-Rspamd-Action: no action

On 18/02/2026 9:03 am, Jan Beulich wrote:
> As per the standard this is UB, i.e. we're building on a defacto extension
> in the compilers we use. Misra C:2012 rule 20.6 disallows this altogether,
> though. Use helper always-inline functions instead.
>
> In sh_audit_l1_table(), along with reducing the scope of "gfn", which now
> isn't used anymore by the if() side of the conditional, also reduce the
> scope of two other adjacent variables.
>
> For audit_magic() note that both which parameters are needed and what
> their types are is attributed to AUDIT_FAIL() accessing variables which
> aren't passed as arguments to it.
>
> No functional change intended. Of course codegen does change with this,
> first and foremost in register allocation.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I included this patch on an interim branch of other MISRA fixes of mine
to get a run.

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/13198988953

There's one more violation still to fix:

    if ( unlikely((level == 1)
                  && sh_mfn_is_a_page_table(target_mfn)
#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC )
                  /* Unless the page is out of sync and the guest is
                     writing to it. */
                  && !(mfn_oos_may_write(target_mfn)
                       && (ft == ft_demand_write))
#endif /* OOS */
                  ) )
        sflags &= ~_PAGE_RW;



I also looked at this one previously.  Making mfn_oos_may_write()
visible outside of SHOPT_OUT_OF_SYNC is quite invasive.

Here, I suggest dropping the unlikely() as the easiest fix.  It's almost
certainly useless anyway.

~Andrew

