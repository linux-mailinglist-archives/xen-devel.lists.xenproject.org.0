Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F95E4EBE8E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 12:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296204.504147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVQU-0001SN-Vq; Wed, 30 Mar 2022 10:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296204.504147; Wed, 30 Mar 2022 10:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVQU-0001Pc-SM; Wed, 30 Mar 2022 10:19:42 +0000
Received: by outflank-mailman (input) for mailman id 296204;
 Wed, 30 Mar 2022 10:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ0c=UJ=citrix.com=prvs=08136f46d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZVQS-0001PR-St
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 10:19:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e76ba4f7-b012-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 12:19:39 +0200 (CEST)
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
X-Inumbo-ID: e76ba4f7-b012-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648635579;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=azB2e2uEQuYN2b32gGkByK32Cd69NtOGmZ37qJN786w=;
  b=H4x+y9STsOuK2X4GQ6PawHwcNg82ykrbl/6TZHxIG35vTBWsbjc3YnIu
   +YffVlY2B5gx1VYyK1LtMYi2Vn7qaRLLUODTVH7rDGDNaxGsVTpORm3Yz
   qs45aDRlLUE6P8QkPiEm0ZcmuWrdVTdpdEoBolpBtATQQ5Ttw5bI8/gJW
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67536659
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uqPBYaiXAwwTjlsU6ZS5aiYhX161eBAKZh0ujC45NGQN5FlHY01je
 htvWGiCPfqMZ2rzctF2aN6w9RtSucSEzN8xGQdppHg3Qysb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFjV4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSgGF4uSvNU9aQtFGjEmL7xro7veE0Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiBO
 pFHN2c+BPjGS0RpAnVMCbRup7qhoyfFUjFji1XWnoNitgA/yyQuieOwYbI5YOeiRsJThE+U4
 H3H+2fRBQsTP9iSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixKUctaGBlWfwcptI/VWQ4x
 3LSm8rbPGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+9L5fPnwZlX6rwub9iEgpHSBjA46QzMNo5OxlMoPdX1D2BEBLWy0BqhEGp7ZgTZ1
 JTns5LHhAzrMX1rvHbXKAnqNOv0j8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5VMMtMUKZiPwNfMfj2eN5yICl/KI+TPNDK28UzazSsIpKF/vEN9GOyZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8dZFb7x17FPf/QhnnTm7bcmil3yPiOPCDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbqNmPT0EC7agCsQWmKZORW03wY8TWMmu8pcNJ7fZSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74lxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:93rV4aMjlDvZ+sBcTgWjsMiBIKoaSvp037BZ7TEKdfU1SL3gqy
 nApoV+6faZslcssTQb6LK90cq7MBXhHPxOkO4s1N6ZNWGMhILrFvAA0WKI+UyEJ8SKzJ8n6U
 4PSchD4IKZNzdHZdGW2mSFOudl5PSs35qpi/33wnpgQGhRGtxdB6MSMGim+zVNNXF77TtTLv
 ahz/sCnSOpfTAvdcKwCmMeU+Wrnbf2qK4=
