Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4D8341BB3
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 12:45:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99177.188418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDYF-0005Bg-E2; Fri, 19 Mar 2021 11:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99177.188418; Fri, 19 Mar 2021 11:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDYF-0005BH-Am; Fri, 19 Mar 2021 11:44:23 +0000
Received: by outflank-mailman (input) for mailman id 99177;
 Fri, 19 Mar 2021 11:44:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0Gn=IR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lNDYD-0005BC-GU
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 11:44:21 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38c56a9d-daad-40dc-b33e-c88cedfc3d4d;
 Fri, 19 Mar 2021 11:44:20 +0000 (UTC)
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
X-Inumbo-ID: 38c56a9d-daad-40dc-b33e-c88cedfc3d4d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616154260;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w90PAMN+ZOc/LLOMhwDArwCDErFYNiB+ygI+sb58HKw=;
  b=fhLySOvVbwtelL/mcpyYI+f4J9+bxBDPtu3jdsNdIjrPdRAau5486Vm7
   x742f1hggMj0LNIBuQj+o+E1UXgjj0IQg8Snec3OualW3s7jPRn03euCl
   am4WW7ie1+bxGpMCRVw/UyyPI9lRVe2jijoTlQ/OGQrv64quazhZrG8kl
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: S0bNys7qSRVcbbOw01R1xl0ksa/Gt+YyBclHvy35D7lKcLKhVhP9wV371QhBpaMU5Jpr14jXD0
 ip+2znOa7756CDer+3xUf7u7o5zGWQv3qXMZlJP1Jx0oT0F9bWGRmdr0vz7txBv6vzrcuYKDYj
 d76Y12FSVIssOwjfpjz0qvlihK5s3LSRtPgnPWYD4kf1SyClXL+A8hBDQT3sEcZ5yRCcpuUUf5
 TU+ugqEGW+XmfMs/o1B3tyLRdLPG1CRzWx+CE3v+Mtcfatsari3/taICYfJVi762fyKGX6s5kV
 3oo=
X-SBRS: 5.2
X-MesageID: 39665510
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:F1ux265MyG9NgBzRoAPXwWeEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbTqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAoqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+ELzGz2BACXzRThYoz6G
 StqX2E2oyPkdGejiXd2Wja8ohMlLLaq+drKcSQhqEuW07RoymyYoAJYcz6gBkUp6WV5E8ugJ
 3wpX4bTrlOwlfwWk3wnhf3wQnn118Vmg3f4HuVm2Hqr8C8ZB9SMbs4uatjfhHU61UtsbhHuc
 ohtQ/p1Os0fGf9tR/w6NTSWxZhmlDcmwtFrccpg2FCSoxbUbdNrOUkjTBoOa0dFyH34p1PKp
 gKMOjg4p9tADenRkzCsnIq6NKhWWlbJGb9fmEy/uaR0zRQgUljyVoZyME1jh47heIAYqgByO
 LePqtykrZSCucQcKJmHe8EBfC6E2rXXHv3QSyvCGWiMJtCF2PGqpbx7rlwzOa2eKYQxJ93vJ
 jaSltXuUM7ZkqGM7zO4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDHgzjsqJuZwkc4/mcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQksonWmiJvtnAJuTRx6/mWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9rwPWX1/rZ0zj7bN9GKXX5IEoucwwH7wJljJQpUWy58mNJzEHmLcxZl
 FCLLTulb7+hWTexxeO00xZfj5mSmpF6rTpVH1H4SUQNVnvTLoFs9KDPURb3H6NIA5DX9rbeT
 Qv4WhfyOaSFdi91CoiA9WoPiaxlH0Ivk+HSJ8ah+ml6dr6fIg7SrIrQrZ4GwmONxEdo3crlE
 5zLCs/AmPPHDLnjquoyLYOAvvEStV6iAC3ZehOqXzesk2Yjdo1RmQSWgOvVcL/u3dqexNkwn
 lKt4MPiruJnjiibUElhv4jDVFKYGOLRI5dAB+9f4VSkLDzcARWRWOH7Abq0i0bSy7PzQE/l2
 bhJSqbdbXuDkBGsn5V6Krs7Wh5b36QZU52d3B8v7BsDGiugAcH7ca7Io6Il0eBYFoLxe8QdA
 vIZjYfOStC7dG63hz9okfOKVwWgrEVesDNBrUqdL/enk63IIqTjKccArt/55B+Lu3jtecNTM
 OScwKYNynDFusswgCZz0xVYBVcmT0Bq7fFyRfl5G+30DoDGvLUOk1hXKxeDNeG7WToLsz4mK
 lRvJYQh6+XPWrwYNLdlv2SQD5HNx/JoWm5C8svsotZuKoutL11W7nXOAG4ok1v7VEbFoPTkk
 hbfYFQpJbmEaVrd9YJey1Y8kEy/e7/ZncDg0jTOKsGYVopj3XnJNuH7LrDlKo3DiS61XzNEG
 ja1xcYwuzMUCSC34MLEq4cIWxZb04n9XRpldnyPrH4OUGPd+tZ+kC9PWL4WLhBSLKdEbF4lG
 c33/i428uWfTH/wgbeoH9SJb9P6X+uRYeXDBiXEeBFt/y8NlLkuNrk3OeDyBP2QyC8cUIWmM
 lsclERdN1Kjn0at7IMuxLCAZDfkwYCiFtR4TZui17r1MyH2Q7gbDB7GDycpI5XUzlVOmWPlu
 Lf/4GjpS/A3AQ=
