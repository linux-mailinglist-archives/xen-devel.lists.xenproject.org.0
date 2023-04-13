Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA156E1732
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 00:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520979.809188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn58o-0000uT-KE; Thu, 13 Apr 2023 22:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520979.809188; Thu, 13 Apr 2023 22:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn58o-0000qO-HC; Thu, 13 Apr 2023 22:10:06 +0000
Received: by outflank-mailman (input) for mailman id 520979;
 Thu, 13 Apr 2023 22:10:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9nQ=AE=citrix.com=prvs=46097603d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pn58n-0000df-CE
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 22:10:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef133321-da47-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 00:10:02 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Apr 2023 18:09:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5182.namprd03.prod.outlook.com (2603:10b6:208:1e7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 22:09:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6277.043; Thu, 13 Apr 2023
 22:09:57 +0000
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
X-Inumbo-ID: ef133321-da47-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681423802;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kOsCEgAqv4GvFI5JVXuSC44qWWFvhCNpXlX8jZL2Qhk=;
  b=Mi37dJ7hWm07CgIhi21AwzdaILHHjGdj31DhNs/twav15x7fWa3xRTER
   ISqV6wSy+QtPPn7TZkjAYwHhsvykK6Yq/uxBtXZkQYXsRW1AEihADdI48
   UaPded8LB4K8A2W/nVb0dHff4e8dQGlbVvGIJ5zW+0f9v+pkQi+0031mK
   E=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 105349865
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:acNQZ6mTEvN2IO1VmQ8VXsvo5gxsJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCmuGOanfNmWjL4t/aom18BhQ7ZLdmtNnHQc9+yFmEiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5QSGyxH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 f49JytdRxK5vu2n7JudG9RGmeQcCeC+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieCwWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTODjqq863gD7Kmo7ExwVbl6cnbqA0HGmANdzB
 hY70A0vov1nnKCsZpynN/Gim1aGoxodVtx4A+A8rgaXxcL88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVq/3LqJqTK5OQAOMHQPIyQDSGMt/N3LsIw1yBXVQb5LC7Wph9f4HTXxx
 TGiryUkgbgXy8kR2M2T9lfBjy+nurDZQwgt/ALVU2m5qARja+aYi5eA7FHa6bNMKdifR1zY5
 HwcwZHGsaYJEI2HkzGLTKMVBra16v2ZMTrax1lyA50m8Dfr8HmmFWxN3AxDyI5SGp5sUVfUj
 IX74Gu9OLc70KOWUJJK
IronPort-HdrOrdr: A9a23:37+yoK0WQOwtXHE4mGckygqjBLYkLtp133Aq2lEZdPU1SL3gqy
 nKpp8mPHDP+VUssR0b9+xoW5PwJE80l6QFg7X5VI3KNGOL11dARLsSibcKqAeBJ8SRzI9gPQ
 oKScVD4FqaNykdsS4vizPIdOod/A==
X-Talos-CUID: 9a23:5eTo2m8orICBok6Rf0uVv0wxFdt1W3/n9XjBD2aeWFtDV52qbHbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AmtwvtwxD5Q5UsuXFNO3smrfKGJSaqL+vC3sItql?=
 =?us-ascii?q?FgpO7LXd1FxrHox6QQ4Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,195,1677560400"; 
   d="scan'208";a="105349865"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOQALRFoJSzgxzpef1efsMGDpP5dSD709yaikLV03/aUJaQxoP3lX3lYG4IVuf7HKZHzXa0ChRxGw3E1Bv8tteKmwD4WafeEt8+PxgnGcBgsUnoa5VREd3rBZMr3DheBH7O3HAZ+906blxQCDMalU+TLXAzDmRry3msOVo4JM/Z+SI+t+JWJoxtl7H2trUKOdew6v528kCyhORhkGqBpNmhjH21jjIbBgy/hTa3o3UjG0emTme8RK8u1VKhgyn6ufIcM8txWOJeYtLRrmbHIarKt5ykXdpOKOyr8lzob9sBmyOU5XDPrbhUxmW/81iAMj0PAmtNJVOdCGULlfo9K1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOsCEgAqv4GvFI5JVXuSC44qWWFvhCNpXlX8jZL2Qhk=;
 b=hHRQSeeZx8oXQFJ1xfmyf38dut/bMagXXBaCi+j4R8qzgilQwuF8hzKuwEYfcExPUaLtJu2McBUe5MUEVh7A++TYsvglaUV+kAvzfGdIsnY1JxRqp3CWCnTGHZUru2rH/UZm9BFD7vzH/UvwT3fuRKqXI2I0VywuTFESKQwvauMogIxGI9uD62DUglo8/QIPrpGjeqeyEIVQStmDAyT0afF3ebr8GUEo/0EhcPaz+cWm1K4CylqSXhJJynA+sIBX2U0QB9akcv5/+D6z5Hrzwe9dZkvU/CYmO+iR5iL7jmKyZB3WqlGW6i3KtJ34ILvz+sLTm/9SG48ateNN9EbOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOsCEgAqv4GvFI5JVXuSC44qWWFvhCNpXlX8jZL2Qhk=;
 b=dUk/llRNWMJ+d/jSavaa/Rcw1IPCCXASbJSERRy0Bb1Ag6ws/aBZokowjunKq01dSG6BMDiTibmtU9Zne5rJOzsdIQ0jjAR4DhwNdZGW07RtJ7rv2u/vdi9w32mo42W1S+iXqnPqMU1yXv4wIPRzhwMnckpHKETx6Y0GjsFHoyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dcdc1e90-77f0-16d2-e83a-dc9c12158975@citrix.com>
Date: Thu, 13 Apr 2023 23:09:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Fold exit paths in find_text_region()
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230413192201.3255984-1-andrew.cooper3@citrix.com>
 <bd8f0ed2-586f-02f6-1f16-dc3b3b9c82a8@xen.org>
In-Reply-To: <bd8f0ed2-586f-02f6-1f16-dc3b3b9c82a8@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5182:EE_
X-MS-Office365-Filtering-Correlation-Id: f74696c4-a8d8-4939-e935-08db3c6bd0cd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	asoWmoNP2Yf6r8PXjelYXfpHFe6GD1V06phds8fNoIWqGI5VM6QIdhQYllznpV+of9GkjjJG+IzQQSWdEXxByUurBdrMc2LSltXqgsM9KETTHQ/NRDIraVitUY3p6D9iLzUY3X+4egbcBJqKs3A4W62Wv9PEfHTw8ALRcbdd6+/Rifk55A/fqX2nyKiJtWss7z16+cfeFfWNmKySlvjNgfT/dMNsL/CYiTjEqLt9+canh2/f9FfCrEh5HqZuMdFrLGloufOCSqJHFAw7bJb7Zbc94z/c18tILUxoTYbEa778qBqb3c7DVi9SNhbLoHz+d7tUFzRxp+iHvh/BevmOHlaElvj+7Cw+Z0jSssl5vONzU62HSE4UG8izKsO2Wdcztfv7tcB5byhaAppTW49LMPGAV+86v/QFFz/dAM2Gd89LmfUSAkNOUAwSTZ4rDdgW+u3qHZ4gA41Es2/D7eH5CBTqq+fwSdqXA6+gWY7oGtlzycRADRqnyWdlEodTQZFKlzpzd9XxlNwW5HtDjKvKl1Ir69FTDn7Tcv0EyMeWVyS83BshRgsXSm3fW3Q90X2alREUI0WmJh4xrPFljIOZuBB2veXstsyIx9tIS7uJklU4JeLZHlMqmHKkHxew5tB9zpziFtqjEYQhICJHT3hO4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199021)(2616005)(83380400001)(82960400001)(41300700001)(5660300002)(2906002)(31686004)(8936002)(38100700002)(8676002)(186003)(53546011)(6506007)(6512007)(26005)(6486002)(110136005)(6666004)(36756003)(66476007)(66556008)(4326008)(66946007)(54906003)(86362001)(31696002)(316002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWhsOEsyS2JzSUpGVjJDZDZsclNDemdYeGpUcUUrVFR6ZWNSUlZFeDgvOGQ3?=
 =?utf-8?B?bTdIT1pTZkxIUHV6TGZ0SGRsaXk5d3kySTZ2SWRGOERxVVJNbndhVzdlc2ho?=
 =?utf-8?B?bjE5SUIrVWxITlhPZkY4bHpzQXdxZHdZR2pkSUpteENFcUhNOEYwZ0NDOUIv?=
 =?utf-8?B?bnVEZ0hXNkJpZWJPdHhLR1VmVTQyQzN5YzMwS0IyenVobW5jRkdjalkrNmdy?=
 =?utf-8?B?MEFMaWMyY21VSmdwRWowVFdpeWhJejNsNlUyS0xlbm55V09NUGl1UDVveUg0?=
 =?utf-8?B?ZWgwcysza005aERLTndxSzF5a2V1Y1EyTlB5K1hLRzZpR1NicUZFWnV1VmdH?=
 =?utf-8?B?Z3FIbk9Ed0dqR0RMVXhMUWM4Ti96bEYvOTJNM2VOOWl1WjlmWEY4Z3ZIY3Jo?=
 =?utf-8?B?ODF6MTB3c0JveG44ejNpUkhKaG52QjU5WFQ5bFkxSEpvcThmTUhDYlRiQWZn?=
 =?utf-8?B?czlhSnRYaGV0eVR0L3VCK2JSOG5EbHFNOTdGZnlXRGxBb3hFK2JNZEUvQkky?=
 =?utf-8?B?TGtKd1gza3RwdzF2NHNPQWxpbVVJcklXZzVFR3JHSklKc2hCUWcvanUrM2ts?=
 =?utf-8?B?ODMwRExHSkdIK1RUY1ZnTjl0SlNyTFl4MU5QTnFPT2NyMjJXOURjMUtkN2Y0?=
 =?utf-8?B?UWlDckZxU3RXbzJWSHVFRWtrWFVPOEtWb25RenFHMFRHT0FSck4rb1hGeUVO?=
 =?utf-8?B?Z281RVdpbTkydWlya3NtVi9UT1EvQnJ2QmFKd0RObmxxTjV0V001aW9FY3hS?=
 =?utf-8?B?bmZxMkFnNjg4cjZ1VEQ2K2tXam1OVmY0V0pQNzhlc2xoWUxtNDc4K0ZiMDl1?=
 =?utf-8?B?THBIRzJIMGZBSnQwZVp0Qnl1cUhrRzhmMVBBZjB4TUhGTFRNZERFWS9pV1ZB?=
 =?utf-8?B?elpTbUVwTE5BdkR5UzF0TjVuZCswbkhnZUQ0UjdaS1c5OFYzd1pKZGlqYlhU?=
 =?utf-8?B?Y1h3WlorMmF0MkJwZ0xVLzRyZUdjNyt1UHVpWFJDdE05SnRyc2NhS2h4RGMx?=
 =?utf-8?B?ZGNtaE0zYmU1STZNOUJlMWVSUEZ5RGVzcDNNQjZHNXd6WEZQRmZYWFpIRTZa?=
 =?utf-8?B?WXVyMmNyWmQ4cGY1S2thNFFZZElJejdaMFpCbU04KzBJTktHK2IyL21KbHhM?=
 =?utf-8?B?bkZIeG9pMnJJcEJVMjQ0dDRYWjNaUmlKL3VEVWo1dU9lUXo1anpDeUhOZnN1?=
 =?utf-8?B?ZWZUQzM2ek9adm9ZTWVNaEhvMjIzK3BjL2xEQ2lVYkJLYkpUK2N0NzMvdElv?=
 =?utf-8?B?RUNpRnpDblVVSUJvRTRDWFlQcXU5ZzMxNmsrM1JnUDRUUUlDaTU1RW5RVjA3?=
 =?utf-8?B?Y0VBMk1tRlFTbzFQNWNRL0R6U2FtQ1V6ei9rcy9jb3NUdTUyNm5tUURrYnM5?=
 =?utf-8?B?cGVqbWpMWWRwbEk1Z29jM1dCUW5EYmp5SUNBc2k4R2pBeEZLdjRnSk5zYk9S?=
 =?utf-8?B?ampTemM4bStNeGFsdmNobmlsbTJhOUowdmQ3RGZwZ29HdWJoTDBWVTdZWTVl?=
 =?utf-8?B?Q3RETUJPN3RLRjltenVmcC9aT2dyK296dS91VFNWWjNoTzFXUisrcGtIYW9s?=
 =?utf-8?B?WmJRNGEzODlkZDdTS3VXbUd5T1hkb3F4REJydGFIcVBzZVU4bnVFTmIwREcz?=
 =?utf-8?B?WUs5MmNzQnpYYW5WM2tQSzRmNzFaWGsvM3k4Uk5qMlRFdEMxZ3dKb2tXOUZB?=
 =?utf-8?B?VmtSOEt2VkYyeWIwWmcrU0NublFkVFhLZXRoSzJSUUltb0lkR3hwQ09ZSjJo?=
 =?utf-8?B?MmpRZU11cWt3dVhRbFV6dStZbjkwbVpwL25RYW9POGlOU2pkTjQwU3lpN2VH?=
 =?utf-8?B?WCtpend2Nm5YYVNyc0ZVUkovUGZHZENtTzhXUmZBWGRjWEd5eEZUTCswQ3Rt?=
 =?utf-8?B?bkkvMkNlY0R6SlBGd0J1bXBxNm5oTnVOOWlxK2hYNXNLVWl2anpTK21wWXBl?=
 =?utf-8?B?TVlMZWowUVl6NUJDQkZqN3hKMmZmL3NhcEFwb05OK3MyZ2Q5a2h6Sm8vYjQ4?=
 =?utf-8?B?M1k1c0wvdEo0QnF6aGV4K0U3YWtKMjYrcUFhWmhxR3BRZENBSFNXbGJpZWVj?=
 =?utf-8?B?UmlVY2hTVFEzeXdXUm45VUxZV3RIRk5xeUdqVlp5WlJZUkhzTWF2MjlRNlZv?=
 =?utf-8?B?MGtYOFJNSmQvSkVuT1kwZkZYd2xmcjVHcHgrN0F2MGVpcjhWVVJ6NFJqMEdN?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zivnrkVRXoWT5eJdix3ZpBo8nZQFNFTGkJIE1WTvpTyMSklDsk0RjNKLHXJUBtOm3dJYHMm6TLzm5LZ7fPByCn3JDUWSWdTy1a9VH5Cu6mJaxD10VCRjLGVyXxdKzIbX/BAHsPA/EjWDTHuowGIpm/TSDl+3D14ebgBTn8G1itR30hisJizNYs3FPniZmQaB2EiUKiBbGUoIkXypBYrc+5A4nOt/lumk8CMiEVvLg1cJ++sbiNbOrkXOVNR0DFBfvHfeOirATAZDN9PAAinRWaVk9KlgWf8pF8kRXwT4OoEEZ+3tyPdbMaEGTyP02fZ75Wl/2GeA0YlbgtNJhIrxUaxI4xufSHrUnkiiYeeOJ7zQjeujoT4qQ75EVQjbgl97uvshcaQRL6UlPF3vz5DKLGq7ezkR80a7JEB/MgUWxAGd134i2HKeIDF+ADU1GYuZ5rLmuPQijDRGV9m4F+C59751HCh7t/pV8BOfa/k1WMMlr4+FIa5HGTEApGkxmXC8PzbxN4JS9cMnJ3/jK2scvYQ5MaRvPpEMjXTN2njiDCjDX1Jq9CLy6fABCYlQ9rlGtvlgfy2HiFvhilsarN64/MT9DwQu5hDHKnCj7vVDztZeVWiJk94R+XojIin5x3u5c56uW3TY3PVrdQJDPmMtJYgJmrIc1Ejn7dfWUSBjCos038nw48Ycd4x3CRKTaa8rAs1YKUe9W05tFp7Jx49arVVg9eKp8Sp/asHp0p/kdP7Mov4+VA8yP2ZtBh1GXC2YM8bUwdCvF+oCnMhLd6oDF4BmBWzPKAqcr6eI6C1Z1CDiLBovypLdgFNKJXqXTI2xWatI/708sAwlDyhw7IZ1eocWeh6d3r1z1QpcvWdYOgE2s2HqZed4bVmgMbCD00qn8UbYe3Rdj+yKrsFa/Ysn8w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74696c4-a8d8-4939-e935-08db3c6bd0cd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 22:09:56.8903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8I/HqXrYqgIeRd2QsYrN0nDJiA3jFpv1dKj+AfAMDtveP8vjGfEpLKeneOZenOayGy3scNGW4e6Re1yWUrXdqbhKDzAf2bhR8ubYdLRaKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5182

On 13/04/2023 9:13 pm, Julien Grall wrote:
>
> On 13/04/2023 20:22, Andrew Cooper wrote:
>> Despite rcu_read_unlock() being fully inlineable, the optimiser
>> cannot fold
>> these exit paths, because of the various compiler barriers providing RCU
>> safety.  Help the compiler out.
>
> Please mention which compiler(s) (including version) you used.
>
>>
>> This compiles to marginally better code in all cases.
> So the code itself is fine with me. But this raises a few questions.
> If this is marginal, then why are you doing it? What's your end goal?

I happened to be working in the area while fixing a bug.  But am not
justifying "because I judged it to be worth doing" further; it is
entirely self evident from the fact I sent the patch.

Whether you meant it to be or not, the request comes across as
insulting, and is not something which should be made of any submitter.

But as this kind of thing has come up before, any further debate on the
matter can be made to the code of conduct board.

A better phrasing might have been "I'm sorry, I don't understand.  Why
is this an improvement?"  But I'm only guessing as to what this issue is.


But moving to the technicals aspects, in an attempt to help this along.

Do you understand what folding the exit paths means?  It's a term which
is used frequently enough on list that it ought to be taken for granted,
and is what in my opinion makes the patch entirely self-evident.

> Lastly what do you mean by "all cases"? Is it all arch? All compilers?

Yes.

>
> Anyway, if this pattern is important (TBD why), then I think we should
> update the CODING_STYLE with some guidance. Otherwise, we may
> introduce similar patterns (we already have some).

Perhaps, but I don't have the time, energy, or willing to dive into the
viper pit which is trying to make any changes to that document at all. 
Especially when there's a laundry list of more important topics that
ought to take priority...

~Andrew

