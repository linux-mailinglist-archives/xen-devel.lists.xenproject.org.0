Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F6D7D2CB5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 10:29:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621069.967100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqIY-00079f-K1; Mon, 23 Oct 2023 08:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621069.967100; Mon, 23 Oct 2023 08:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqIY-00076q-Gw; Mon, 23 Oct 2023 08:28:30 +0000
Received: by outflank-mailman (input) for mailman id 621069;
 Mon, 23 Oct 2023 08:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rddO=GF=citrix.com=prvs=653ff57d6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1quqIW-00076k-Uh
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 08:28:28 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20f5649a-717e-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 10:28:25 +0200 (CEST)
Received: from mail-dm3nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Oct 2023 04:28:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by LV8PR03MB7423.namprd03.prod.outlook.com (2603:10b6:408:182::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 08:28:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 08:28:17 +0000
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
X-Inumbo-ID: 20f5649a-717e-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698049705;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5HCPVHzSmDOlAZEW8QnLUVwjssp1s3fA794eExm8gFA=;
  b=IoZohh/jCtecCnBDNpuBcJxTdg4ANTclbsVUd2ehbXGLwP0cs/bEB+gu
   2zlISHsa3Ts0opNJ6jh76WrVn1U+whD6abQfUM8VhfktNMUS8XrjgGTlY
   S0YmYjRW1gu8hEE2e+jZXC2OO7AxG6TbhQQqBh9YXELk8fnC56Vp4d1c2
   0=;
X-CSE-ConnectionGUID: M5x9tdVlT2e+YgebaTxLcw==
X-CSE-MsgGUID: YduPtrt+QOCmWewidwIFvw==
X-IronPort-RemoteIP: 104.47.56.40
X-IronPort-MID: 126343748
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:z8NbI6LEUZCObc6uFE+RHpQlxSXFcZb7ZxGr2PjKsXjdYENS12cCx
 mBKXGDSPvvZNGrxfNxzPIqxpk0CvJaHydNhSVBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gZlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5SXHEf6
 fAmLAxXY1OyiO+8yY6rbuJz05FLwMnDZOvzu1lG5BSBV7MKZMuGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTSLpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyjy3bOUwn+rMG4UPIy068Z2mkHQ/0s4DSIbSlq3vtiXlFHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/Yh9AiHx67Q4gCYLmsJVDhMbJohrsBebSMu/
 k+EmZXuHzMHmL+ITXOQ8J+EoDX0PjIaRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ikcQlr7AajMpO26Dg+1nC22iovsKRElZz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6/t3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:ySbfl6oigGxNWTG2KrVz9cgaV5tKLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 xdmstFeaHN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMD2CAJsQizuRZDzrcHGfE2J9dOAE/d
 enl7x6T33KQwVmUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYDw9jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xiq7B8er1vZjXOIi3rqpsL0ABo8Fsp6nIpcNj/U8VApst1Q2L
 9CmzvxjeseMTrw2ADGo/TYXRBjkUS55VIkjO4olnRaFa8TcqVYo4Az9F5cVL0AACX5woY6F/
 QGNrCU2N9mNXehK1zJtGhmx9KhGlw1Axe9W0AH/veY1jBH9UoJuncw9Yg6pDMt5Zg9Q55L66
 DvKaJzjoxDSccQcOZUGPoBadHfMB2CfTv8dEapZXj3HqAOPHzA77Tt5q8u2e2scJsUiLMvhZ
 X6Vk9Cv2JaQTOgNSS35uwKzvnxehT/Ydy0ofsupaSR+4eMCIYDCBfzCWzHyKCb0rAi6s6yYY
 fABHsZOY6mEYLUI/c54+TPYegsFZAgarxqhj8aYSP7niuZEPycisXrNNDuGZHKLREIHkvCP1
 prZkmBGCwH1DHnZkPF
X-Talos-CUID: =?us-ascii?q?9a23=3A4FCEmWsQ9jmM588aFd72OXzN6IsAL22M0HvuJ3P?=
 =?us-ascii?q?iBCVYR7CfQGOA3Kh7xp8=3D?=
X-Talos-MUID: 9a23:WQLRmQkBovIdr0h8cLY/dnpTONpQ/76yS3kqupA5ttaFOTNRFSmC2WE=
X-IronPort-AV: E=Sophos;i="6.03,244,1694750400"; 
   d="scan'208";a="126343748"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGF83TwewikAKcYqkcIfZ0gb7PBrX9fQJ5cG/rAV98bRkbn3avkxPJ0aJnCNfS/l9qq3K0xGnDR6XDa12eoygmodV/HgwLA4cOnU8HXx5y9XN0FgQLQRkq5HTIOEY4v6ZJ2sXqk/Lq/m7qqhLy/fiYeXMAKW2aNgUeXVNJkopq0OOi2Pb/boORxN/qGRApqqiwGjCHhAZMZ3jl7ckg36ZEMk/dzJD43EP48YYA8JcG3oPbnTJsxF0XN9CwFjTl19Z7PZwOWKqcIYDnXh6p+EjTdlpjZumOWEDLZ2coMT+HhQX6ZJkGW6aVwGtTnDMoYMMpwK1VJZxdEzyNAtfcqNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTigZYMjAGRm34ngvs6c+HXDkWxj+sXVCwb79DeQjnc=;
 b=XD+LDLwR+iLKjM88GUzEVuMuTuFSLD0Fgn8LzxdyM7TYchpt2YIZMmpjVCBZL1Uq97QiZJ7nBcXEfFRcNB8ZyACHAbjFb9CkU1Q0NGpibZeSV7US765IWNB+cGnEPS79RRa0vPPB6Omc46oKEjORzM185w0qj3NTuS9eH0yyleXxEob5HCUpBuoJFmDYFTJoKpS0QEarMylBMMlvilqEfqwJU6gGZZ6BuY8Rk3SFNQHK990EkMicqCJ3ztT7FW06xV7I0EytcjPQ/wCpX3EwZAeLa4DSFLys8x3WgsD3J0WLMVQB/RuKkk9FYaAj6UweNFIV78Id+lZ3ULf3qjwZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTigZYMjAGRm34ngvs6c+HXDkWxj+sXVCwb79DeQjnc=;
 b=sUdoaJfSWUBGpOJ0CV3Vktcy2rtkNdjdr6vijIXXWct+34neTkZc/8Afwa6RWZmiuOLl1S3upPAaBfPBSYjlmAiLzDcYFDr5ug97B7lkz25/72gXIlEWWqtE9X7BXKLMbJvo/AfJPHSv7NQ0LTsxILqRPYWE9q74Kd95aC5Sg2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 Oct 2023 10:28:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.19] xen/xmalloc: XMEM_POOL_POISON improvements
