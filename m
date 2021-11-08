Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFF7447E6A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 12:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223246.385884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2QS-0003v3-K4; Mon, 08 Nov 2021 11:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223246.385884; Mon, 08 Nov 2021 11:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2QS-0003sG-Gf; Mon, 08 Nov 2021 11:02:56 +0000
Received: by outflank-mailman (input) for mailman id 223246;
 Mon, 08 Nov 2021 11:02:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d70C=P3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mk2QQ-0003rV-Le
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 11:02:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69ce8fd4-4083-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 12:02:52 +0100 (CET)
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
X-Inumbo-ID: 69ce8fd4-4083-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636369372;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=08IV7wZiVn1+Tq07mi1G3WwhUIIwYfmGOl7SFCKpMn4=;
  b=Yl6Lm1kBXwBOox6/kJH1pw0+mPR2b/XsnUY7EWdTO0xCNTv3SuieTwHe
   ufQd/sZv++D8msChRBlPP6UdQ+l8iDfoMXtTpVyDwmjXFNTAgnkwFl31Q
   HzGmZrNh5L+T6Xh9M7ElnFqQcP8cQL+eFo22orNqr/56MFM6OBORcTLVD
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /an9u6BEEOUFEdXz/7dxME64kaQkOTfeSQ6JPPXeGASHbJwlzUOs6yTb/wF0VCLYGMIdMooFln
 HT2xDhKTZiZISVCPVa8YhZ27sSRTv8Y0KvMEm7p1R8o6cVIiw60lTTp3oatBfKwZj9F+eEICHO
 zYdggowLN6IJ6mDKDHw38lSNIGx6iZgKLkjWgxC7M9W514IW9e5y5BD5On1k6JfRXM6TLWHKG/
 DI6m9ME8cPFkBVPqOB5FnzniwW7l9ZoWvFVcRnfHDsJtPs6+tUlnSsjqi2Z0wk5Zq/wD0AKCFb
 u2iUoWeCO2nLmv693a0Y0S5h
X-SBRS: 5.1
X-MesageID: 57682510
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aUqO16wB55s5QVvGVS16t+f8wSrEfRIJ4+MujC+fZmUNrF6WrkVTz
 WMfWWiAPv3bNmr2c9t+OoW2/E5V68TSnNdjQQNvrCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrZp2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/twy
 NsVnLGRcDgOOvH0ueBEajpnMT4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIHgmdq25kWdRrYT
 886WXldPQuQWDpWJngKUKBije7yqVCqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQi3+EsEY1dvtpLMo+tDmszvPtwDm7GT1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpkuXFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARFodtfxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd6qW/0oif/IdAOvFmSwXuF1e5eKFfUj
 LL741sNtPe/wlPzNcebnL5d++x1lPO9RLwJp9jfb8ZUY4gZSeN01HoGWKJk5Ei0yBJEufhmY
 f+zKJ/wZV5HWfUP5GfnHI81jO50rh3SMEuOHPgXOTz8iuHADJNUIJ9YWGazghcRtvrc8VqEr
 4YGXyZIoj0GONDDjuDs2dd7BXgBLGQhBICwrMpSd+WZJRFhFn1nAPjUqY7NsaQ590iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:rMiZxKz7zRqbww3KK4oRKrPxtuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurAYccegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTEUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13zDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3e
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0IXEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fi1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqsq+SWnqLEwxg1MfguBFBh8Ib1K7qwk5y4OoOgFt7TBEJxBy/r1aop8CnKhNPaWsqd
 60dZiAr4s+PPP+W5gNc9vpcfHHeVAlfii8RV56AW6XXJ3vaEi94KIe3t0OlZWXkdozvd0PpK
 g=
