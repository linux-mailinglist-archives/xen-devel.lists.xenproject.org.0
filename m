Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6FA6EF604
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 16:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526722.818628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prfpW-0001xB-JI; Wed, 26 Apr 2023 14:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526722.818628; Wed, 26 Apr 2023 14:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prfpW-0001to-GQ; Wed, 26 Apr 2023 14:09:10 +0000
Received: by outflank-mailman (input) for mailman id 526722;
 Wed, 26 Apr 2023 14:09:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldec=AR=citrix.com=prvs=473a90206=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1prfpV-0001ti-6j
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 14:09:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6eedcf1-e43b-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 16:09:06 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 10:09:02 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN7PR03MB7274.namprd03.prod.outlook.com (2603:10b6:806:2de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 14:09:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 14:09:00 +0000
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
X-Inumbo-ID: e6eedcf1-e43b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682518146;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QAIzhBizAEn3A6H1xGh0lOJhiJJLg1iOQ+Q14zLMrLs=;
  b=JQfXHSLrHf7OR+UVCOkYsRmdRPDIxbckXef2umVYXkZteWOx7hWmn+Dp
   MmjCFHSV2zUoxg+txyfKZIdsPAHhRgRog6xqZ66NJzrwvQ6KFu1+Ekkf4
   tSo03Y/fUZcEDvBSpRR4422sFqI/hiPbSgQfYdisVKJe9hfVcT1dITuFI
   U=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 106828060
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:za65DqzsB/rQ9yPby1F6t+ehxyrEfRIJ4+MujC+fZmUNrF6WrkUDy
 WJLWG6BM6uMNjH2c99xa9/k9U1U6JLUyIdmSgZupCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiP64T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU5Vy
 s0XLyBdUhmko6WN5a2UV/NC3+12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQtuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiANxCTu3gqKYCbFu7xU4wUSYIUWuBneSBuHaFa5FWF
 lEU0397xUQ13AnxJjXnZDW8vXWN+BAVXdFdF+knwAiXz+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8pz6oJTIcK2NEYCYeVBYE+PHquoR1hRXKJv58Ha/zhd34Hxn52
 TXMpy87750Rh8MW06Sw/Xjcnimh4JPOS2Yd5BjTX2+jxhN0YsiifYPAwUPA8f9KIYKdT1+Al
 HsJgc6T6KYJF57lvDOJaPUAGveu/fntDdHHqVtmHp1k/TLy/XemJNhU+GsnfBsvNdsYczj0Z
 kOVoRlW+JJYIHqta+lwfp61DMMpi6PnELwJS8zpUzaHWbApHCfvwc2kTRf4M7zF+KT0rZwCB
 A==
IronPort-HdrOrdr: A9a23:UNjsjqwpmFdQMfXspgg5KrPwAr1zdoMgy1knxilNoERuA6ulf8
 DHppsmPGzP+VAssRAb6Kq90ca7MBDhHPJOjLX5eI3SODUO21HYUb2Kj7GSoQEIcheWnoU26U
 4jSdkaNDSaNzZHZLPBgDVQZOxA/DDoysyVbKzlvg5QpElRGtldBilCe32mLnE=
X-Talos-CUID: 9a23:sI2SZ2FaEVPgf6g3qmJI73ElFcc1IkHU61OXGGqnJntzZuS8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AEpihgAzdtB99cgysYJnr9T6NZMWaqKeMKxk2j5E?=
 =?us-ascii?q?2gfWZDR5IAAfehQmqQqZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,228,1677560400"; 
   d="scan'208";a="106828060"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oK7lXgUcsQd07IcfYgaT/Ko0BFYGGY8sG3LqlgwGgnlGucpznaVaRPlT5HsG6bDdWmvx5qMwlZ9DhePo+0Ct90F1ZMQrG4NjOqvApaf9RvaoE2Tfm3JVYhoI3+RYPOZf4jrx0zfl6zYlKB6mfh3XM5gALcDwSeiMVLQoHhOI32vpeaXdJUFKEe8XxLq+r1VJ166KUt59EehRxtgS45X+ZFFiBGyZ6dNmRGe4hbHf6tF+zI2fTZzcHMBPE+H28XzTLbhsN4tSYDinLLgfR8ctM9iZYj7amaN8SPVIloSgn5SDCIAmmsv4qWG0/SHuEkqKghYyLEv3avauoX1G5ceytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIsfvn7vHUmyaygHz/bYx2AUse3OvQ/Ew7Xno2+dzY8=;
 b=N60K+fIB10EDB7L+0Aarl8oar6eR8NwdY2xvt6SHhbdfbG3IvdOa+uTLSUijAGoUASZYTdyf2DmhE1UD7JW4T0hHj06jh4FAnqsxzMoA6tYpKLTM8Lz3LP3VWmkMs2esKgyfGtsFryj3I6BW4CuTmOl+x+J1AgqN6Y8GbA2lXtrw6B4CcPWAIlXGtBB1QXfwqlOA6ET8HoWhTzWEcixGSsKeBsFPuwoHM560yJFzvTWNH/nnmZO1Q0YAyRQF0Y6Ym1vr7loQjTU5UW7gPL4j3mHBTVbRR/jO/iNI1WTUkaE+gsr8bMso17HuxClNjbfW03CapvjtJ+7QzSO9dX8zXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIsfvn7vHUmyaygHz/bYx2AUse3OvQ/Ew7Xno2+dzY8=;
 b=L7yuPjF51F+7s7KHUb5njFeD9TdSJ/Uu40tsFQaTxwZQUZvCjXQVMkygsHC7htSgUA326RqPaAFYm3b57cWd6m09p6IB5a7NBuez84vDxvcMUzlanBxOk777R8D1Ifs6DQe1bq4BTD8eEygSmCDT0yHTr8930mk9oaPyR+/F+HI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <357e94d0-0f49-7854-7562-9f6550d0fdd8@citrix.com>
Date: Wed, 26 Apr 2023 15:08:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/misra: xen-analysis.py: fix return error on
 PhaseExceptions
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230426104605.3447049-1-luca.fancellu@arm.com>
In-Reply-To: <20230426104605.3447049-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN7PR03MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: fa26597a-1603-426a-650e-08db465fc83e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PTstlTS+pmJm+QY7VeJuyXG8tUSGMrGD4IOnkLYefkskEAI4XPkmPZQsoUa4g3Tux4PFW71CWSd5dDVRdgX8sMkcSfkwo7Fg7H7BciwPcUKKpfpawZym4eB6EUtpAZ7WEwOudH8rXqUY9ND/XA04HXAVPvJYw3VzEtjqgCFOaIwnSLUM/oPWLkV48wkmvmuMi0zXokoORXWYvI7I7u2UJOECCCcPLA+TQQBVq5q1hNmjjdWrXi3+dKlFOkEgpvQgRETSZ7z8FHXD2dG+e5VFPXCKtJjTCgCdGc/Z4a8wXQ3OASkFotFZdkSBAHtUBy6lLbu1KqciOnQpe9WXEHpGHjJ9JG1j7Mxrj8VD+sXOA8wQ4kgNCiuoQXr/Q3QydKng0Y+AGU+DIgD3m4216iWD6BTFsXXgPAvv8dJikHOEqzEbdYyUyzkc7viGHlXrGOVnMG9PX9tXm6/gKaR7xEuIVeYcNNIkgGwaBvc+SYkkmV5hYN8DhQhUhy96cqaqXGt1def2L3lJNF1aTRnMu3KAFa5wy7WT8mVHOVrsgNkkfRAONxvjJ2Au90S1qpB0wNSwKVlgJumPO1tXStBw7EpgM+xP7xbut1LcxSY9v0Rg4SZ5Mrqm2pl/aqSol1t9rHsiJjXZ9qXjhcuXLBuo6imA3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199021)(478600001)(38100700002)(6666004)(6486002)(26005)(6512007)(186003)(53546011)(82960400001)(54906003)(83380400001)(31686004)(6506007)(2616005)(5660300002)(8936002)(8676002)(41300700001)(2906002)(316002)(4326008)(66476007)(66556008)(66946007)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVNyS0R5Q0UzaEpnMFFScDRCOU8xWW1VZDk2RVdBY0dnU3VLd0Z5ZEhxcGNH?=
 =?utf-8?B?K2ZORjlBaXl3YUJPUFRIalZIcEFuUklOZElXTnprUmV1dFBub3EzUjltNlZi?=
 =?utf-8?B?aWRpZ1IrVEFtY2pVWDNnOGtrak9wR0lxd0N2STVmZEFzT1BiSG1qdTlVUmtQ?=
 =?utf-8?B?U2hHT3NPeTE1UHFkSStwQWVTQ0dtY2N5THFCMy9xTWt5bndQQjcwNlpRWWJC?=
 =?utf-8?B?MFVWUExVZTVkUTJuQ1lCRmxsc2poaGUyM0Rld0puV1MvSk5iS0hhdUFlMkhY?=
 =?utf-8?B?VWdXRlpGWGx0UlNYeVpNdGRYYStQVVZNOVI0aEc2QitrZldDWmsrNU56dks3?=
 =?utf-8?B?dFJBbXU4cEl3Vy83YkdGRXZyQzZNTGVyZUtybVNuZzdvUklKZGIzRlRTTUIy?=
 =?utf-8?B?NVQxUkRiNkRaejRLRHRsWFZwMEpBR1M3amd5blhuVnJKaWZ3RHoydXNBV1Ry?=
 =?utf-8?B?d0NxUUl2bm9KdHV2cDlFVlpGZnI2emhPRVZXK1VSTDJmVkF0TlFPTGVxMmlM?=
 =?utf-8?B?MDVVaVNQMzN1clgrU1RKaWFrR0JEcS9xcnpwK1cyMnhSeDZnSWJsdkdvUDlI?=
 =?utf-8?B?d0tEODV2S3c2ZUNxMUl5U1VBYTdYM0o4QXRQVjQ2UEY4a1pBeU13OGtpR2Vh?=
 =?utf-8?B?Mk1UeVZQRVZEMThnRFRPVUhIcmhJTUNUMVo3ODJFRTlDd3gxWk94Nml4VFZO?=
 =?utf-8?B?clJTTVlqWkFnakthcm5WUmZrTXBaRU15VGsvT2J4UG9oUndSejhUSjNJNFBF?=
 =?utf-8?B?VEU4c0dOTUVvc1BYSFc3ZmhwWDZnQzczZDAwSEcwN0Y2b0tQNkkycXNHSFgx?=
 =?utf-8?B?WkxEVXdjdUMvVzRGS0xVRjBxbm54VzA3S1lqNXFLM2dadTl5ODBmR3dlRWVB?=
 =?utf-8?B?USsyVXNucU44VE8zK3p0cjkxcHpubnVIS2N3b0cxOENiWnJUc01KTUhnTFJK?=
 =?utf-8?B?STNWYTdrVmsrRXN5dEUzWkQrS01acUtNVVJRRU1UeFNQTTRPQlkwN0E5Zis0?=
 =?utf-8?B?cFBhRWFIbVpOTjBzRGdLdDkyams5b1ZYaHpQbUsrU2NBcVJEWFNaZFVrV0V6?=
 =?utf-8?B?dmFMMGRvaE5iYkFJNkROSG8reXE5ZmZEcTA2eXovSTg0RnZNYjFUN0k3WTA0?=
 =?utf-8?B?QjBTRVd4MVNCTUlkQ2V6REhBNE1vcUIvSmE3MFFXaE44bUtlRzRnTjJDbjdu?=
 =?utf-8?B?S3M3d0E5K0RheHQ5ZldORTRxOVRqLzBDNmlJa3dpbjVBS25EUFVxTlluWFh3?=
 =?utf-8?B?dmM0NGZSeFVHSUR4ZzZUUnNudWhhVGFWTzRXMjB4ZG9qdjQ2dWVoc1lXbXlv?=
 =?utf-8?B?b1F4bUFyazdoZktyYXl0aWlFVm5EYXpGTVBIWERuSnpiaTQ2MUdVR0pXL3NI?=
 =?utf-8?B?UnBLeXh4S1E0VDZ0clZ4K1VoWWpGNE53VjB4Q09UQnNQZlNQenJuV1NDU0hq?=
 =?utf-8?B?bElXWUttdGVJU2huZlhvZHFhUy9mWnJsREdWSzZjM3ZtM1R6ekdyNlZ6SHVC?=
 =?utf-8?B?TlRyc05PamZreUdjbWM5ZlQzb2NqTTk3bW1iQVlPdGpwaFAzUEtWU21Sa3Fi?=
 =?utf-8?B?Y0ZNVVEvQVJ0NTYzNi8zK0I5WktXQUw2WWRFaWtFL1J3NHBWSzRTNU5VTVgw?=
 =?utf-8?B?bzlrQ3JvMzNwL3BDT3QxV0poNmFYOFB1T0x5TXcrQURGeGhsTGxIbEZvOU4x?=
 =?utf-8?B?Zk5UU1BCelVWN0dqR2w3WEpzOTBTT3VETisyc3ljeXcra3ZHTyttSmIyMVZj?=
 =?utf-8?B?cXNNOVVhMzlZcCttU1hhckg3ZUkwVXFtbU1vU1JRamN4OGdGUk9yYWQ0RU5C?=
 =?utf-8?B?cndZM1dnUENMZm5nUEVtRDRHVTRjd2t6T2RVZGpRWEgvbmhqSU9BNnFnVVFx?=
 =?utf-8?B?WFAvSjJEa2l3bHdWdTNZVWNoSmZubzg2Sy9uRVpwcGVkR3VyZVhRa2kyUGtC?=
 =?utf-8?B?K0lXVTdJMzlQbDhiU2dTTHphK3dTVnNxT2U0YXZkTGlHT3hOb015cFh2VDFG?=
 =?utf-8?B?RzFRWFRjRnYrd01Ha1dWdDRNcURMTGZ2azQxT05XQ3J2aUt4OE1wK0JYOWth?=
 =?utf-8?B?S2w5MEc1allubFZHODA1K1hScGVWcmc1RE54ZG44Z0NMaVRkTTJGM2l2NndL?=
 =?utf-8?B?OFZtWnJXOXo3OFM4Z1Q0MjA5aE12emxYVzZVQWxWSmptR2kwQUNkbmtyeTFI?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CDDWAaSKek1reIy57HAACMuNb/VUl2uXetZctHZTU9bmOddewXOnp5h7gK/YsOUtfiCwzlp90n7loDzr0CqZ4InxddMwnuu97LXHxX1WbORnfZCznKkePgo8IT93cMKyHBdrpS/GuRBwqhlOy9nAQ1si/QMualdRy2rpa3B5wYZUOtSvdFln/gqBioWKtz8OlDTfU5kIa0p5O88sXB0ODoyjZ42pOQ30FvY9IXF9oqyonuCK6j8sT1B4kg7CRB3MZVm0T0x4EY6BCrbUQmuYf+x0i8pHZvvGAXhymxH8aNOfnaXcNU+XhnjjcUaV1EGESlJUT1n8xZx/GwpC5kWB2Ajl7Rk+YbdR0lY/K0Tnz6P1i7x1XotMmYjXQw2Z8zsiX+OcH5gILRke5F2j05UZqfitzJ1J9+5ZmjVm9S9aYc+r0UC3mht2lLQOXFNiCth6+uJTZtwXQDwhQd7eY6zm2TvcP/fwOf7dHnnvNaeqCFfdbhUULCXTxdStuYaakfIk1q1fl05TBb2TyYhgDrPlDhrSppPSepRqQS+LG+j/C5cjCnX8jYzpjzGFRY4EVck2cghYVItCrQMtuymUNTAJA7B2ZHyjJOffKelN9NOJmjNOARWqIpUk9Zb0+45kZVH7h6CeYrcVIPaQhcf8qimMS9W1HD2cJt7KBbY2DxCbNd5hZOuN0qnX+VFyttwtydqJLuk/wfEs3965aV9jLQEXrM6tuduglOAUUvrAidAdgzapa2tOofmF5UrSOq4fXm7rMkAy/jNfRRx2wdXfx9HoGg1UB6ai7FVjGKE99QQxZ/O6Me7SV24Mk32d1w/7wJWD2aCzHwnjM1TpZ6dlznO6mpk5Sb790toxFoiQkIT0kyBaDBhRaLwB/W4nAbDoE5Z/
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa26597a-1603-426a-650e-08db465fc83e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 14:09:00.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zs8uyWHhCvxE6jHbU+QxUGZb1JU0LvJucVA8bxrwum+Fd5Hn8K/ZXaVTnxXwIuo+Vx/WURfUQzEulspelGeLR3HHNaeksiCeGHB+7Bs6Vhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7274

On 26/04/2023 11:46 am, Luca Fancellu wrote:
> Currently the script return code is 0 even if an exception is
> found, because the return code is written only if the exception
> object has the errorcode member.
>
> Fix the issue returning the errorcode member in case it exists,
> otherwise use a generic value different from 0.
>
> Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/scripts/xen-analysis.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/xen/scripts/xen-analysis.py b/xen/scripts/xen-analysis.py
> index 8e50c27cd898..7185c5a06d2c 100755
> --- a/xen/scripts/xen-analysis.py
> +++ b/xen/scripts/xen-analysis.py
> @@ -26,8 +26,7 @@ def main(argv):
>              cppcheck_analysis.generate_cppcheck_report()
>      except PhaseExceptions as e:
>          print("ERROR: {}".format(e))
> -        if hasattr(e, "errorcode"):
> -            ret_code = e.errorcode
> +        ret_code = e.errorcode if hasattr(e, "errorcode") else 1

ret_code = getattr(e, "errorcode", 1)

is rather more succinct, and pythonic.

~Andrew