Message-ID: <ZTYunVMy-d0cxEa6@macbook>
References: <20231020202649.1802700-1-andrew.cooper3@citrix.com>
 <2902d6cc-169b-a70f-ce10-10925e837fb6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2902d6cc-169b-a70f-ce10-10925e837fb6@suse.com>
X-ClientProxiedBy: LO6P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|LV8PR03MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f776a64-4fbb-4599-921e-08dbd3a201e2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	20rnAjpIfOLwo2cbXTVoF8MmcvBBbUBvudbW+BvbVQxee/PloyHsAxf3YFTLGRa0pFRxquhTCC20PisFwhssXVSpL+zWTH8MV4AqAi/uWTdCUTmsze/ava+UXZRyGjUADNLyppD9uJqGb2ISYQNJnMzAjHWI1caImdI5kMAjjG90ASqWFKd7ogWxt2h3MezMPue0GBJW05aLYCznAyaftVQ3cG72HqSzZeBNvt1Pe7rcX7AZGK3vezKhxHPfL0LckAd704gyodfKE3kE89NKmBFXFdHQnnghJKsysJvyN1zSp5LnnvggX6jCWOYPvwzr1Rry2vRNRi0E09KW/PZikIcxah47slAgNP9uaCd/fc19Z1nWd8TSd2UA2mbjriMhxiVtR8fJlVXpB9/Ve/1stGB5LJK/ApXpeSQyRhHZvCtfE6+qn04yaxPXkrYtKPaAH31/AlFglwBpaSd/2UKqG+GK9NDvWCZDe8z6lekj0bWJIB5d++UJnvet4CfWiQMPW7M9pE+wBJ+moSDVbfT8aq+KL+yQ2QSuGlD0edOPx9G2eYKtD/y0eDDeNCknuujY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(85182001)(6916009)(54906003)(66946007)(66556008)(316002)(66476007)(86362001)(38100700002)(82960400001)(53546011)(83380400001)(26005)(9686003)(6506007)(6666004)(8936002)(2906002)(4744005)(6486002)(478600001)(33716001)(41300700001)(5660300002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3E1UENNaU81OFc0b3U2dW16UW1VRGN6djNGenp3OU1Nd3JuNlY2Zkp3c3No?=
 =?utf-8?B?V3RYSnUzZUpFUUZYcXhpd2U1UFBQdS83MXpBRTlhVG1LSTdkbGxFOVAzQWtD?=
 =?utf-8?B?ZzlDajV6TTFLdjZLQ21KTjc1dmdxa3JsME16L21zWXlmZHdDdVhJQkxEYWts?=
 =?utf-8?B?Z1lIT1RRaG5oZm5pOHFaQ1dtRjFhTEJub3dyZXNyM1RMbmc5UGJ5UWV5WmZy?=
 =?utf-8?B?WmhxZVNUNEFvZUZYQTJQeGRaREhIOFRNVFBUbWJVMmgyaWpMK2JITHJod2Ji?=
 =?utf-8?B?NWtzSGN1YkNMUWk4SUhXQnJWYnV6Y3N3cURrOVQybEIrc3NYYWNHczJjZm5o?=
 =?utf-8?B?S0E4UEtHUExtZWJtQ0hDRDRWakhNMjAxbjF2cjlmL1p6QVNqYXJuM2gxam9R?=
 =?utf-8?B?OHJCZVAwN3YrZUNGL085RnVMZnArNnFRMzFaMys2YWNYb2JhTzlpcC80dzBk?=
 =?utf-8?B?ZXBzMXJSNjdQd25Jbi9hWVJnSXZPSEVHbXFDODIzdnN4WVNuaG8wU0FsUzhT?=
 =?utf-8?B?R1M2U2NMVHNybXlFczFUeXRXZmNya0ZxNlBEUW4rMFB2QS9SQWJqUk1pSmNI?=
 =?utf-8?B?LzhVdWlBNkFtTnpiOVF3Tkc4MVkvR0J2cUNTTmVIMGM0azk4Vld3TTlna295?=
 =?utf-8?B?NFc4T2xNU3R4RnZKUk51SW5oalRDeStzcHFyK2Q2aFVkVnRvaktXVlRVUHRy?=
 =?utf-8?B?SmFBRm93Mm5GT2QxQ2VHWkcwUE1qRFFGaTA0SDcyTjd1VWdobjBXNmFyN2w2?=
 =?utf-8?B?VS9CMG01dFhjWFJWV2hpbmFQMW9LNVRBQ2l2QkdUcSs0V2xOK1NhU2Q3UzF2?=
 =?utf-8?B?YXFTYWNPNFU3dXNDSEM5Vk80OUt1TCtRU3pRV1NYWFVrOHRpZjVLTk42bTVF?=
 =?utf-8?B?dE9xU2cxUCs4US9XeUtkVlBBcE9WSi9XWk9iRnNiWERJLzZwTnpuYUhMRkRT?=
 =?utf-8?B?SHlNUy8rVGllckxwaEFaL2JydVczbG94NjBjRmFiQXlSWU5PaWpwTmJBQUUv?=
 =?utf-8?B?czRRT000L1JJS1FXWFdQMS9vbW1TR1kwcG1iOWxyYnlWazlqSGthb2MrUEFR?=
 =?utf-8?B?ckNOSE11djlUc0N3aGxYVkVEUkhrQlhwOUtOaFE3ckUxUDJpeDBEQk95MDhz?=
 =?utf-8?B?ZUx0VGFFdjVseXc2cjVGMlBoUWdUa3Q2ZWpMZHBOMnhyZTNkZGdMQmlVRUJK?=
 =?utf-8?B?dUNwd2UrSmlEN1RxN05hNmpuTVdYSXIxVGZCSVFxdzY5aWVXcVJ0OFAzRkFE?=
 =?utf-8?B?RFdFb0RIZXp5T1IreXlrSWhJdE9wRjd3TTZ0UzdwbmlTYkpNNm1DdXVoN3dP?=
 =?utf-8?B?cHo1Q2hsUDhwRmJBcG5rTCtZN01rOHlEdFo0bWJvdzdUcGl5SUxOMDl6ejJC?=
 =?utf-8?B?aWZ6Tmh0dDAyOUU1N1BzUytBeVdOeTRuRVlBT3o4aEhRZ25HOVJGWnFRNngr?=
 =?utf-8?B?VWw3OTduRlE3M2VYVWlRUDJJT0I2QUFxcWI4elFoNXQ4SG1GZ3ZnT3ZVZS9r?=
 =?utf-8?B?YTlNamV5eDYvY3dRWFlZbVZYb3BUeXpQYXRVVmR6Z0ZJbmo1K2RKam9aTVd6?=
 =?utf-8?B?TW5lUTBYODF1b2kxOHBTTW1SRnNUajlWS0Y4K0ZwaHVEYUhEeWQrWC8xeHBS?=
 =?utf-8?B?a3ZkR2FuU0phWSs2VXZsK0VkNGhkT2krNTdRd1puclhzYmovNzg5VTc1OWsv?=
 =?utf-8?B?Z0RmWjRTWElUNzBkUlE3QWhvaUJORXR5N2hDWXhrV0J2QzZDZEcxTjFJV2hq?=
 =?utf-8?B?ZFBnWHUzcWVYMHQ5TEwxZGljckZDTGtHakY2NTFIUkUwQ2szNlozVzR4NjZD?=
 =?utf-8?B?b3JFWWdLL2lZeWw5c3pkampDL1ZXdEZmSmhSRjBMQzBaMUJQRjQzU0kyN2t0?=
 =?utf-8?B?UUVPclJXSU1ldzh5OUJtWm1lc0t0SitUd1d5UkZoMzlQSXlleXRyd0hyTFph?=
 =?utf-8?B?ZWZNVXBzZlZoS2pKaDJYUXVCM0djL205NE4xc3d1ZlRjZUwvMmd0bkpreEl5?=
 =?utf-8?B?ZlA5ZGdVY1BZQlBjLy9aL2s3akh6ajN0WEt2d1grY3ZZWGY1WnZWcE83ZE5m?=
 =?utf-8?B?bEk0cmlRRENhbzNkanpOZDVFOHd1UlBkNVRFUGphVkVPdVRFMUlsMWtSeHNM?=
 =?utf-8?Q?CtCFmLRsj4eMJ1gXtfRB5EyiE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nha0wIZKpJNRCDvgKy3r0y2JYbR3XFQ088YgqSFYBv1qgbSlNqDZLEsP+YOpixNTB8nq2Zqgp6YlWEH7zMdlzruNxdOs/lu8bFjm9/xTLiyBGF8BpdOczfpXN/HkejDmbM0Rb4zODReg2V96ee3rMj1Yp4BCjz+oDNHSmoQmDxe4zyzc+Q7hrxnx2dDa5NHgaTqxEuVqQD0KKx4z/oa+yblBMhyftHD1Pe6OdbtJeYT30nK9ITlpvW6Ggj9bicUUpd0Fb0bhecyJpLreQhhyswLYAL9Ge2cyCzpnwxLNqcb3iIuhjLOA5Jfp5ZZOgA/44iM2PJ3uXckcxrZIw2gxjWD5U06+PXALrYqNoVvfaRMzXoP0Up+cWZCikyAfH/tez8WbGPCxtOzD/AP0KxYY1v/NlDD13PzhwsUMvT1VZ7HFmpsJwe9RMo/9TUJk18R8+XNmL6035qjdU+X+AgZhDOmDNKDJlBvm/EJpZudkQy0uFXAe6q7kHnieQ0F7D+f98yYeTie3e4WLEZGcZae4lgQcQe2INiG0tPobbekh6JrddiAWX/qmjib6RJrgtZeC/ZOyj8wzSX0AdgPFlmLocNdQdeWUlhFPSSMDMa07UqbpJzn5eK1Fxq/JZUuG1fHVLt7PD+kBvdEn0lSu+6qC76QNotkPDGmWe7/Bb3pSlI8sex7reeDgT9sKs+V7MvLu1h5GPhvo2YOCnyeVTPRSlyQGpnJhwXBHaHCOq2q4vJ6OOfFVQWRnerhS4yJ5YjzW1Dg99oNsnfopvykr5OT3/h9JZ6dTKqT6xp0OIuFJVwHF4EziFP9lu6dsVZzjUsU0Q8f5/G81BzRS3VR26v1ObQq9pXSHOzsccLLsor7J0h4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f776a64-4fbb-4599-921e-08dbd3a201e2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 08:28:17.4212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qkgfvye457Y58zWTLDPM0a9xSW0gJzSL81d84yDBnNvI7RK8lNrTdu2hGtRaBo/FzF1zePlwHQiYw0k8ObVsNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7423

On Mon, Oct 23, 2023 at 10:04:21AM +0200, Jan Beulich wrote:
> On 20.10.2023 22:26, Andrew Cooper wrote:
> > However, upping to a BUG() can't provide any helpful message out to the user.
> > 
> > I tried modifying BUG() to take an optional message, but xen/bug.h needs
> > untangling substantially before that will work, and I don't have time right now.
> 
> I agree with Julien's suggestion of using panic() in the meantime, as a
> possible alternative.

We might care about the stack trace, so would be helpful to print it,
maybe WARN + panic?

> Question though is whether it's better to halt the
> system right away, as opposed to e.g. permitting orderly shutdown to cover
> the case where the corruption ends up not being "deadly".

Hm, won't this be risky, as we could then possibly corrupt data on disk
for example?

Thanks, Roger.