X-IronPort-AV: E=Sophos;i="5.81,261,1610427600"; 
   d="scan'208";a="39665510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXC1cOI5IZAtlWV0DL0HeS98u7uMhMOKYJKXrJh0oBd855Amy3jYvUFmo4AJHGvCQRruWJ91CKCoNZ8P9DO/zqu+waiUbqkx7rm3G3sKkEfYkiwPNCehtrkvdAnFsv1spqINnm5BzZ00CleGfuwSYzDSjmVv1TdtdKMjnl0Uq3mU7+CPqiy0fq1DTqEhdyYIP8jp6TLg6gShtBuzU7WEX8X0/9gUSQbpfFKGSqMl5dPXeaqNcKkit7rQfWopOe6a/xO/p1rbkDlK4HG843S25piSQGikJbz3sUsOsk3BsCIbnDRebRzf1rCu0ANmSOCr4KohlLOc+/5SOysrf2KmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w90PAMN+ZOc/LLOMhwDArwCDErFYNiB+ygI+sb58HKw=;
 b=E5Jx6DAnbF7HwrrdrN7IQYwEo2kpdsJyNArz6mWZc/AySHPxdGyar/rDB0lYZquj47vrYvUZCOiLmBGrJoxeznbRCGxpWfOKRTYKvLFPelzlIqIeJB35qzJvpY6cKbC7tOFS7ud+kiopWu6UpqnoUmknKSo7CsP3Ma4RUvQo1jv6tw7FSmMTK7uaYccL5JfYHFIXuGDfI4RnZZuIsfccDsjPkzm0Bb+//WRf7cnTkMChvsn89DVYiyx+qZW0t0tfIYWp+PmHmjgavi1+mM3Mm1JsWjeIu+6EqZf/TGiP1sXaHde93zEc5PfeSgl1I+yZVaAR/doDOviZHgtF/5kGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w90PAMN+ZOc/LLOMhwDArwCDErFYNiB+ygI+sb58HKw=;
 b=er+gmSKhdbJQD+gQWCZ66+Y1D78k8MJhGB62jE5cdBd11HXen/E0yRc5XWXKGWXm/mvdxwptaIppinJsTdhugjShKHdZafIzO4m0OyDyvh/qYmyytCJkaXmBN3LpbYv3CB2nGF/8jx1WTCUIhqQuhzQepnZT+mzXiPDQ9dlQNFA=
Subject: Re: preparations for 4.13.3
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Ian Jackson <ian.jackson@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Julien Grall
	<julien@xen.org>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7b3a06af-103a-db05-b494-94f5a1081bc7@citrix.com>