X-IronPort-AV: E=Sophos;i="5.90,222,1643691600"; 
   d="scan'208";a="67536659"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXuN7FKD4hZdDTQUg+iLnGeenoU5xO3tKAID3z49oZS14EN8frHAM985EwAAbtwzzBg6EMwVYEa/k+/YXtJScmlpqdVZjwLFqw8lmTRtp1HV2iqRdAbPY5QfMqBqsaC2fkPDA0+UA6HFyqWdgRvX754qIHw5CPz8grycHz/KFd9rwKyut0jmfac5IQnufsI8SiHYfSlCZBUbtAx0/WspuhTjqxROKIghkWRWZ3L1jm5wZYC2CLEew+t3hFLHVfIt1N9AxZ7LRuPqsN5paNHWGsdISWwYKDz9WhX1s/AVh4uj2JgUINbyZlJtHUQMvftx22aOS4qrY9JcdMtQvFECgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUpRR1rswfTfSO/q6qpgnmXZi7Sgj4fUUKkmY4+kR+Y=;
 b=SpDQrZHQACXPH1KMGAgceNUjo1ASTs/QiglKd0QQTMhxP0C0GxtaXc6FpMzjpsanY/iZMwo03X8ChyMSQuWCso4YHnFVXzs7qKn+Rz1EFFja27pjCRzYOfmgw0DzM6TqTsN74ZqtbdjZNqogPG2KLFWoHKRhAGZZjOPHxHCtDUCBFPQZutOVdDeqNVRSWyejYS0+C1uApxyUmDTa9GZr0YCPBPQmKNEgv+i1woD663HqnvJBk5oJZP3BGHSz1B76aTAPQoHM2YzdVbHrSg737ro8feli3Z5ZMhkutdIWgW3wvj2HJ4byMzkEM4gXP5c6dAIMj6WIargaEo62yHLhrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUpRR1rswfTfSO/q6qpgnmXZi7Sgj4fUUKkmY4+kR+Y=;
 b=ZqM0Fh96pgIYcJWk5GYH0NCAQ+mmda3WWTRWe9CpI67yTk7qgmh7sp5gRppU2lv1y6wlSiYuIoCSKoFHUGW/R/LHMhW10e3mrE2ejplIUVH9sbNRz3malaZ11M7ZH+uZwTa2OQcUXfaDIZSOmuc5J2hfREu0N34nSLZhezBnV60=
Date: Wed, 30 Mar 2022 12:19:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] livepatch: account for patch offset when applying NOP
 patch
