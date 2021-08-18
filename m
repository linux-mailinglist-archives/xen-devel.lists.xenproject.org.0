Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679613F002E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 11:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168147.306976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGHgN-0003Vq-Am; Wed, 18 Aug 2021 09:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168147.306976; Wed, 18 Aug 2021 09:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGHgN-0003Ss-6s; Wed, 18 Aug 2021 09:16:23 +0000
Received: by outflank-mailman (input) for mailman id 168147;
 Wed, 18 Aug 2021 09:16:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkKE=NJ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mGHgL-0003Sm-GF
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 09:16:21 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 212b6d68-6b0e-41cd-880a-4dd93bf36bc0;
 Wed, 18 Aug 2021 09:16:20 +0000 (UTC)
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
X-Inumbo-ID: 212b6d68-6b0e-41cd-880a-4dd93bf36bc0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629278180;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SY+fWEQ0dyvVv91jn6JnsoAzBxfLu318TdDrd/GhUgo=;
  b=ZuPGM2P5u6YdElaWQnyTVPo0TVJsq32OpLGBEk8PqvuAUWpy6Ui+DoJI
   uVh3+a+KLwWHE8ZTF0sp8/hDm6nF4nBybSAUw4/glZXqvXWctp8/aXHFi
   +WlZNBO4YZcrph9vr42DzKtwLA21Cf8i2QrzxaXsMXSmr00hDqV7XbUVV
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Z0GsyJRKy5SzMFOXEjGIaTL+8q4Z9fs+Rad2XjLX5wEye7ZhWVrasUKhYGeFPKhWf1Optr+P5U
 We+BOTxvpFbCYc7YIqtrXY0Kvk4UCMwCJL8QWbc7rDaE+lv0oEA23hUfaCV/SY7tPJxQ9hqfsC
 03C8hYEkTsmgMJDkU9v6hobbR2rKdvUkdN178n3iM0JhfS3r13uuawAw7r6amxr+qZEfGeOpV/
 9R0K3eqdsYgxaOeWdqEiaFgtuohRyQwhPXx42xuc57lIa3suHEzoJGSOW5nXwjK73H5hgXI6PI
 riQ65WSzRdt3IlAGtKgFnDSn
X-SBRS: 5.1
X-MesageID: 50699419
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Qkx5ta3LcjKVKstwSVAbBAqjBTJyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJk80hqQFn7X5Wo3SIzUO2VHYUL2KiLGC/9SOIVyEygcw79
 YYT0E6MqyMMbEYt7eI3ODbKadZ/DDvysnB7o2yvhQdL3AeV0gj1XYeNu/yKDwHeOAsP+tdKH
 Pz3Lsim9PtQwVsUiztbUN1LtQr6ue72q7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLiiP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4Dqk/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69M9kWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS1NI7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp/FWH+ObcGUjbIy32BHTr4qeuomFrdTFCvgglLfUk7zM9HMlXcegd2w
 ysWZ4Y5o2nTactHOhA7ak6MJCK4sGke2OEDIuoGyWRKEgwAQOHl3fG2sRA2AiUQu1/8HITou
 WMbLoKjx98R6rRYff+lKGjtCq9GlmAYQ==
X-IronPort-AV: E=Sophos;i="5.84,330,1620705600"; 
   d="scan'208";a="50699419"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/1uPPiOHlLG1i9AAoBIclN1Ez5aaW240B/KBE/9i3iuLZmX6i7vl7AgVaXjT2/HSxi7qNmZeiWOC4z3w1jAAYF0jJfK8T2OZTAGT9tvqiEFNbZBF2pPPes99iSTo7H7ui/jzar05ZBdLhP8Jo4SXOrPMQhVRayvDoNq0nhU4KZ6JuC1LPGWwt25fyXINsF+9Qfdlbv5IxyBzy9WijsV8G3lK9XqUST5YlayRAsN83qkHoGiK/7a7Eokpk6QJXwpKZ/ac6eLsoZrGKNnVYT9Lsg8MlIya4+IeG9M0W2bV33YVSighxy5lg7qlczK+VinDWf6rvdX49lJmX5xWURfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SY+fWEQ0dyvVv91jn6JnsoAzBxfLu318TdDrd/GhUgo=;
 b=DppxiZLisqafOQ81mvhUrPN/ZP6blXOmwE5avGYc+sKmky65ClsS3RqyJY/wI/1jyp/EsS0SSmWsns9NBF5FGRxrVGn0/DLXdHJunXYwKrZs0NUbwx6BlXZwfpJHfG1KUUCjHeFvXS2GS2KiB4iWU1rtRe/YV4piqWQMTggzn6chRyYhnLcHnLu1bmnbHzyN44/lxp03V+RAmZ6eRVBzvJubT6GlwZH7A2NUNzNANaxqeXd6fUXXWqKxJ8Z3TVKJAT4gss86s80JjJyqVzQwyv9oYc1k0m7v7ldhysMtAWyxTD9FiICoH0l+TrmFltsUsaqanpX/SBIoSR6uZb8Lvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SY+fWEQ0dyvVv91jn6JnsoAzBxfLu318TdDrd/GhUgo=;
 b=keJx/khuWfHHKIRKyWri87hIAJ6Ch5JX6rW/mTJf3yiNNIA+utF6HQilHfSvKHCnQNg8c0GjFxBlq/AObiSiEUYhpX7xKjmVuZtt6lRv9n1VHz6KSQ2N1d2yyi7NHXPthyEhXf1vsxGXkiggzRfx6YIPa9g4+kG073veAvLhFf4=