X-IronPort-AV: E=Sophos;i="5.87,218,1631592000"; 
   d="scan'208";a="57682510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cX8U4yfmWKCJ2dHfaTDGF748Ltb0j4bFSEnK5vbb6Lg7yBuNPkTuHFr9h+tFAPfzveR1DuFWf+ZwtAqPkdDTt1v/O82xLPw0UVQjnBMH3MMV7MVVGv0oQ4mElBF6kkcOR0miw94HRmzgYvvSPgBRKdv3ifGXyE0bXeH7bD4sj+mWquM0xropNgQfUU0VNP61kKAq9ZkGwyS8eW+urITbSQdH83RutaBSffUpLMLSIvnPLqWOT4h4gNXduTQpODkUjeYt266vgYiYwoDsMWmctZP874X5CWMqXrYJs/zCkdoeiL44jLxuiVTJSgiPmw30Mf/w1T6xRcQuydd8S/0I2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX3OeACX5Fqjtedh1NCeUY4fRWwpMBz0D3U4t+oxVvU=;
 b=Q0Fgv/gxOfwKI5I1mfpR5WfHUH/a6Mx1T/crahAiZWrAButHAShg3PgvHteuYcvI4y2oDZD94+w9d04OEwB2xKXj5fflqZEAK6V5/ENOIe8yGjqk+T6R4z92QpNfUU9p9kQyYEaStSMUbr0Hp0pP1caIyXCGRqCm0Pj5dCsUFM+hXr4JDTS8xo23uBkDcV3AbOpaLJIuYkU5t3QmrYNS85S7H+yJU2I7Jpi7tbxjHeHDWT1/K1b20jk4IAPpq4iShQGOjTOFY4zRSl2zt1qPngBVYler6EPPx4ezoDveToqsHKchKYFnz/TCt9BqBshxOF9hK4JzhHxiQZBApnpN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sX3OeACX5Fqjtedh1NCeUY4fRWwpMBz0D3U4t+oxVvU=;
 b=sgV/1ZWjYKSpUIZFfsz3zU/JDaQx93GvBeuFbsJbLmL9I3Kwwv2dT05nuYwG6z/a2mAidwE4EN67lrugXWU6TjSFv2pVPoZ76tkTB0zbawgJhP8al/N1+Jrq0onicaP9/QqrigzlplylmNJ8utM/m+P77WGL80EiNZjo9OWLVd8=