Message-ID: <YkQusCcbe++iMGnH@Air-de-Roger>
References: <2df6d890-9d91-62cc-8057-3d50f1501ad5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2df6d890-9d91-62cc-8057-3d50f1501ad5@suse.com>
X-ClientProxiedBy: LO2P265CA0285.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c30107b2-0722-43fe-9f63-08da1236c8e4
X-MS-TrafficTypeDiagnostic: SA1PR03MB6579:EE_
X-Microsoft-Antispam-PRVS: <SA1PR03MB6579AADEA8325D53918A7D808F1F9@SA1PR03MB6579.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hcc8+EutCujzsRErLCk/OVlcmPSMj9GrYwAk9FW4iXlgAnKkQZaijklrUWs7eEGQQ1sqvR5QqEd1k8pyJifZNwaPJRH6Va/E3/CTdtAjnWtRqnkAh6YN4Xnqf13UqyaX9PDU5BQH/X2u2rTcBK1mt7dZQ7C+HM0OVY2biQQRXZHoykf+sw0imKZYMfsB/5m+6p74u3cKUnZVOuPZ8EOoX2z1aGfSZ9njNTd8zt3zIqbXHkCXKcNWTIrj1L6kFOmH0F0ygF8RXDcPvVzBtRGZeZQns+umbmH0iTDE2U6a1h4vSSmjrKXg9x/hKqdd31fHBnXOguFG6uVQ8xhXMMfm0tizz1PqYF6COsLW27Fh9YAa3wur99NFlgcbNH0SMA09uWHyk5eIsxutXaXWRXw2EMv03rP693o1xgP1TYZEYARXHphpDlVQTWa5Z7hf32Li6NAF4Hk14QWz59s8ATuWKJzuBLGXP8E35u55GGF+pkn0GXY4h07A7vD8lFnCJduF8QoPh+ssvDWe9WdvB2GcLph+mcBVh4lUqb374PDnXtok8v19PCWbK0J/qsG5NKYmoe+HBZ8y3pda9mmavCZPmLnP0xxgV3fnKY7mOeo2rG4wnz/cEs6c9lB04oWmyMYA7YRY5i7oI2/rM7/02K765A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(66556008)(66946007)(86362001)(6486002)(83380400001)(186003)(26005)(66476007)(508600001)(107886003)(316002)(4326008)(54906003)(2906002)(6916009)(6506007)(6666004)(38100700002)(8936002)(5660300002)(6512007)(82960400001)(15650500001)(85182001)(9686003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDk3RkZ3TUpwUFhzUUUwT2VMRlVrRWgrRnR5b0F1b3c1RXdBN2NveTBKQXNV?=
 =?utf-8?B?dmxyNlZyKzNGNXcrUFdaMzlwemNaanl0dUNOVXVwL1IzeVlYTWFJQ0oybHFF?=
 =?utf-8?B?bkRpTGxScmtjbEFuQ0lRRVdEZ3IxQk4vZEZTMW1meGdMTGlMN0xnSk5kL1Nl?=
 =?utf-8?B?SDJ6NDNQcWdIYWlFKzZZZnpaNzBBd0xIcy9jMmcwTzJNaTBYSE0vKzNOdytv?=
 =?utf-8?B?VVNBSFRBWXhjNUx1TTJ5WDE1L294ZVVoUC8vc2w2eld2T3VwbHo4enRiVVln?=
 =?utf-8?B?NzFuTzdiWFhmSWc4eUFFTHo1ODdnZklBTVBjN0xBQWRpa2ljSVNjNWZGZmxH?=
 =?utf-8?B?TStnYlJLdzNMTDhHRFo4NXg4cVd6aVFDZFhIdGJLRzl1Szh1UXI4b3hKSmxu?=
 =?utf-8?B?bytUWXlsaTR5emFrRXpVZmhZMUx6VHBlV2ZuRHNDd1FjT1FPdG9ZQWV5YnpF?=
 =?utf-8?B?Y09kd1JRQVZpc1BSUFUyakNmQ2tKV2FrSWNkWHV4eFVwMGJ1WVhhOVVJWFRa?=
 =?utf-8?B?MHRzSWtGV3h6Qy9pVnArcTVEQlRjWE9YQVZMMFpQMHM2YksxL2xlYzdweVEr?=
 =?utf-8?B?ZVRWQjYyK1VUMG8weHRibEN4Zjhqc3d1dkdnQm45MkxidjZTYTE4R2ZFSEpk?=
 =?utf-8?B?ZnQ2SUtPRzhyaXNxd1dLQjh4N1FzdnNCQUJzUlRrdjJ0ZFZoTVRiK3lvODBW?=
 =?utf-8?B?Tmp3SndKenlqb2V5UnJZbzUySjJjblVLNENuVkQrb2ZXQkw0RzlpdUFiU2VG?=
 =?utf-8?B?S2ppQjlxelhMeXFOaG5CSEtCcjc2YVdBNmVuT0cxMkpSaVdoeE5VeHhaTmMr?=
 =?utf-8?B?NDY5SjhTR0Vza0orQTlpSDlaU2dQaGdsa2xNLzU2TEZpNjVDU01yMUJYM0pE?=
 =?utf-8?B?Y2U0aThCekkzdkw1TkFSbDdqRVRQc2hEU2xsQnpaT0IvK2ErY2YxN1VFL2Q2?=
 =?utf-8?B?WUJnUjRtL05ubHNVd0JJRHBMalhHZk56dW5YTVR4S2sza2hYUHFVNm9QZU91?=
 =?utf-8?B?WFBTem9Tbis0ckZnbzJzSlVDVG94ZWFwUHdLaHNyZzlhWFc2b1dpbDhTK0x2?=
 =?utf-8?B?Z21adE45NVd4cStMaE52d3lMNk80ZXh3ZnYrVTc2VUhFdGNyOFAzVjFKNElZ?=
 =?utf-8?B?WTBqRXVBM3RlUnQwSTViZ2JpREhLcFc1UHlBSlRQZEZSYjRBVTlhNXBmaFk5?=
 =?utf-8?B?Ulc3VStqY25nQzdyMFNZWW5IWmdwa0RRUVRyL2pINXJ1b2ZVQUQwdDJPNlFq?=
 =?utf-8?B?eFczcTFYYzcyV3cyYWVSVTJweUh6VHNXWVlhcGFpTi9LUGxqMTZ2cStwaFpp?=
 =?utf-8?B?MTNQVnZ5Y2k1UFhvcHBUaDlsdU1sZ1VsM2Z0QlNNVURhNVBXUEQyV203amNJ?=
 =?utf-8?B?Zmw4Z1JvSm1Hc3N1VUpWRmUyQk9zUEtHRnhQT3VvQUd4ZklzaDkwYjV6UGpL?=
 =?utf-8?B?K04xSFFDNWdLTXVuTVV5T0d1TmtXQVJ5aG1lR0t6S0RtVmkzSFJvY1RUSTZU?=
 =?utf-8?B?RGh5b1lndUZVSDBqSTdwOWk4cFgrb3RRdDVQREwyNDdTSFNxVmk3VC9INlJp?=
 =?utf-8?B?SjVEN0VUMndvbmNJWGpWdTh2T1JvQTY5aEFBZGwvVGRWR2ZSZ1FBdmpYQ3FR?=
 =?utf-8?B?dEErRVpEcEo1NnZhTzJYdUh1RkhzWmk1SklvOWdQakxvb0g3RHZsV2hDZVpj?=
 =?utf-8?B?YnE1eG9BYUsxRjlnYXl5Y3dEekx6N0Y3RkZuT1ZEYVNBTE5UWGE3bWNqYkp1?=
 =?utf-8?B?Vkt5QTdmbGNuOHNXSlVjNnhBRERIenFXdnRuMFJ6VEFQYmEvQ29ITUN1dDky?=
 =?utf-8?B?a3ByZ2MrbVhaQTNnbTNZZzVWanlBNXhNcFFUWjBYRWU0dXE3aG83VlpHQ1l3?=
 =?utf-8?B?ampwaWRtem82dU1tZ3hJZ0MvVkViU0duMjdZdHJLRkRoamtPRnZwTEhTQ2ZI?=
 =?utf-8?B?TkFKY1Z6TXB3WHBKM3F6WDMrN1dQYm43cEI3SVdZbG5FTzRsZXo1dnE4Z1Uz?=
 =?utf-8?B?cTJHZnZaNm92eHljQnpwZ3RUS2RrMlE3dFZZWUNxSXd4RW5rZ1JTQ0xaSEh4?=
 =?utf-8?B?NHlxTWhBczZQalJBZlJVSThGa1YzdTY2QlFPeFhtWElCZVZUS2wyanVTcUYz?=
 =?utf-8?B?enAyU2RGOXJUaWFmbjB5NnlyYlFwSHpKcWVkRWVXN0RpTmNFdkJ5STJXY0t3?=
 =?utf-8?B?MEtldHlNVisrM0E5eDdzY3RZejNraVg3bWFVZEJvMXo4LzFEOEVBQThkSkZk?=
 =?utf-8?B?STg3TDlhZ0ppdElYS096RGZyL09GbCtTazdHaVNzdkVKOCtZU29FT3FoRU9W?=
 =?utf-8?B?KzN1enVyRTBCWXYwR2NsWnlqRWNsM2k5V2ltcXEwdDZ2VTZORGdTYXBNcG1X?=
 =?utf-8?Q?waApUVVdvEe6zPFY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c30107b2-0722-43fe-9f63-08da1236c8e4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 10:19:33.6506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tm9HgNYE9rmBzwGukt16F8v3l6qvQWiJwfT9rKiXPbJrCO8sCn3NvtSNfnUVfd31t5NzLzUqYgxtYlWRq3a6Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6579
X-OriginatorOrg: citrix.com

On Wed, Mar 30, 2022 at 10:03:11AM +0200, Jan Beulich wrote:
> While not triggered by the trivial xen_nop in-tree patch on
> staging/master, that patch exposes a problem on the stable trees, where
> all functions have ENDBR inserted. When NOP-ing out a range, we need to
> account for this. Handle this right in livepatch_insn_len().
> 
> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced functions")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Only build tested, as I don't have a live patching environment available.
> 
> For Arm this assumes that the patch_offset field starts out as zero; I
> think we can make such an assumption, yet otoh on x86 explicit
> initialization was added by the cited commit.
> 
> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -90,7 +90,7 @@ static inline
>  unsigned int livepatch_insn_len(const struct livepatch_func *func)
>  {
>      if ( !func->new_addr )
> -        return func->new_size;
> +        return func->new_size - func->patch_offset;
>  
>      return ARCH_PATCH_INSN_SIZE;
>  }

Don't you also need to move the call to livepatch_insn_len() in
arch_livepatch_apply() after func->patch_offset has been adjusted to
account for ENDBR presence?

Thanks, Roger.

