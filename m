Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCh5Mgu0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830E4481D9
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209031.1521157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCST-0001nX-L6; Tue, 20 Jan 2026 14:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209031.1521157; Tue, 20 Jan 2026 14:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCST-0001mI-H3; Tue, 20 Jan 2026 14:11:49 +0000
Received: by outflank-mailman (input) for mailman id 1209031;
 Tue, 20 Jan 2026 14:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h83G=7Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viCSR-0001mC-Sp
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 14:11:47 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3f16e0a-f609-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 15:11:46 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5632.namprd03.prod.outlook.com (2603:10b6:a03:28a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 14:11:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 14:11:43 +0000
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
X-Inumbo-ID: f3f16e0a-f609-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxQWjVuQ6tLqRm7+bVKHzFjwW5rmNIXlHHKCHh0o3edmdjiSwsWHDkOeYIuHHZB093oVirdBfqkhkp9nr4fRkhJfXR1vvnaWWeIbeA9nTH2LITArRs7XNzmRkadik/02Q2tNWXL6cM3aRRPmq6p4XzXyu4ENF8MQEJpUVjR8lzJVdW3hm72VjsIlbuO4tjU6bmPDTwygNxJvB/8xc2N2crhO52eai/B5dm303xWE78Zc7Z80fnf5oN+qoR6FivJbGIxoEpVBRVCAQcHXq7kANQb4ksbx8ROX4zALgG5F1tpm09jQcmDoOZP108LkbDYmJ2gJEtM5QQL+RTD/oGt1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4S9DL7+9HUcvOJXrLiFOh5eTvIEQMG+V35wWBjoTjLc=;
 b=BjLijTN2jI7NOOUfmFGxTmLgh3iQgYvwVDOly2dpNduBLBBPvoq2KPZmqVuTk0kyWT0FuNt4v/UMQ0bWLkCJ6U+VuY4TSQ5Mxsk3lVJgHzKacz9+5pM0ATIep6/Orsil/2G0x0gmtOndW7ECniiv/t9xU2/dURX5B3qzM+vhcRfXRPBAF90rsM7p5YDi62+IrJtnQJgtroGorZCaX3mvIfxBbipFKP1Kk1CX7lESE8Hr23M1c1sEj4AxfrA0NJC1d7Cza7i8dxzJxKiWeNNL5hhnU1UoA1dsNkdERaRwVZ3yVuUrGHfx34AJ7R71j+FkOYpiKTtBMrWRcMepVCq1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4S9DL7+9HUcvOJXrLiFOh5eTvIEQMG+V35wWBjoTjLc=;
 b=AdfffHJ32ebj08wbSH5EA02bUEmeU9XK/Bsb4WCGuAZJKsN9PKIAwuk9XoIAUExx8uNgTuIpfZgcW293LP7Rce3d7uhZQIoef67UVtVC83wIXpBsxnHjB4puEhgcHAPwR4IHSZFA3S3Iw6xb7t1RYhRu/Hri5F2xFJ8Ec5h1FKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ced1c404-6170-4275-b0e3-be851bf03c3d@citrix.com>
Date: Tue, 20 Jan 2026 14:11:40 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] x86/svm: Intercept Bus Locks for HVM guests
To: Jan Beulich <jbeulich@suse.com>
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
 <5a4aa1d9-dafb-453c-bd4c-8da860519f01@citrix.com>
 <00f36b33-65d5-4681-84d5-e1b2cbd8830d@suse.com>
 <b8df289c-a770-4186-b922-dbfba1bbbfc6@citrix.com>
 <b92c9a26-dd84-4298-adcb-5b1066e2174f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b92c9a26-dd84-4298-adcb-5b1066e2174f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: cad7a916-dc2f-4da0-9a39-08de582dd6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3JpQm9leGF5d1lyMDJ5enUzN2VNTFFLaTJLL1lBMnh4RXNwZXpRUVBBeTds?=
 =?utf-8?B?TzJodHllNUZGLy9CMzdKaFRETkdtZmxqYUxGZmc0bVlWaUVRVFordDdGdE00?=
 =?utf-8?B?RDI3TTlJYk5OT0MrV2czWGNlSHRSSzF2TnQzYm43ZktRclpQTWxhVjk1Z05M?=
 =?utf-8?B?VW1YbC9Ha3prZFg1ZTdqdXJhcG56YWFoV2ZCbWVibkRJNUlNSHI3TU5rVFBM?=
 =?utf-8?B?SVJRYU9ZNEJhMnBwYUxMVzc2RDk3eEx1V0EwSkVucEo0TFNleEhVZHNodElH?=
 =?utf-8?B?UGhjcTJ4a2RIWHNISnk4d1BUdnErY3hpMnc3ekV5bk5wQ1U5dkNZTGw4cDVS?=
 =?utf-8?B?YURDZXc4aXVKYy9CQ3ZtaXlMaU5zbG1NVjJTL3VmY29pYzk0bjlBUE5RRURk?=
 =?utf-8?B?dXRWMkR3RlhFMDV5MEFaRW4yVHBBcGZJQnpjRDEvcHFuVlpaUWpwNk5yd3A1?=
 =?utf-8?B?c2JkalAzRmRXN3RiMVVnOFJNNUV1MEc4VmhTUTdwSVZQaW1hYmJYSlpsMHo0?=
 =?utf-8?B?ODdnSUk1QlNGTEIvWlNXcXZ2aW45eVhuaG03OHZJcXZYNFhqT1VMc0V2Rnp6?=
 =?utf-8?B?RjJRZzJYZHFzMnIzWXJtOWxjUnIwOTdNY29KaWk5SytjT1hzcmJDUlp6Vnhm?=
 =?utf-8?B?bmVBL2x0SUk0QmFuekUzRU5jdSszYjVPdENoT2dPaFhYTzVTOTE5OVYxRnFj?=
 =?utf-8?B?eFlxUC90a3NXVkZXY2N2OFgrd2VKRFJHSEQ3cER2bDhaeWlrRk9GN0VxRWRo?=
 =?utf-8?B?MjdxV1ZFRm93Qis0bkhXK2R5R3h6UjM1T0ViRXVzWHFmZjFQSXJ3ek11ME5H?=
 =?utf-8?B?TGhaZUlkN1hkZTBiT2FPeWdydi9uM3NUemROem1KcWFvSldLeG8zR1cxT2hR?=
 =?utf-8?B?dXdSbXdpNmQ2NFNRU0pyWjJmZkxCUmwwa1d5WjNjWlk5RW5adEdTdXFnWHFW?=
 =?utf-8?B?UFMzK1g5R3BVcll1Q3V2WjZrVGlrMlFNV1IzenZtcWFlNUJtSCtxYUVFRmFy?=
 =?utf-8?B?V3RLTzlQeHBBV2V5eUhJUHBlQlU1ZEpNRUx1Q1d4bm84STc1TlhLOG9oN2t6?=
 =?utf-8?B?eTNaUkUvb1RNVjJjNEhlRnY4UnFROWVEaS9tTlZaVmc1cGE2TVdRUXM1RmxR?=
 =?utf-8?B?SmdvaHh3MWIvUU1BN3p1d1lGSnUyNDVaWVhKOGNEZUl4cnFIc1NDMDliRmhV?=
 =?utf-8?B?SWI4eWFjZEpWNlJjYzRZaUFpSEpGZW52a1BHODhaL2MwbXdEL3RRcDEwa3A4?=
 =?utf-8?B?aVJaU21oUElYM1JNaU52cDRGZzJzeDBmdHJabFZRc2lLZS9TeVdCNTBLR3Vk?=
 =?utf-8?B?eEZPUTQzU2cxR3Q2aUI2YU9USkNnRno0V2lScE0vYkJzRmMyQk9nSC93amta?=
 =?utf-8?B?KyszREx3azQ3TnNUdlhHWlpsQ1NoaW9oMUZqMlF5MzlnbXZqeGtORW9Jc2s5?=
 =?utf-8?B?aGxRTWxub3QxbWg0QmgzcHZiemFsTjE0T3F6clQwS1dwaFlhNXJ5KzRiZ0F4?=
 =?utf-8?B?TlJhcDNPTmhRN2xLaEh2MElGRFJTRmY2WnBJQXAxeGd1OE5xNU9SS0tZOGpV?=
 =?utf-8?B?UUluSmZ0NjJnSXg1RzhCZjhUc3NqRXJ1VVlpbVFjbE1UMk54SFhIUWZDMHVh?=
 =?utf-8?B?dVZpVW51Y3JhclpMK0cvTDJ6dWlwRml0Y09WaEFWV2JnU05kRHhTdkIzbHFN?=
 =?utf-8?B?Z3ZiR3dvSTlxNGE4UUFLWmZRZ0d3YXBKaXpDcDFmdmFrbEo5d05VUm1iUGwr?=
 =?utf-8?B?dUhscTdiUkd3QnBGM0RDNTk1VG5KdjZRenJaeVVTT2dtTWNhS2dGRnBXUkdY?=
 =?utf-8?B?L0lCU0x2MmtYSGFRQzVLbXd3dGdOY2dVek9SUGtqaDJ3UWkyQ3hFZmhOQkx5?=
 =?utf-8?B?d2hHOXhRNS9lMjJSRU04QmlDUVNzWVgyYVlidWVzK2NmVWtiQ1dHY3BBTnh0?=
 =?utf-8?B?UCs2ZEpIUEVzQ09wVmh4RXFqaXVqa0ROY0t0NkVNWEtGbjBRZHhGOVVycmR3?=
 =?utf-8?B?MHhUa2xrTEVpUUNyblZrcHM5Y0xKN01RZWlSQWpSbEt0eDZYMnA1TFRnVHlW?=
 =?utf-8?B?MVJoY29HQlJUTUZ2L1V4ZngzdGhzM1hZdjJWeGl3TmN4S0R3NmpEdS81dDZP?=
 =?utf-8?Q?tO+s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjQzbjNxWi85VUp4cmFVTVR6N1owRU9JNFFJQ0dNUVhIRkRaOVZqL2FZTndt?=
 =?utf-8?B?M2FqbW5HYUszZERNYm1iVisrQUthYm05U2dQU0F2akxnc2k2TjJLQlFVcXJx?=
 =?utf-8?B?MTBLdWF5QTg3dGsrR2ZBY1kyb2pYbFI0aDR2dDBaYk1keXVTTkhzRC84Y05D?=
 =?utf-8?B?anVzWEoxN21UNHovZmtnOG0rRVc0azhVSHBDWlhLbWRKaEw0eVlSYVkzd0or?=
 =?utf-8?B?WElhQS9tRUc2ekk1STN4cko4emVUdExmd2UvdWhjeW9zdGxBbTU4Z2x1T3RK?=
 =?utf-8?B?NUF5RmpURzk3a1VHS2VxM0RqZk1IN1MwRVorU2NDOUtpdThVSDNPRWtZVERo?=
 =?utf-8?B?VjV1OEZwVld5cGM2NlpWTy9aaHRic1pvTXBsMUlzUXZuK2p6YmdOcXc3KzU2?=
 =?utf-8?B?bjJnMFlCcVVGSWp2T1RSM290NzcwREdOd0JBUnZabE1tOEV2ZkNEUzJIbFVs?=
 =?utf-8?B?VWNCZmtmSzNra2wwbXV2RktoZjdDcUFtTlR1QW52SkpWa3A5OE9GcmNHS29y?=
 =?utf-8?B?WWRIRzVmbllSQmY2SFp5bDdsT3RmRjNEb1ZIczVoWXA2WlBjNDJBYmZ2OFho?=
 =?utf-8?B?REZWd1NoN04zY2xxSkd2UThuOHZ4T0oxdXBlaEFMM3I1NXRMUXRiS2hCMGFJ?=
 =?utf-8?B?TjU5MGo1R1J2M1NvVCtJdndxSVdFQ05udFFZcmFwUWMySWtsQSsvOUlOM3FJ?=
 =?utf-8?B?SytPenhKN2xxdk96bmVmK2EzVlZEeDlPclIwMXJSS0d3dHVMbUhUaW5GMC9w?=
 =?utf-8?B?OGZTTngvQmJ0VlpoSHN5TVcrN1U2amZWZVFHaU16M2ZRMmFIYk9tQTJ2Yzh6?=
 =?utf-8?B?azFXek5vUmZTOVFWbGFiM3h6c216YkEwT3pjTXJKWVVOVkdDQ2tBUkJpUmp1?=
 =?utf-8?B?QkZkNi9VRGltOUpuWU1Md09JbjE5NVJUUXlhKzF3Vnh6ZHR5UWRqZHV1UDJI?=
 =?utf-8?B?c2UyLzRmU01BcjEzVzdFUFpqRUJFSWFzOElYOUo4UzVBSm5FeFRZNEZuU0dE?=
 =?utf-8?B?NlRMVnd6QTJNTVhBS0hSWUhlbzhnUnhjTklqZG1uTTVxUWsrOENsY2NIcVda?=
 =?utf-8?B?cDB3YWtGQmxwbk92WE11Rmx6bGVuZkliSU9IMUd1YW5wWGUzUUY1bWVCN3lG?=
 =?utf-8?B?UStMVTFtL1EwMVZnUWE3bFJWZ3dpTFRZODlDTTdMbDZnRTd6dm5SY3plOWhS?=
 =?utf-8?B?eU9ZVEY2ZGV6ci9icGU0ak9zWk1reHBkV3N1bHZHcG5EdzNNQi95YmFjSSty?=
 =?utf-8?B?aHZPVlJXR1RYRFVZWm1MOGIvbDlBUklpUDJYeTZxUjdpamNQcm1PdUhqU0JD?=
 =?utf-8?B?ZjFRVXRoT2JHYXVyYjFkanUra0RHbzdQMllveG5ueUR4QzFMMnllWldBWnBn?=
 =?utf-8?B?VUJzQStTNFM0MWl2TlVqMFFpQlZibCtQdGFrZURoUUQ1d2t3OWhmTHhiYWlM?=
 =?utf-8?B?dUNOaEk3eUZ3Q2NRczFQS0ZEVTYrSWZJakxnckxxcVk4aU5aUlRNd08ySzVj?=
 =?utf-8?B?bmVtTEtYQTFRQ282UkpnaE0yTldnb2F5cks1ZWkyaS9ML2xRMzJDVGoyVHZk?=
 =?utf-8?B?WCtTMUdYdHZQWnhlKzJiZE9pZ2VJME1qWFlKWG9XajBpUW52cFZUR1hGVTlo?=
 =?utf-8?B?eGZITmRMRWtoRlN4dUJLaDk4UXVwRTVJSXFMYUliWWdML1BkNkdZTmY3Umth?=
 =?utf-8?B?QzNxNkZVcFhCdFNHSkNJZTZMTjNkazNpdmU0SWp4d3psbGluU3B4WlFJaGdr?=
 =?utf-8?B?Z1dIN0dySEpncFRaVXdQb0pzd0hJMENnaE1HMTNqVW1nVmhKZUxnYU9TTHNi?=
 =?utf-8?B?YmgrczhxdjNBRXpob2tOTEppUHBUUkdqeG9qVTVBWFFEbjA1U2NTdndjZ2VT?=
 =?utf-8?B?a1JneVVRQTBDUnRncVZzNFVjd1VuT21pUmJCZUduMXptM3ZwRUl6NTVuRDhP?=
 =?utf-8?B?TmFTZ1lYVVJ3S2hlL1lRRVlua04yaGlEZUtjeUx6K3hHUnBoMXVLanE2Y1ZL?=
 =?utf-8?B?LzRPSWE0YTV0T20rUXlGZ0hhT1dEQjZGRklrQUYvZ3RtdVMyWDhHb0J6Qmkz?=
 =?utf-8?B?RzhLUVE5ZnRvT2ZYdllwcm5KT3lFeVhYK0FMV3ovbHJBTFJZRlI2bDN3dVlW?=
 =?utf-8?B?R2U4Yml5K1Fib3h2VjBqanAzZWhvYldEUE1RSGJOY21LdUtyenlGb0VoVytn?=
 =?utf-8?B?cEVnWFVGVFpzblEwSjFQMHh0YWc1alFoN0FpZi9rWXJrV3RBQW4ydFFBYTIw?=
 =?utf-8?B?WUlmZ3J3TWxienZjTVVhcG1GOGt4dlBRcTZrcnNFMElEUUl5MlBrd2tjOTY2?=
 =?utf-8?B?MjlyR3BEQ1p4ZmszZDNaWU9jRGFyUEdndytDS0xEcElCQkpiQ1NXQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad7a916-dc2f-4da0-9a39-08de582dd6b7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 14:11:43.3083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MW1Sdd7taQ89oung0tfBOqnHA59yAd5ZyxZmOdNIKsqYUyds1xRxILtXun72usfJI49lUj8MoIic7eL1XX7e+byse781J3cELsibvc5tko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5632
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:jbeulich@suse.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 830E4481D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 1:34 pm, Jan Beulich wrote:
> On 20.01.2026 14:29, Andrew Cooper wrote:
>> On 20/01/2026 1:27 pm, Jan Beulich wrote:
>>> On 20.01.2026 14:18, Andrew Cooper wrote:
>>>> On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
>>>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>>>> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>>>>>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
>>>>>          GENERAL2_INTERCEPT_RDPRU;
>>>>>  
>>>>> +    if ( cpu_has_bus_lock_thresh )
>>>>> +    {
>>>>> +        vmcb->_general3_intercepts = GENERAL3_INTERCEPT_BUS_LOCK_THRESH;
>>>> |=
>>>>
>>>>> +        vmcb->bus_lock_thresh = 1; /* trigger immediately */
>>>> Really?  The APM states:
>>>>
>>>> On processors that support Bus Lock Threshold (indicated by CPUID
>>>> Fn8000_000A_EDX[29] BusLockThreshold=1), the VMCB provides a Bus Lock
>>>> Threshold enable bit and an unsigned 16-bit Bus Lock Threshold count. On
>>>> VMRUN, this value is loaded into an internal count register. Before the
>>>> processor executes a bus lock in the guest, it checks the value of this
>>>> register. If the value is greater than 0, the processor executes the bus
>>>> lock successfully and decrements the count. If the value is 0, the bus
>>>> lock is not executed and a #VMEXIT to the VMM is taken.
>>>>
>>>> So according to the APM, setting the count to 1 will permit one bus lock
>>>> then exit (fault style) immediately before the next.  This also says
>>>> that a count of 0 is a legal state.
>>> But then you'd livelock the guest as soon as it uses a bus lock. Are you
>>> suggesting to set to 1 in response to a bus lock exit, and keep at 0 at
>>> all other times?
>> I should have been clearer.  I'm complaining at the "trigger
>> immediately" comment, because I don't think that's a correct statement
>> of how hardware behaves.
> In turn I should have looked at the patch itself before commenting. The
> other setting to 1 is what makes sense, and what ought to prevent a
> livelock. The one here indeed raises questions.

Setting it to 1 here is fine.  This is the constructor for VMCBs, and
*something* needs to make the state consistent with the setting we chose
at runtime.

~Andrew