Date: Mon, 8 Nov 2021 12:02:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/6] x86/APIC: drop clustered_apic_check() hook
Message-ID: <YYkD0J9xSno3aO0i@Air-de-Roger>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <7e2c8dd5-e20d-5678-1fad-1b79fd8e06e4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e2c8dd5-e20d-5678-1fad-1b79fd8e06e4@suse.com>
X-ClientProxiedBy: MR2P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 740504c2-654f-43f5-e35d-08d9a2a74c20
X-MS-TrafficTypeDiagnostic: DM5PR03MB3067:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3067A80528FEE93EF1B0B6518F919@DM5PR03MB3067.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0oQAkPG44idZ90dHJs/h+pDogVXL+xeRqVpqq4wz9ksq8hRKbZsN8e5ifDe3av7Oj/8JG0CIgDAqJ9VFJDdeCcj4gRKAaL7diHwwXdMEr3H0dplQVWJdW5e/esG7NkpRpZG1YRXKU2iHtVEroAW2ATimjPlR8W4mncgQuoZEpKS+p0X6SNiLlLHgPNBf3L/6jkIkUYKnNzTjLZxMR71XUl/o1dMYEGidZTZVXekvjKOxXM8LyCWJYFZrValkPNhDnnRVST7KVzWsjiHr1oBjbQDVW5ynfKdOXWlle4eB+qwL3V59uOrGjp8V+tFXg7swjDz/ZyrFb4uCCsO7IbOC80xRb4WmvP3FkqoTQwaMVPmQ1w6Dapf4KAhDLa22vS485GSUc9orTETB5vKJhKXjX/BtEmtLy4h4m1Ll200WyLxPlGmGIjh6AQjgIVNFwFcF3AMeMcH8y/mbKx6E/L1Qspmr/BxnhmuRvbH31QVZDF6h0kK1K9TQsrhI62Zh28sCg03tTHtzt1JX61fzD4P8djUBNt5S7xdIpgAB51MjrNzgML8Kd5JMhWuhQSWE6NCk6j52QuT5+j17878/ZEzcPuSS8xxA5JRDWpyhgWw8OSeOy0NKvGG6ESwHI3iORjnn1SUWEycyOSJlmkiBxOELYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(85182001)(26005)(6666004)(33716001)(86362001)(508600001)(38100700002)(82960400001)(6486002)(5660300002)(186003)(2906002)(9686003)(956004)(4326008)(316002)(8936002)(54906003)(6916009)(6496006)(8676002)(66946007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGdGUzAyT210U0NUNEJBOUVIUE1GampjalZxZm5Dc3NjdTE1YkpVMXk4QTh6?=
 =?utf-8?B?bXREVklWRVhwL0ovYmFQYTZnWllseDhTeS9RMXk1cG1GUkVRMk42eFRmb21v?=
 =?utf-8?B?Sk9oNTNtUnNrNzNYNUQxLzV6SzdOZHYrakQvQ1VFN2tnckRVdEVCVktUNUln?=
 =?utf-8?B?YlRnYm53dC9OMWlLc21TbGRlZ3c3a0RyMVBmNUhubWt1NzJ2Um5GSGQyV0NM?=
 =?utf-8?B?aE9Sa1JFRDNqK3BIWUZuKzJCaEFYSm45cldaMTF4NXpESXNPUDZTcCtsOCtH?=
 =?utf-8?B?TFc2MVZwNXJlS2M0dkNRZmZLWkhXeURTRUVxdEdFbjFTOW1TSkwxcVFGVXVy?=
 =?utf-8?B?VlF1MXlUV0RkSUJCM1FGbFc1Z1lQM1dqdG1UN1FBTG9makE4VUtJUkhmVEIx?=
 =?utf-8?B?MzU1R2dvQisvZ1FEcks1aFRvUFA2SHBPUVJHclRJUGxXT1VSWURSMVViK3Ba?=
 =?utf-8?B?QzNINFcrOUxMb01icUZUZ2MwM1RsckxNbzIzdG4xY2s3TmJ0eExIM295TUFp?=
 =?utf-8?B?WHRQbGxNaVNKbUtNMFpYQ3JsbTU5czRRWmFEczBnd0NaVXR6QlpaQWhJOU9D?=
 =?utf-8?B?RkZjbXh2MWFXTklJdUxvc3ljQ1MxbTFjRzRtMDFlZ2oyV0lQZyszcWRQZ1Zj?=
 =?utf-8?B?T1FzZWFRWkpVeDY5QXNNNDhtWEhlYkFFdWJlSS9Kbm11eUxUeHpOR2FqbnVQ?=
 =?utf-8?B?SVljTEVoeDlxOG5iRFpJRW9Nb2VpdmZValZheVM4RGNTL2xnQWdraGI5U2Ra?=
 =?utf-8?B?SDBWSUxxUktYQWFEMkVRZGxQeUUxWVpvcWpsOUFOQWdpdGVXM21PNTZ2aUxh?=
 =?utf-8?B?cDNiUGJhZjRkcG1vRnlYbngya3ZhT3IvczRMUGVRalN6YXlaeGkyU0orNkQx?=
 =?utf-8?B?TjFJMkcyKzl1VGpCejd5dk5lMlFxSDAzSExYUitNVDh3ZXBGbjZSQVJrWkdS?=
 =?utf-8?B?SlFRNU5Gc2NYeStab25BcHFFaTYveldXR0J4aGdCNW9zS3o2ZzlHTFUrbExC?=
 =?utf-8?B?VXB1emV5Z3JqRVNhVXVGZ0kxaTFaTXdydUthSlJiWnRSdjZxNklhQnF0Zjdy?=
 =?utf-8?B?d2RVbHdpYlNKTzAycWpueVhZUDR0OWxJSXNsam1tQVNNMmk0bUJUbTYxV3lw?=
 =?utf-8?B?eHY3byt5WS9YSStrQ2RqWHA3K21lQmtrak1mK053eXFRT3F4b3NCNDJUYk81?=
 =?utf-8?B?VHZGVnFFUEpxQzl2Q3pnaWRyS1ZQMDJlTlU5cTk3NXZBcHlEdlk4UDhia0hH?=
 =?utf-8?B?UitKT2FlSkNTVnJSYkpxVXM2WjNGQXlSRjF3OTZSTzJDY3JOdnY3S21HRVpX?=
 =?utf-8?B?YmFXTERLK1NiVFpMdmNFM0lIV0lDNE5yRFN6eHYzWjRoOVdqRjEyYzZzaXNC?=
 =?utf-8?B?YUxqV2hVYzViSXo2ZmVZMVhza2dXSDJ0S1VsRVc3MDFWTGF1MUJjOWVwQVZj?=
 =?utf-8?B?RGRIQ1VaZjNDUGcwR0R2WDJiN3QwUCt4bUQ0dVdjZ2FwQXVsY0V0OE15VUhC?=
 =?utf-8?B?V2hVcEs1d0dnbmdmMDdxTHpwalBaUFVUWGFJVk1CMTlqbGZFemE0bVBkVjdN?=
 =?utf-8?B?SkZtRVAza294ZVIrRm9CZ2o0RHJvRG1qbjVmWFdscktzdFRLemVuaS82NldH?=
 =?utf-8?B?NFBrV3JyUmtUNW5Rb1hpMXQveG4rNEc1RnE5Q0hNOGNRd1hBN1h5N25HeHF5?=
 =?utf-8?B?bytIa1dKNnhMamRHRmg4Z0ZnelY5WlUyVXVidkE4R20xMXlOYzdPWFRaU0Mz?=
 =?utf-8?B?RXNSR2VmOU1memNOc3ZkSjdQZE55cHRpckdyRURiNmtvOVZ1Qk9LeUJrKzVF?=
 =?utf-8?B?ZUlnRGhJVis1VG1YSjJ4QkQrek15L21JcGI1U01yUUVMbFYzK0w3b2NsZ2dr?=
 =?utf-8?B?c3VFSEhtWUY4TTFCcCt6SEw0bzE4dmhRVGxQZlBKNVMxZDlNVU80TUh4WEpv?=
 =?utf-8?B?Q21pQW5xZUcvZFdRVzlIU0d3cXcvUFEzdEt1V0hZNnBjVStGazl2ZVJ3UDJp?=
 =?utf-8?B?T09TcUxURklJWVd5b2M0a1ZxdzI1M252OEtEODl0M3FkNXlpTFRyQVVza0hS?=
 =?utf-8?B?c0taYUpzeXJwc2Zzd2l6bVB4dmdRUHIxYTlzQ0pSMXAwUXJyUzE1ZkZMT1M0?=
 =?utf-8?B?QllkalFuVml1cVp5MUxXNGhiTkJDQ3NxakRiZzFZc0w0NDRiTkVsMEhDaE1m?=
 =?utf-8?Q?ZsqMFFxb6KINYMJ5cYTEV1Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 740504c2-654f-43f5-e35d-08d9a2a74c20
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 11:02:47.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7R4AaS9xbNYai4SCOzCyC8YdFmDwk5cAwU/UDPX5C5RsqNfWLIXBlNpJjMbGfESFN7heF39BF9/mjweYmT/DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3067
X-OriginatorOrg: citrix.com

On Fri, Nov 05, 2021 at 01:34:12PM +0100, Jan Beulich wrote:
> The hook functions have been empty forever (x2APIC) or issuing merely a
> printk() for a long time (xAPIC). Since that printk() is (a) generally
> useful (i.e. also in the x2APIC case) and (b) would better only be
> issued once the final APIC driver to use was determined, move (and
> generalize) it into connect_bsp_APIC().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: New.
> 
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -674,9 +674,7 @@ static void __init acpi_process_madt(voi
>  			error = acpi_parse_madt_ioapic_entries();
>  			if (!error) {
>  				acpi_ioapic = true;
> -
>  				smp_found_config = true;
> -				clustered_apic_check();
>  			}
>  		}
>  		if (error == -EINVAL) {
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -243,6 +243,12 @@ void __init connect_bsp_APIC(void)
>          outb(0x70, 0x22);
>          outb(0x01, 0x23);
>      }
> +
> +    printk("Enabling APIC mode:  %s.  Using %d I/O APICs\n",

I don't think it makes sense to prefix APIC with 'x' or 'x2' here, as
we already print the APIC mode elsewhere?

> +           !INT_DEST_MODE ? "Physical"
> +                          : init_apic_ldr == init_apic_ldr_flat ? "Flat"
> +                                                                : "Clustered",
> +           nr_ioapics);
>      enable_apic_mode();

This also seem to be completely unneeded? I guess it would be cleaned
in a further patch.

Thanks, Roger.