Date: Fri, 19 Mar 2021 11:44:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0511.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::18) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89308fae-0f2d-4be2-d9d4-08d8eacc52d7
X-MS-TrafficTypeDiagnostic: BN7PR03MB3620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB36206D431BB3EC32DA6C1489BA689@BN7PR03MB3620.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1HXqhpPZoTx2phesDRLB22Se/sqV/uOBRR/mkUeomWvRWLvSt+u9bUT6x7so5S1EK/wnxqkSbgAmTSVBALWcWpheH4iU/WSrUbnpTCmS921APfIVOPJ1jQtsSDmdzFaCrJpadGy8uMgRcgIJ7I55s2VhbxxPhSQSn8Uc06lY8e3K05DLSx/XYzmIwl42q4bf1AsawlSGbH8t5P31NwGi30XnRTbnnlA21Umxd5kvrcgU1H1IKLk/uvyeRXTjyTU/zCMAvm9DUr54Er2hH2es9UhPequjmvn3oBGIenjXhYXgZPUDFGm178g6dw8RDLS5oyjcB8CNmJXx8KPX4T4XDh4aTxb7BBgP8O1xB+qdbDYLnlfvuXQMmGtsQ6UgZvmBfluNiJeJAVC5S0bAwJqEHwnFI777JZVci05vaTfYEK9hq8h16pDWln6p2d/zKKzlYUuKkSV6aKaF+jHCVwjHdLyRRaVplgRFlJq2iKnlk7hyxt0UKZtfIxFk8OPtsgmALzky15V5bqYWosUAmc7JVGYHYGSSFK7UREJciwqpEd+Nz/4vrOD6n6vE3yCA94y6l6o0ZSjaCSwb+xC0mH+KHfsxp+dvhj35ABbw9Jg4P6TKn8YkvOAtV9iYMiKwjRQXgwu0rXwLm9XkCBQ1ee0f5V+Or34Wg/18pjVlDNh3uC1foUXAhNOu7iZZvzWqRA0chBHpV/drg/dL1rtOaHKF4BcDvPX7vIDUef+oEGyH2tA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(31696002)(478600001)(66476007)(66556008)(2616005)(54906003)(66946007)(316002)(53546011)(16526019)(86362001)(110136005)(36756003)(38100700001)(26005)(16576012)(6486002)(4326008)(8936002)(31686004)(956004)(7116003)(2906002)(5660300002)(186003)(4744005)(6666004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SnVETFZaRjkzV0RDRG5MdVFRU20xblpKdWhNMUhxaDJmSzcwbUZJaXNpeTVt?=
 =?utf-8?B?ZmlMQ2xEcmZqZGJqZEh4RGtzeUtHSHJxWWt6dW5ZMmxRZDZ4RXZ5L3B0bTlX?=
 =?utf-8?B?amR4dXVCWExhQTBKbENKalRnK3NQUmprenptMllvU2hKQXR4Q3A5QldsSys5?=
 =?utf-8?B?THgva0h1UlZtVFZkTFJTVUoyRVRUNWpPMWFONlQrbGZWejdIRUp1clM2aGd5?=
 =?utf-8?B?Z0krS0hwejk4WDhjTS82M0ZhaDZzb09pellFN0xsNmV1bXdmTTArdEZOdE5U?=
 =?utf-8?B?WmZOeXRoSmFSQXhqZHlWQlhSSlEyQTZPR0ZXV3YwL1R1Wm9PcCtQcVYySVdT?=
 =?utf-8?B?VE91WExOdHM2dkZ0M0FOQ0RoOURPaHNhc1g0QUY0NzFyKzM0cE8zUDY5NS9W?=
 =?utf-8?B?K0xZaEhjMTBlZ3MwTDMyNGhOYS9hckxZMXYzdVZsblpMbzJBaEgzV01UdkZL?=
 =?utf-8?B?aVZUTzZFU1VBaDA0enVRVHVWbDQ3SWdtRG53TTk1c3A0NGUxZ0RxU1dwQnV2?=
 =?utf-8?B?VWs3RVp5bGVtN3hJSWlYdDZ1Y3RNVlFmK21Wa3FvMkZuU1RqVkh3MW1weDZv?=
 =?utf-8?B?YUdzUVBkN2d5N0pKYUF4OHVFSzNOMFZWZ0VJU083SDF0bEdZTkJGa0c4ZDlI?=
 =?utf-8?B?TkQyMElYTDlxQXlSQk5pVi9iMGVRYWV2dlVpQ0diR1d4QU1Db0FSbXpkcXZR?=
 =?utf-8?B?TkV2T2tuREM1ajluSURCZEtMdjBtemZkQUlJT1lPNS9XQ2tDWnNxdC9jeXVa?=
 =?utf-8?B?NGZ6SDd0aTNsRnVReDFDUWU0TEhFdmZGVU9PeTA3eFJBQ3FPS2hac0JlMmhQ?=
 =?utf-8?B?c0dyUDFDbUFaaFdnSTNDV214YW9NT2MvcDBxTFJiVGQ0a2VCNjNiRnhFZ0xm?=
 =?utf-8?B?WW9VRXpTVGpCdTlORW8wcE9ML0Y2TzI2aFhwbmdnMmpMNWFPNjg3aDRBRXFE?=
 =?utf-8?B?UnlXNENlM1lSWFpKUG1pRFpLL1o5dSsyQ2tYbjJlZ1hneEFrM21QTVdCQmFR?=
 =?utf-8?B?ZnpDOVpqd0pEc3ZYSFJ5cXJmTE5QeDhuUGhxSDc5ajQyUzNGRmZPWFJXbE1k?=
 =?utf-8?B?NHF5N3U5Q0Q2NmNKdldDeE1GZ2FqcWszZEVEWnowdU1JZ1B3TlN6OTBrYldH?=
 =?utf-8?B?OWQ4MXM0d2JBNU1TVU1sSm5ZSHRCTm53Z1RzY1dkVnkxWVQxWWZEZkd1SGlG?=
 =?utf-8?B?UGV3YXE5amNNZkk1MG9NbEhxaXA5YmI2OVpGZ0lDaUNpMzRHUm5acC9IdE1Q?=
 =?utf-8?B?RUR4T1NzS3N3NFFRUGR0cUxFSmNXa0hiaWRZZ0hZT0x3MkNyRTBROGh2ZXdp?=
 =?utf-8?B?NVJkSkFqeDFwUGxRaFVJb1pWWXdYZ3dxMWJOQnlvUjVPNko1ZEJkK1ovaGl0?=
 =?utf-8?B?WVV2TGtyMkk5V2dadVp1WXZGTkZxYlRoM3c4QUpVcE8wNHdVWU9nYkxIM1hx?=
 =?utf-8?B?MWkwT1l4NjM1Z0F5WGxQSW9VNXNrVXpkSUFzMXAxSzVjZHhoZXlpTkh0RHRj?=
 =?utf-8?B?VnBjVmlSSWp3SW1ETVRRaTVuUkJidW5UNlNqVUNPaGwyMXRRd3B6S2V3VWpZ?=
 =?utf-8?B?TXFrTlFhbk9xK09XclMrcGpaci9MMDczbndEa0xmT1VxRG0xZXdWTFJMYUh1?=
 =?utf-8?B?OUEwb2RSSERLeDF2aC9VTkhKc3R5UFFIRHFIUHlyckRUVU9ZdGVrTTBLMERL?=
 =?utf-8?B?VXBBTVhpMEFYTC9lMnBpcTQ5aWRiNHZ4dzUyVzd3WmZGVDZDeWh4NmNJdm5E?=
 =?utf-8?Q?c+clGdIJW0CO2s1DxfO22WNZ6W2BkLccWA39Ysg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89308fae-0f2d-4be2-d9d4-08d8eacc52d7
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 11:44:16.1748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cedvezWIZbaJ0w0z7YVOZ8Dk4DQTkWC4aEOF8Gh842Qooor9S7MwxbFPhE4GS57H5ocNFDnepR8soaWaaJp76GCQowSBlnj8G677YrQkrCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3620
X-OriginatorOrg: citrix.com

On 08/03/2021 09:49, Jan Beulich wrote:
> All,
>
> the release is overdue (my apologies). Please point out backports
> you find missing from the respective staging branches, but which
> you consider relevant.
>
> Ones that I have queued already, but which hadn't passed the push
> gate to master yet when doing a swipe late last week, are
>
> c6ad5a701b9a crypto: adjust rijndaelEncrypt() prototype for gcc11
> 9318fdf757ec x86/shadow: suppress "fast fault path" optimization without reserved bits
> 60c0444fae21 x86/shadow: suppress "fast fault path" optimization when running virtualized

fe36a173d110 - x86/amd: Initial support for Fam19h processors
90b014a6e6ec - x86/ucode/amd: Fix microcode payload size for Fam19
processors

~Andrew

