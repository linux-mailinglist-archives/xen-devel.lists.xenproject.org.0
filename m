Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCEA6BE92B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 13:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511049.789798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd9B6-00057j-Bq; Fri, 17 Mar 2023 12:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511049.789798; Fri, 17 Mar 2023 12:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd9B6-00054L-8f; Fri, 17 Mar 2023 12:27:24 +0000
Received: by outflank-mailman (input) for mailman id 511049;
 Fri, 17 Mar 2023 12:27:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eK3V=7J=citrix.com=prvs=433af36f9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pd9B4-00054F-V1
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 12:27:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d422c59-c4bf-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 13:27:18 +0100 (CET)
Received: from mail-bn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 08:26:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5646.namprd03.prod.outlook.com (2603:10b6:a03:28f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Fri, 17 Mar
 2023 12:26:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 12:26:51 +0000
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
X-Inumbo-ID: 0d422c59-c4bf-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679056038;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Th8UrnJfcbt6A5MhWI8OrQHQs93O4Oq4pWvWPHJR+sM=;
  b=UMAbcyqcE8GfyzQd2/sX+5mwDfzMssatfucCKyrRZfARrvjifz+8OC1p
   eoy9lIpPmGdCoLxwCoZ8n9KPCK8+EbE/fofCwz5WRv7Bn6IDAFt5rwhos
   qyLpVIKxvNs+VogROd1VGqnbR1Liu+UqxO4SI7Yy2QZ/7eTpQ+0WYIRGn
   8=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 103683580
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Wx+f26laV2mtt379tEpp+f3o5gysJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLCm7UMqzcMGameI8gao6/9R4HucfSx4RhSFZu/y08FSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QCGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dUlNR4ybjyEvfqd2oOJS8ZMiZ9gKMa+aevzulk4pd3YJdAPZMiZBo/svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVU3jOeF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKT+PoraM62DV/wEQUS0EfVHXhrcPptWSsYt9TL
 08I/xgX+P1aGEuDC4OVsweDiFyuswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqWMMfZQ4M4t2mqodqiBvKFoxnCPTt0oKzHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa8fRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:ha3wtainzMbGEH7pc8CX/r3NOnBQXlMji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wxwZJhNo7G90ey7MArhHLROkO4s1NSZMzUOxlHYSr2KhLGKq1eMJ8S9zJ8k6U
 4HSdkENDSaNzZHZKjBkXWFOudl7N6b8L25wcfypk0dMj2CspsQlTuR3Dzrb3FedU19CZ0lD4
 rZw8xIqTa6EE5nDPiTNz0+U+/fvM2OsZTpbxIcQzsq9wWK5AnYjYLSIlyj0hACSCMK+Kwl8m
 TOjmXCl8aemsD+8BPaynTCq69bgd7wjuZEbfb87vQoFg==
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="103683580"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKWYhKpzgkNFPUdGrC/r7Ztdp48PGIW7L7YxVjF/GorMNl39MKJwfl3/nF+pK1sqA4FFllbXt+Xt//JjH2RaUOQpIkpXAToC5VxddRb38szrktShTlh1qnHepsiQwOjxWt/zv3+0w6+vauQcMihoW28BlbL2tmOTfCPBlwszle04bRux/yCCYc2RUwQhrsUlF+Pp0wsuqhHi2sQ2OfOgPuTNXdiiZDztJ+V3lV6L2UFquMQU0K3XkaIGWvipM48TN4Y8mhuDKbzH/X8cZUYLxDP8KRpsDBiVZb3ePP6mFXk60lEE84xn4BYItm6hM3P1DvsF/Lr8PPcODK86ym9ZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Th8UrnJfcbt6A5MhWI8OrQHQs93O4Oq4pWvWPHJR+sM=;
 b=KwTC84+YjmTQsM/5tNNXRl55Ko2Va6xrC3VcfHuvvJjttCNec62zLtKuGRJF/GUR9ZyPHJ2mUvotZ+EDFrecxFAZn1de9W0ARD7YIFtKCYTpLrbAB1EE2KaAWHT0IkaKjHTsX056V481Z50cPEDQAAqnRNMZxajWovcjxpSB+cZNnx4Om1w5rs6vB39yAjh1a66Mtl2O04utnybxq9kujY1nRG075Zj7O1rURUSKy+vma+fP/jafx3aJnjRG9LhPn/7jGx5kXetD6TKWfftuvJhcO6XpXfaQNDWkcaVNhIklSTQUWHHESSNww0IWv6Tesc+XoPSK2mijm/LHS4zByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Th8UrnJfcbt6A5MhWI8OrQHQs93O4Oq4pWvWPHJR+sM=;
 b=seaQR6k6+P/GvUkzB4FeKNEVTqDwW1lAcWLKCSxs1jE3n4PdHwPJiTC6oMHg/wWwcI4H3KYsNKs9zJ7OIX8VHmE3qDDUhXD+Pj8dU7rnRSj4sNAgo93JprVVaUh6XuMUkzyogScm3fczK1BsMhCd7wXQfoNr9I5NKcsELpIJ39Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <011cb7d8-fb32-74b1-2b06-f57be67f5c6a@citrix.com>
Date: Fri, 17 Mar 2023 12:26:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <ZBRNWhExetXH1OaS@Air-de-Roger>
In-Reply-To: <ZBRNWhExetXH1OaS@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0170.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: 74994d96-80b8-4340-99d9-08db26e2e276
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G1S4bOBegU9DW0gWzlOscOOA5gSqo29NY+rgQwKJ7REA+hwOtKRhkcfSca17dNpbsanjnv0yDk0r3pZgjyoNqxdI5VcO7S7XOIEpq0ltgaPZafGm52lPgnNHYFYVM+WUe64IfBfdM0peAbkEaxzMSi7Ewh70e1lLYk8kYek/uupFhlq2XXcPJTXxdOTbkoYNf2309edW3hhyTb8B3/qN1O8XkOQZTPCI1Xo+yZiG+bCsSm9eIA2KJVM5i4BwBTSAwP2hKpA0QC8g5kLyXdWuy9cwm/agGNTCiRbF0Kiv8RemmK2oVeT2vcQFqPjbItQAS8BaqvzxOCg0yWRf2902ptc6vlLJ3jKqk7lTZlE4tSBgn1Ab5yNtyvLpmtMW4CPTGR8mQ6XJrIod+1n2Jgp6pabtyJZBXYd233wp59GNqaCg5zl5kBwb62Afv5T0Hizov3oTtR2C1wWXmS+XXWJ/zky9gTm1K/YR8pGSH1zuz4R0x+QwDblBdtb8VVeXUI0VjHlve1LyJ12u3PF42uzJO2LeO8jUKgBIlBslo7Up4HYNK4PcUlwFinshpheSxZoGbPslszIZKOm56AVEKGBbZ6Lqgex+9VypUlwKwGRIec6lsrKPqwhAo3P9aCYR9GgsDPSkd3Og3LP1ZFbl4SROBjw6MqbOOA01a6qkXx9CXUFv1/W8bte2pxBflPvWYSxSxRBbpdeXXg0h3m1IRR8dcrWMZLCUB03cX7PvwxC3YzZdm34rGggjeRR5yhGcN/ZEqZ0oJsy3Qfm+Uic5TJs8kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199018)(6512007)(6506007)(31686004)(41300700001)(6666004)(26005)(53546011)(38100700002)(82960400001)(36756003)(54906003)(110136005)(8936002)(186003)(316002)(86362001)(4326008)(31696002)(66946007)(66556008)(66476007)(6486002)(2906002)(8676002)(2616005)(5660300002)(478600001)(16393002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjJJenZKd0hWSytHcUlvcDQ2eGhYZkI0YWpnQ3VnM2Vmako1STBvWWwrYkls?=
 =?utf-8?B?TXlvS1E1N3ZjVXArb2NmeUxNVEd5RHJRZk9vTmdRY0I0L01qQjhQZG1vY0NJ?=
 =?utf-8?B?TGhFdjJlSFpNbVl5NWRNZ3QvdUozb0hpT1lWWUNZSEZLUm42TkhzMjhHS3RT?=
 =?utf-8?B?WjVPckdISC94RStraHZWcnBKekpFVTVKV1lUZDk1UWRNOTB3b3ZaOGJXVDBk?=
 =?utf-8?B?anNYdStGMWhHUjd1ZG50WTJXSVRtY0hjakloUzlqRGQ3YWNEOU9NclZJZFpF?=
 =?utf-8?B?Tk9FRDhIcmw2Q0NZa2czWkJPMlRNTllBbmE0RVZxWERtZ1hhTjgrUkpMUTZT?=
 =?utf-8?B?QlRKTFZjS093L0N6enFhY2ZtZjVDa25jRWc0ZHhUbC9mKzE2blJlWkFLdy90?=
 =?utf-8?B?UVBFWWRZWkVFSnRxdXp5UnRSekdhVDJJcUtBV2htZmVlS1ZERzVMWWtLS2E4?=
 =?utf-8?B?ell6UUlMS0RQWXRMVHRuUmNZekZ6bVBwck5iVkg4Vm9GSGM3TlJBekxaNjEx?=
 =?utf-8?B?allMaEpPOWtQZG5ISm1LM3VRU0VFWUZFSENYMmVudFNHU3VQVit0eFU4M3Fu?=
 =?utf-8?B?KzBxV1dCNEx3eTF5bzFiZ1JSTkh4UUdUVXFvbW14SjFiWG5iR00rd29pRUxM?=
 =?utf-8?B?TkZSTVlyS0NLbFNwS0ZhT2kwU1JvRWpaSUpSekMvUDA0R2RVNytJell6UXJV?=
 =?utf-8?B?cW9GVVBmb294N0NKWTdtakJJMk13RGtWcE9KWDREZGRMekVjaW5UOGNmT0Uv?=
 =?utf-8?B?cEZkQVZvTDVmVTllSEhKQU9OaXBVenQwdkwxa1ZvSGd6WmtLZGRYa3ZqQUFP?=
 =?utf-8?B?U2FqaDFKOHEwT2hPWVNSZXF6UXRHeSt1SFhQcDQyTkU3UU9Qcy80OGpZVlk1?=
 =?utf-8?B?ajVzMzY3ZloxeStGNlhMa2Joa2RXUG0yUnI0SEk5UGlGZDdGNS82dXN6UlN4?=
 =?utf-8?B?dlhQc2pZdVRVVGhaUkJQVXUzUms4eVRwZ0lhZFBOR0Y2Y2dwNEJqTGpqNFAw?=
 =?utf-8?B?eTJ6YmY1YlE3ZTE5WUxyMENPRnZ3NGlEb0k3NFd1R25uTWNGMkVmQm1HcmxM?=
 =?utf-8?B?SE0va01MTWF0VktoWkVhVkdvM0llMERGM3ZqWFFVNE1EVmVPUDY1cFdsN3Br?=
 =?utf-8?B?Smo1MStOY1dPejhld01wT1NsdlYybDFSYlFQOEd1OEZUbGNNTjBBeGFYc1J5?=
 =?utf-8?B?MGFZSE1RMEN2WTQwbXhublNuVi9TdU5rbi9lS2wzbU1JVnZ5K1QxQ0hWclBS?=
 =?utf-8?B?MjVHeGZ3bE5kKzdpTnkvUzlEb2xsR3NsL2ZqSXF4UU9JU0lKNm9URlQ2bmpN?=
 =?utf-8?B?SlU2YWd3UVVhNFR1RGNDN3JNVURpNkJCeEtJc1JOTmczaVJrckp2QVpsTzZ6?=
 =?utf-8?B?OXM1ZTZ0bFR1d2JHckYyN0JuRnF3Z3RoRWlGb1M3Z2ZKY1FaZzNsYTMwK1dT?=
 =?utf-8?B?MnRHTm9lYkwyVFYwa0xBa3lwTDN1NUZUZVFpbm1xdXRTUEVaUVJCazNRZ0pP?=
 =?utf-8?B?b2VHTFFQTW4rQXlOclMrQVFnckJQb25jMlRVS3F1STlNUnhYVjhzZVBQSWxn?=
 =?utf-8?B?YllXOVcwT2FRZ3FUelYvbU5aZjR0N0txS2p2L2hOYTJockxSZHdOWXlMTnFr?=
 =?utf-8?B?MUZ3eUVUN0pSSDhTQ1g5ZWNsUkZobjk2ZWJvUEx1ejdmeW1xNzFoM1g1OG95?=
 =?utf-8?B?d0VxYjRVKzRGMWpFUGJuM2w5ZTJDYlpvNWlsREdCRE9CRmxxMWNNSXplSm42?=
 =?utf-8?B?K1B5allaaStrRm0zMVo3bFI5cnlmd01GU2FDU0dyTHNnZzg1eWtDYVZWb0x1?=
 =?utf-8?B?WkF1a2t0bFo2bmFDVXkzaXVra3oyMzREYyt6N3JSaXNDcjd2N0FCaDE2dDRk?=
 =?utf-8?B?emhOVXNYcXR1OXBDcXRjS1N1NEFEMDdadDEwNkdmR3lsZWUzcytNWnhxMnRG?=
 =?utf-8?B?NGN5MWxTbUhpTkRjYXRPd1pWOGRpVzNIN3g5M2xVMkxpMngxZ1I1KzA0bjVn?=
 =?utf-8?B?ekFRSTM0K1c4bXdaWlJnT01wOWM1QU1vcms4RHlCU3FWWW9uaWhCR0JrYysw?=
 =?utf-8?B?dFZ0eFIxL3ljQXZCNkpWcmxDa0FXSzNzSk5JUlB4dHdoNHhXVDRkTDladVl2?=
 =?utf-8?B?OFRadHYrM1k4RGJSSGNQSm11VjB5NXRMUnZGTUhBNjdhTUFCYXJrS0ZKQ2wz?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jC+cN78uSbfn4vJOVyGvhhJlFVZm8BuWSZedJT/enpMIq6/B+dk9F1wmv8VAriTQrq4frqodFQCPB/E1yRNPQjuhBDvaCWJ6dP3r5l/5umHb2Y8sSSH85r3nDZ6BsLZ6ayfXh74FPWOGfXhkhIQeF/pCtId1oMiokyhh9M7CGi1qu1FNxbOp5UzM0D/ekQlBqulSYLV4mCLEqZMyfRoxiICYKCpnDNCforL/9QbbRQls4Kd356fMQLmgPducYUy7flhMIeTBu9AINXGnh2HvzmMqp59JYjQKplqYtzROBp4UBdjlOFHWg7lZJEJZmcSzcU9NFnV9zYudZHjxao+ZWJihQPa/jD/bzykIYUhcNp1m4j6I3vrI0NW04EQ8pbstPv0EuhNBR4hBlI+DPCG2FK84RwMb0uHnHAqxWKEL8DnzPr9en0WkxpzmV51B0DGAePeizSav1XahXfHJb1gafHheDeOMGwucNGlAim5e9RiOJp1fzZiajzzzWvwKI2/JPRWVnnAC3nBB9assJmmkJuQUkKKBGu3BnSa066BSjtxMgdApbDBKuPxjMsC7pdT3W8HcdzanjzVaVBmG1WZQX+fGBw6H/c0V9sFWkf4X1LdNj9Y0S8zhRmAzRLsn/cz0O/eCEpAQErh7DaTasdiJAK2XQvXqdTFz1UDHjajViuyoW5Y5SEEVFwHxWc6/jKX5qEWgPz3W0fQKvwRPdBJ7edCG7+iD2LCzRnW92RzI6YT0FFJVPu1573vi2kqgCXctEc4M7mUfIIviQ1ZSlC+Vb9ShKLQxly91CMhgnp8MLPJ7bLAjsDXTjEMeLnHurVVUcggvbOrpdkassuhmEG+0xg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74994d96-80b8-4340-99d9-08db26e2e276
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 12:26:50.9913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sb7ZTGueuieMgmcMjMZ6DiWULGZ3s/d/+0k2npMYW3SjD0gKArCqdDJK6rWoVaWVZcxuOWCBeLq8Y2SLA5JmFoT/sPZ8GtbktpWlRa4j6pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5646

On 17/03/2023 11:22 am, Roger Pau Monné wrote:
> On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
>> This is faster than using the software implementation, and the insn is
>> available on all half-way recent hardware. Therefore convert
>> generic_hweight<N>() to out-of-line functions (without affecting Arm)
>> and use alternatives patching to replace the function calls.
>>
>> Note that the approach doesn#t work for clang, due to it not recognizing
>> -ffixed-*.
> I've been giving this a look, and I wonder if it would be fine to
> simply push and pop the scratch registers in the 'call' path of the
> alternative, as that won't require any specific compiler option.

It's been a long while, and in that time I've learnt a lot more about
performance, but my root objection to the approach taken here still
stands - it is penalising the common case to optimise some pointless
corner cases.

Yes - on the call path, an extra push/pop pair (or few) to get temp
registers is basically free.


Right now, the generic_hweight() helpers are static inline in
xen/bitops.h and this is nonsense.  The absolute best they should be is
extern inline in our new lib/ and I'll bet that the compilers stop
inlining them there and then.

Given new abi's like x86_64-v2 (which guarantees POPCNT as an available
feature), it would be nice to arrange to use __builtin_popcnt() to let
the compiler optimise to its hearts content, but outside of this case,
it is actively damaging to try and optimise for memory operands or to
inline the 8/16 case.

So, for x86 specifically, we want:

if ( CONFIG_POPCNT )
    __builtin_popcnt()
else
    ALT( "popcnt D -> a",
         "call arch_popcnt$N" )

and we can write arch_popcnt* in x86's lib/ and in assembly, because
these are trivial enough and we do need to be careful with registers/etc.

I'm not sure if a "+D" vs "D" will matter at the top level.  Probably
not, so it might be an easy way to get one tempt register.  Other temp
registers can come from push/pop.


While we're at it, we should split hweight out of bitops and write the
common header in such a way that it defaults to the generic
implementations in lib/, and that will subsume the ARM header and also
make this work on RISC-V for free.

~Andrew