Subject: Re: [PATCH] x86: mark compat hypercall regs clobbering for intended
 fall-through
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <5cc873c5-fb76-52b3-5af6-0a5f4987f2d9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0633e9d9-4823-589a-4fc5-ff28958c1644@citrix.com>
Date: Wed, 18 Aug 2021 10:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5cc873c5-fb76-52b3-5af6-0a5f4987f2d9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0132.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 004e6ea5-3c67-4614-1d5c-08d96228d192
X-MS-TrafficTypeDiagnostic: BYAPR03MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB38615E76B598FF40DC16D68CBAFF9@BYAPR03MB3861.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QqxeWrnfYne8Ux3dNylJGJwdhSpFEnXLEqVO0aNhXJ8FFTMhBn595T+dCu4UkwKhRSMK1wt/5YFcZ4r1WdNEL2IOk3DpX55nS7m6WKeevZwi6ZqtyuyhMTzdcQT2MOdxymLDVW+A7HBkIlKrJbx5k8VikMuO8qD+OQWaqBwbsUwA/RFRRBw06bnTb8WXjreaJ3ItWUyeBQuhqIFiwkEA/XrETPMxrhNDudAZ5D8Q4iFCpoCxw4SWMAHtSouCZDy4JuLOzZO/Qmf9D5JoEIN9u5hesuTDqVdu1kcizaaNHVN5HIi1kQalpLQ3l+1w7WT5/Sng+/c3An8OJuec0JQzrupfuqZTVdkiPVn/VEtuYl3xW75mtYuhWyCQaQM4XOC9cK5hOwosf6BCEuIxe84AwBzzqUVpbuMISmZsXhh0uH70sxL5fqTXPs4KpZI8KwcbPNwPSLe3ew5ojxPT4UGxM1XTCtrVMdvi/h6IaKxxoJl5AtkT/bSrLtxrVM9vRw+j6T0vDsTzJC+Xg2L46jBdG8Ba0bafc02Wcg938EpeX/BhaU09N6uAumqGeOVLAp05qe48jUvYG4jYLP3OwkabRuaLG4QHuTarr0qymVAzpkfXeQPoAg0oELSPqq04AvsrSH/Ge5beeFq8QqPYVcx7NI1b+bDPNog4lhjZwAxOHql52W3gZ9Jj3FhJrrbQXvJIISKY7yV9zNYHBOzQwQ+UFATwjBHhes3u/u1n1fzjyBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(86362001)(31696002)(107886003)(2906002)(31686004)(36756003)(66476007)(6666004)(26005)(186003)(66556008)(66946007)(6486002)(53546011)(54906003)(4326008)(8676002)(478600001)(8936002)(316002)(16576012)(5660300002)(956004)(38100700002)(2616005)(4744005)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2dWWVdySU56Z1AwYTJlWG5meU83VzBreW9JN0NJQWJjVlM3aVhONHh1clJS?=
 =?utf-8?B?Wm1WU0pkQ2NKQ1owcjVqeHRhNm9SWXYzWXpqeVVjNUpIeVI2T3BSRGhYdmJq?=
 =?utf-8?B?ZFdzUmNxOFhKOHRqUE1ORlpWSlU1QnBqVnFkbTBaV1pyQm1WN216NFQ3eUMr?=
 =?utf-8?B?NmtwamdvSGsxa0t6cENKUVp1MnhOTk5KZGYxWWtpVmoxYTB3Y2hjRWVHTmxv?=
 =?utf-8?B?MU5jUWRFK2E0Z2l5TVVpV1lIdTB0NzVJNEpOVWZZTHRLQm1jcUtPR09HeEYv?=
 =?utf-8?B?QzVHaVFyMmFUcExFcWxTeG5yekY4UDdzLy9kNGoxcEtRVnk2dkF3QVh5ZFZE?=
 =?utf-8?B?cHBIWndXM29JVjVWZTJVVGNTK3pic3VuK29zeUh3Z1RRSzdON2VmNFpEbHVl?=
 =?utf-8?B?emtOVVNWTXlLZmZyRlFaSmM3QnU0M0NWemZIelRONjFkdXJkOUNxRUk2dmdy?=
 =?utf-8?B?MTVHMnV1c0I3cjZQVXdkNXZrWGtpMnlxRjNFNlFuNTJ1YjU4S3VZMzBLcHJz?=
 =?utf-8?B?bFdLeVhMbkwzMWMxL3M0K1daT2lueEJoQWpmMzNlUTBrMWtJSVFGT0dLbGIr?=
 =?utf-8?B?TmMzbER6cmFvS3pPUkVRV3BaWkRDc2t2ZXBtY0NRY2VzL1ZQaDE1SjdPUHVH?=
 =?utf-8?B?Y3VPVFRnNnlTQ3NzSjVuT2dJY0FNVHJGSExUNTBzUmhuMEI3Nmo4NXlPeUVJ?=
 =?utf-8?B?TVowRGNTaWF4S1ZFUGFIaWdzM0cxS0N5MHVtLzJPa2ZLL2FqVlhiVWxHdlcz?=
 =?utf-8?B?VFN5cnZiVUxWaEdQK3dNUUc0S05YVjUzZVk4L3BnZUZVajVsNzVsb2JrWVV6?=
 =?utf-8?B?eTBpN3hZLzM5Zm9IS094cE9qQUVSRTY5RlBqZGNMSVQ3ME5PY3h3WEQ0cEk5?=
 =?utf-8?B?Q0dZUkJYMHZLc2o1M3grTzFKaWtvaCswS2txT0taTEIxSUxvbVBXbDJXTEx5?=
 =?utf-8?B?R1JwNEpnVU8rekVkdjBLMys5LzBFUkIxbEtEOEZaZSt0Tmp4QWJ3czJ6cS9V?=
 =?utf-8?B?V0lLUm10NE5xeTdBSnl1cmpYc0lsVDk1b1VjWUx4S3FkdDJJTmxNTlcyLzFj?=
 =?utf-8?B?TUw0S1Z1YjlQVEpXY2ZBQ0JQTUJadkp2bnVWWE1XVUJYWjZEc28wSXRuWnlq?=
 =?utf-8?B?RWVIeFBYZEk2dENTZFNrVGpRQ0M4TTVTZTR5MmYxWWJLZjh3a0txa2xSdllG?=
 =?utf-8?B?SldsbGVnNEdZdEQ1clZBYUZHb1NUWnkzUnB2VTZUZ010SzZ2ell5SGVFOVRT?=
 =?utf-8?B?dzlTcmZ1RWV6MnVTLzRpU3ArU1NQMVVON2hwejcyekJINndmelFWbmh0MmhD?=
 =?utf-8?B?Nnl4RUJ0akRwUWljUVg1bFdTazJzSTJqU3ZsT3Frb0VrVFdiRzFnWDR2ZHNK?=
 =?utf-8?B?dTFHcTlabnhVUExqMVhhT2NQZE9vdUZEaXNPaGRuVDRhbTZnZHdJaVVXbG9z?=
 =?utf-8?B?Z3p4NjB1UW1leG9oNFJ4MktVQnRFakxkRmJmUDR2cnAxODcyb2k5OTMySGFX?=
 =?utf-8?B?dVdweFVzSENvc2xBQXNiRkVpQlhiY2kvcFNROEVaRW5UY0twanlSMWR0Titi?=
 =?utf-8?B?WjBrOGZkWEU2SHk3WEdZWVdHSjk3ejFSc21aTlE3QXJmMnAybS80VVFrNklE?=
 =?utf-8?B?MHpxNmpGUVpNTmw5eHU2eEF3YmtlSjhVcDhkcDZRK1ZtUjNMSzMvS3BUdU15?=
 =?utf-8?B?NDl3c0kzZ294Nnd4R2FWZWFvSlh1ZEJNNjRRN2M2ZjhhUHRiS3dIUWwycXJD?=
 =?utf-8?Q?bMoesJnnYM8DTrgWo24wIy64Dh0WkFnVu9JBu0f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 004e6ea5-3c67-4614-1d5c-08d96228d192
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 09:16:10.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3+l5fS+nfu7iZu6QuIduABt6ui8/gwbLPMdnujGKl2M6u7QXO8fbO8PrWBLSNx31uxEVHvBCf4enM8xmRfHDqWR35bP+cW0siiriuUKprA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3861
X-OriginatorOrg: citrix.com

On 13/07/2021 09:08, Jan Beulich wrote:
> Oddly enough in the original report Coverity only complained about the
> native hypercall related switch() statements. Now that it has seen those
> fixed, it complains about (only HVM) compat ones. Hence the CIDs below
> are all for the HVM side of things, yet while at it take care of the PV
> side as well.
>
> Coverity-ID: 1487105, 1487106, 1487107, 1487108, 1487109.
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

