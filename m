Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +No2AHX7gmm6gAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:55:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673FAE2DBA
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220139.1528859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXj8-0007qy-8B; Wed, 04 Feb 2026 07:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220139.1528859; Wed, 04 Feb 2026 07:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXj8-0007oR-4V; Wed, 04 Feb 2026 07:55:06 +0000
Received: by outflank-mailman (input) for mailman id 1220139;
 Wed, 04 Feb 2026 07:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnXj6-0007oL-QO
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 07:55:04 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfe56119-019e-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 08:55:03 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA3PR03MB8256.namprd03.prod.outlook.com (2603:10b6:806:47e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 07:55:00 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 07:55:00 +0000
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
X-Inumbo-ID: cfe56119-019e-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evKamYEPRnMS5yELs5QPPiHTYK5h+TSDFR3B/F8xTFSz4K431C8W0mR5eD69qYwt7ABCGMytq879AQdxTvkoSIp2QfuoB/OazTG49ZINukE/9Ct6RwqefCpuv1WU5RNEdLThKo5GgiucieKPLxypJfKdQscLLfkyoVRumvVx4EzBVwfvsx6B4GOMMmkQXppTomn3rFjiWHNVXC3j/RmcQYxgZ2SimjOr/pC8xnGZN1mv5PFLozLqfGbQe/MnpLtAJIwzzcrH+xx9bvdsm/jbLBZg5/XWIWlIYl2920Hf8Bv8BTwSkfjjVhPB+6swpwaNFDpom24HqRB12M5GiGdgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks249Zi7djWc+6VzCGwZrAHh5eV8oFlenDYGBSus6qQ=;
 b=NkAF5sJjcMB3HHynDJAy0e+Rob9AbdrtJ2Dmk65jktERey9vgT0Xwtgs1jQqt77iwMTjtFSqBTbvvbWlN2UOE7ugEDYddA2OXnwedpnOccDO4zefhcK0uzTxLBzsa9p8QSrqJEc2YOqD50WG+R2DKqO4/Mj7a7lb4fCdw+CaIqhCgkczEROCUTpjGpqKWLEIAlk0fGgDmI3Ot1xWDUZ+XcCNH1nkgpA8nvgt54ddwIykpYgBJqYSAfHywhZGG0Qolw8zDjH2s9EJidYIpz/DX1kkAZBGbblaKejGjf289ze42rEhHXULL+MRRSDO1oN7kNCF79tDPIkJRpaUBfhtoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ks249Zi7djWc+6VzCGwZrAHh5eV8oFlenDYGBSus6qQ=;
 b=XkVmaL9vuHllJrG0W3j+j8wIugE+klPZvxOYWsQII+4hujAlGs+2kVcudXPXFoxON+zFEZnU8juwEfJ4DFlyKwAtSlZhYxgNWUf+Ne3aqp+EsudwD9dkeRBXbLzc5feI6PVwePNGmt4Q1VIVY/hNQnxFvwjR/hsWjzm2qN0bRN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 08:54:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/P2M: correct type use in p2m_put_gfn()
Message-ID: <aYL7UPA6X4xoBKjT@Mac.lan>
References: <1ecefc98-f1c2-4116-95bf-a86c3b066843@suse.com>
 <aYL2yt0g8HGdpOTA@Mac.lan>
 <40707659-0365-469d-ac29-2b558d423b24@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40707659-0365-469d-ac29-2b558d423b24@suse.com>
X-ClientProxiedBy: MA3P292CA0066.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA3PR03MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: b1103ae2-9f13-4279-bd57-08de63c2b28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0diQXdqdTRkcUZBbE1SM2lhd044Y2JudlhOdTNiaC93WVMwQ0VaNjltUjZH?=
 =?utf-8?B?TmRnMzdsdFprWUpyTXhKb05hbk4vRTNrZ2gvUkN3U3JJbnJ2WFVpRkEvWHE0?=
 =?utf-8?B?SndUeWZ4aDhYRWpkOXJIaGVhT1RQZEdHazVPWmpod0tnTERFT09QWUNmczV2?=
 =?utf-8?B?RXRsZ216QjVNK1Y4SU55Yk5KNFFEOFhRRFNabFZSY2RzWE5lTWVaVXV1L0F5?=
 =?utf-8?B?V0JlZnk0cDFsaGFFM2p4RlR6ZEQxWHJSbUUyNlJvbTlFVnFHcmhvUjVSd1pk?=
 =?utf-8?B?N3FTdlp6K005ZUVsaG1vWVVxY2dCSFo1SnVTeUNWV21Bdm1QMW92TEswZFMz?=
 =?utf-8?B?OXd4UWZoQWRsbXNvanJHM0NkamFZMitUaVBWQXp5ODMyQ1RLNXZxMmRDNGtO?=
 =?utf-8?B?ajBFNU5BR0pPZmorVkE1M3VJSE1aQTlvaHd3eFVvejBzZFRYSkhoWTFuZC80?=
 =?utf-8?B?eWEvMUdSaTQ5S1N1NTVRV1JldDlCTjdiaElRMGJxZ0tYeXBlNmhlazlBMnNs?=
 =?utf-8?B?cjVRMjM4ZCtFNWgvOVgzRVZJOXV4MFl6L0FuOFNYOXgwWGtJYzhiaVgxR3JM?=
 =?utf-8?B?WGprOUJ3cTJEUXI4N2xUZG5ObkhMTUR2WHlFMngvTDVZSXVCd2lZUnpkRnBl?=
 =?utf-8?B?Tk9kcWN2TlpObjdpZW1RdkltcERLbytzMFllM0NuZkp3emY4c2o4cTJBRnRI?=
 =?utf-8?B?MnRiMExydThqL21QeXlyQm5qVjNOdEM3a29pdGw2VW1UYmNBYnNHeU1ycWxW?=
 =?utf-8?B?d1FmdCs0b0pBSVJkRDR1b21KYjhNUGxrQ3p2SU10U0hocW5Vd3IrcmN6WG4r?=
 =?utf-8?B?cmJ0QWkvdHRLWnBtYnpxUStrcG9sbkdsNjd2RmRaRzFDQVpNcUtlVHFiTHlw?=
 =?utf-8?B?aXV3cEs3RGxOUEcrSmxETElJVXoxYVAybmYweUcrblpsK3JIK0VaN1AweEZj?=
 =?utf-8?B?OVNqOVBndzYwZGtmQTh3Z2JjYm9rZHJZVVRpeWkybDMwSkcvSW9mMVYxVmFZ?=
 =?utf-8?B?Sjk2ZDEvbG9DSzdXOG1FR2QyVDlxYjVXYThEMGxIZ1JLcElWYmt4Z0M5Q1lG?=
 =?utf-8?B?djNOdnkvc1phOWx2UWR2ZENQcGVBTHRoWWFGa3diWmxIMmJmd0UxY0NqdENC?=
 =?utf-8?B?STk2di81OHVWblV6UnpCY1k2NEZtNVpoSFpKRUM5ZjBNTHJxQkc4dGswcXRJ?=
 =?utf-8?B?WFlLK1d2VXZLZXFjRVNTNU5oYnZiSXdwMDFDc0NaR3FLaEg2NHRMa2xxNkpJ?=
 =?utf-8?B?UEhWYUZGVlNWaFhXYXJBdklNbHNTTU9rQlFXc0lYdVpYK1BUaldNdStJTXIw?=
 =?utf-8?B?QjlCenBLd3dZd2Y3M0dkakFQT0M3K0txemxManp2TE9XVWlYUW81Wk42aGx5?=
 =?utf-8?B?eEh1Q0FpSmQvYXpkek1HNG5lMEt0eE9BSGRHZUkrcTlhWWVqa1hWYm5oZWNC?=
 =?utf-8?B?VmtFOWZCRVFKZEdyeG9WSXpQeXh3bUdxYWNXZzNjZmp3RWNZR0x0cEFHZkxI?=
 =?utf-8?B?dWtqZ1hqb0Z6NmJBZzNXNVlMMXQ5QmRpSzkrL3JtNXpmV2NhZFBzODZoR3BT?=
 =?utf-8?B?UkVDbTB6dG9seERtUGlNaytEa1pXeFA1cXRiZEthWm5vUkRnY1JXYVphUEla?=
 =?utf-8?B?bXp6bXIxMnBvQkJQc2dQazJ0VktqU3FPVEtoaTkraG9OSk9PY1ExOWErTEFG?=
 =?utf-8?B?ZVNsSVlveHgxRWkxbDMvTDdBaTFKUXloanFVb0RlTCtUeVk1WGh0T0twalZM?=
 =?utf-8?B?QjFhbi93UXBxRUNOMitqcWxNZzdrYkZEZlljenl3dG82MHAyWi9GRU9FNG1E?=
 =?utf-8?B?Y3FLcnhXVzREcjRBeklaRlYwcCtiUDEweFBYczVETk1QL05PeW9zQjN3UUpl?=
 =?utf-8?B?ajRjYXIwcUtrQjBkVFFnSyt3d3hwUVdKUmFCR0RCd2Q2aFVVWkxyMGMzUU50?=
 =?utf-8?B?WVUvQVFRaEdFdk9nNDV0NndSc1Y5SUtQUTF6eGVrWFVOd1VSMDVPM01MelEv?=
 =?utf-8?B?clMwOUtZNlNtTVRscEozeEozaXNiK1lXZnl3OHVCaU1LSUk1amFDMXBWK2hY?=
 =?utf-8?B?UENXUXpnaHhGamJOWGFjOHoxdllqWlZ4bWJGaXJoVEIrNXY1NFVMVXNuUHJj?=
 =?utf-8?Q?/jYY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzcwSTQwcENHcVhmWnpWYy9IWW1GSVIzOUFXSEdUYy8yWi84TE5WaHY5aW43?=
 =?utf-8?B?MmZHeFVrbXNRYXh5MDRPTjkyVm5Qai9lWTIxdWxleitJRVBkT3R4WjNqRW0x?=
 =?utf-8?B?dWN1bzJaNTM3L2lmamFkMDlUVEU4Y3pYR3BpMGQzeUxBQkU2UjNGcU82UnFN?=
 =?utf-8?B?TmlhSnVkVzVVdWFZVnliYjk0M1QrdE9LWmRYSHFSUXdZRkVoTFNTV0wrZ245?=
 =?utf-8?B?ZFdXUkhsazJ0SnNKUjZwdXdhNUUvaUtIT3pvZDRoOFlEUUNyb1pXOE9MWVNa?=
 =?utf-8?B?RXoycTZ6T01YVTBGcWJEbXVaMTVPK09CSldYZW11RFhCM0k4QmRwa1BaUGxq?=
 =?utf-8?B?a3RaS2t6cmZTMXJJb1lzSzNiRTE0NjRTcGlzQWNBL1Y4K2YzRTcrOGdlcUtu?=
 =?utf-8?B?MCtWTlltVndDN1BvRitTaEZxWVFQSU9IaUtxNHZhcDRRZm85cWx4UWpwWnhI?=
 =?utf-8?B?UW5lQy9CMHdXbWg5cnJQV1phaExBdktEc216QzgrWVZFRm41QVYvTXphMFpP?=
 =?utf-8?B?YUNlN0tpbGkrMjJyV0pDZTBwSUkwK2lGNjZETFp0WXJlUGoxa3ZMOWVIMU1I?=
 =?utf-8?B?VkN2TXBsZzBTaW5ibXFqeTVRL01qeGFrU2VpKzRXQTNQTGlzZDhTOHV5ZUh6?=
 =?utf-8?B?QjBCVHViTGMwMUdvb29FT3RKT2lLUVBmZHc0SloyaGkwQjFtZkVWdkhZTXFX?=
 =?utf-8?B?R1FkUlNwS0hRck5NcHYxZmxtY0o5ckh3UlFGbysvdUJyL1lCRWp3NGRTMzJ6?=
 =?utf-8?B?U3BIVy9wUGxvTG1XNnlyUE9XM0hEUU54cXN4TXhiUG5GTm9XNDhxbXdoN0Jj?=
 =?utf-8?B?cUp0NHJSVnhJdWMvbitYUGJPVTRZMDRXZ09lYkJqVzV4azFMTGhjb2dXU3lX?=
 =?utf-8?B?cmlpcmFtTlRDU2lGdVE1VlNJSWQ3UWVXREkvUDFaaGlUdCs1TWVleGJmU0ZU?=
 =?utf-8?B?dGluUVJLc2lBMFdHbDJiRHhGcWJjRWhIS3JKL0N3ei9sZ0xJdnBGRUlMNmZi?=
 =?utf-8?B?VTRveXVVYUlDUktNc0FEdnYxb2s4M2lVdnBKSWdGWDlERTNjdU1VU0dnQm9M?=
 =?utf-8?B?a3BWL2tvc0NUNm90TFJLZ3VOSGlJb3RCbmpPUW5HNVorYTNIK09PdmhuT0J0?=
 =?utf-8?B?Rm9MK25CMmRRK2tXbzhIUjhjakhKa2J5My9jOFgvYXhtSVFJd25vYW5YTDYr?=
 =?utf-8?B?RVpKVTFLL3p0bzJ1YXpsOG1MWkxYM0lrOGFOU1poSld2Uk0vYTBPOFdNZndw?=
 =?utf-8?B?dUZIcGRlbmR4SWRQZkQwSGt6aTFtOFQ1bDdIQUNuZENJbHVmYnRlK2ZMREx4?=
 =?utf-8?B?WUJwS3BNcFZYY0xOMCtWS00yZkF6b2g4dmJaNU9hRXFEbjlmWmhOT0dvbTh0?=
 =?utf-8?B?L3JBdXY5Sm1BVW5sVmFQdkdVcnpUUkxnSzlPK3U5RmZNR1diTWtaVGdxdFJi?=
 =?utf-8?B?Q3I3U09UMGtMRmhxRDBjc1VnVVoybDJsY042WVBlNDNQYlUyKytTSGc3VDdy?=
 =?utf-8?B?WTRBa3V2RHJteXhwSGdzUUFoMk42ZXAveTQ4T0RsVGNsNmsxckdKNm42YzZJ?=
 =?utf-8?B?VFdvYjgwdnQwbVFDcWhDL3RldDJ1OStCQmNuU1pHYzh0TGJxaGZ5UFdvem0y?=
 =?utf-8?B?dzJuRENVYXFhUVZyanhHMU1ORUpNVXNRbUplYm9iR2VDTTlkZmROc1gxOU5l?=
 =?utf-8?B?b3NSbEpwL2p1MXpzVmdWL2MwQ2lHeDhaYjFWTnFCdmZqU2ZWVlNLcy9xZVlp?=
 =?utf-8?B?U1Q3Q3RGcjhpbHV0WTJSZjN1YkJMVEJQcUpwVFNkakQ1dnZ2dHU5ZFRQOHdY?=
 =?utf-8?B?anVJb3JRUzJ5d05yOWE0QUNOcjNiOUhKa3FLbFJjMmZkZkxVU3JvMVp6cXQz?=
 =?utf-8?B?WFFLQXpyblU4Y2h1blYwNDQzb2kzbkkwSVRaRDI3OHNZSW5YckpXS1FOUWhD?=
 =?utf-8?B?WjFrZmdKdkUzY2ZRTXRqdHhPcE1lMXFocnpwN0xhRC9VSWlkYlY0T1ErVTdE?=
 =?utf-8?B?eG9vRUhncHllOHJycXhLaHFCMm4ySVhiRUh3R0o1YmdIelRSM3NmbWtyblhQ?=
 =?utf-8?B?MHdCbWFNMXE0T3hSK0VYS0d6RFJoQTZvbko4M1ZjN3VDRE9IWnVsbzdBK05u?=
 =?utf-8?B?M21pcGFJL2VYOGJlVzJwdllsZ0lJd1l1YTArL1oxcVZ6MmZuK0lvdmgzNDFo?=
 =?utf-8?B?SGZMUWRmZEZSbEJqdWV1ZG1HcnQ4Rm9WcnRtbENRYmp2N0pnUUdhcWdWMERi?=
 =?utf-8?B?TFl4YXo2UXJOQW03L3p5bmdiRGJXOXQ1Y2JYZmxBNXlUZjVRVDAvbEFIWXVt?=
 =?utf-8?B?MEt1VHZuTGhaMDJNQnNocjdKZi80djdRNzVDbDlPWWdpQWZZK0ttZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1103ae2-9f13-4279-bd57-08de63c2b28d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 07:55:00.5576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIqpoFc7dqE9+2hvV08PCI82zi9hyJb1HFLvXvr/KykyVPbVUGzpazyKk/ZEIHO8GSSwb70jtxq+b79X4vg3tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8256
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 673FAE2DBA
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 08:49:53AM +0100, Jan Beulich wrote:
> On 04.02.2026 08:35, Roger Pau Monné wrote:
> > On Tue, Feb 03, 2026 at 03:01:27PM +0100, Jan Beulich wrote:
> >> Everywhere else gfn_t are passed into respective GFN locking macros: Do so
> >> here as well.
> >>
> >> Amends: 819cdc5a7301 ("x86/p2m: re-arrange {,__}put_gfn()")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> Easy to spot by adding ASSERT(!gfn_eq(g, INVALID_GFN)) to the respective
> >> macros. While imo that should be a correct thing to do (as with
> >> hypothetical split locks a valid GFN would really need passing in, in
> >> order to be able to figure out which lock to use), we can't do so right
> >> now: The lock is acquired ahead of respective checking in a number of
> >> places, e.g. in p2m_get_gfn_type_access().
> > 
> > Could we convert those macros into static inlines?  It's dangerous to
> > use macros like those when the parameters are dropped, as the
> > parameter is not evaluated at all.
> 
> It is. Seeing how the header is used, converting may be possible. There's
> one slight concern I'd have with doing so: It would move us one step
> closer to giving the impression that the arguments passed are correct at
> all use sites (while as long as they're entirely ignored, that's kind of
> a hint that they may need checking). I can't point at it right now, but
> I'm pretty sure I had come across at least one place where they're pretty
> clearly wrong.

Well, having at least the type check is better than not checking
anything at all.  By clearly wrong you mean passing INVALID_GFN, or a
random GFN that had something do to with the context?

Thanks, Roger.

