Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5FC50E260
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313020.530479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niz81-0002k3-R5; Mon, 25 Apr 2022 13:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313020.530479; Mon, 25 Apr 2022 13:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niz81-0002h1-Na; Mon, 25 Apr 2022 13:51:49 +0000
Received: by outflank-mailman (input) for mailman id 313020;
 Mon, 25 Apr 2022 13:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2itc=VD=citrix.com=prvs=107928106=roger.pau@srs-se1.protection.inumbo.net>)
 id 1niz80-0002f0-6W
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:51:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d78c31e0-c49e-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 15:51:45 +0200 (CEST)
Received: from mail-bn8nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Apr 2022 09:51:42 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6708.namprd03.prod.outlook.com (2603:10b6:510:113::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 13:51:41 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:51:40 +0000
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
X-Inumbo-ID: d78c31e0-c49e-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650894705;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=swq/NFteAEPZCqMmD+DtSbe1Hkzh3tvf2p83sT0lqsc=;
  b=Pm33D1vEE4T+R1c3MPeAHcOyu5bEjx0v7KRpE5M7NyYL/DJUvz1fx7wZ
   ooFgmFTNouGj9gQyH/gb3pSFmEq9Hg56qM9ATzoR/baaUVXAAAh3gBcJl
   ryvRY6txEhBA4Faiw7mgC2Y/5DxGl5g49JwLnME7e8+H0p33o/mVhabIM
   0=;
X-IronPort-RemoteIP: 104.47.58.174
X-IronPort-MID: 69862307
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Prdj5qDahT6/3hVW/y7iw5YqxClBgxIJ4kV8jS/XYbTApDIqhDMPm
 jFNXD+Eb/bcYWbxKoglbNmw/E0AupODyIM2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jj39Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhj0
 9Jj5LiraD4XBZ/Hnd4BWgdiLhlhaPguFL/veRBTsOS15mifKj7G5aUrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t2B8mcH80m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLn51ielKGUHwL6TjZU67C/d8Rxq6qSuO8HzUOyNH8EWgX/N8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa60iDXtT7GRqirxasvBEGXMFLO/Yn8wzLwa3Rizt1HUABRz9FLdYg5Mk/QGVz0
 kfTxoy1QztyrLeSVHSRsK+Oqi+/MjQUKmlEYjIYSQwC4J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjRxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:OlDAOKP/7gokycBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.90,288,1643691600"; 
   d="scan'208";a="69862307"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3RJsEHBESslkmubEFr1N5L5hb7bFGFk1M8sOTlHr9L4RHfIvWSNHJhRnNYU/ILZ365xygV126whpj+9K0ZCldlRqPpLI8DDE588wrM8k+LxwhJmYK4nW1di4ta5fXeo5Ln8rPfdQvLsyhMpE6sMpelFbd8JbRcHqjKuAwhacBAQm+IAm/HoQjuO+xggK+mACKqipJGuH2vBjkVl5ElTRso7rSSENlLGFtLU8jvgVrwvpLo1PS62NcIGu071UOpDDzWcEeLBa/ePv2IUiEUemiUU8iA+XmjMSrzVl/pCRuFPygeiEKJNYppHs2aOc6uus0so5jgA1eszKvW1EtC3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=du4FYpbAWINry80qew7JSN2mE9addizpxnnZcNhWFmM=;
 b=eQC0mJvW2dM9LKhLWsP059KUHkCTfYSiPt449FQYxLeWLicWjnd5CHo4N7/PEN/B67k8Cah5fd5gLdBljd4rGVQGwNQ8rU2E5rgafsQ4vMUVQpgNuYhH0vOsRkrSmez0nhK7a7yRLHv1TDjSUsTOTqQ/F0pQY6MvJKG2xC7AJxMqhwlR4MAGyhHfJM/DVqOnzrwJpHmKrUv62PBded7Co8a63xFenZiKHlkG/RKtRNOuLMttOHImu1kA1ShbuIDwZdIXb/aIwcFRszOXL4F4xrgv+XhyUuhbAAnqMbKSrxEjsUW6N9sM2Mh+LZmbZQnTqCVYb85QM65h9Z5NbUscvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=du4FYpbAWINry80qew7JSN2mE9addizpxnnZcNhWFmM=;
 b=qhP+MmhXN6ELsSD80SIi3/i9jlqRHtKSRXF+49RVHGZfqiDtokLmgZcqZxY6A9VJMw6wpzO4zoINZewIZHi+Vgrk16xRvhvyet7ssIWzk83Ki1/mqpocNy9Ij7kFYlaK+pl6gJTwIUUiut69m8dS0ZG41hqWYlRQe1D2rK9M02Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 Apr 2022 15:51:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86+libxl: correct p2m (shadow) memory pool size
 calculation
Message-ID: <YmanaIcSMviCmuf4@Air-de-Roger>
References: <368e2d54-09f2-2081-349e-571bfeab13af@suse.com>
 <YmabFt952DO29pIA@Air-de-Roger>
 <039010e6-523f-851d-a432-d7f1a2fe5eca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <039010e6-523f-851d-a432-d7f1a2fe5eca@suse.com>
X-ClientProxiedBy: LO2P265CA0291.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37170875-bf2a-4a83-de91-08da26c2b9a5
X-MS-TrafficTypeDiagnostic: PH0PR03MB6708:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB6708D1FB69DC9265ABA3F81E8FF89@PH0PR03MB6708.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+Rl5ntBd1uPj4DyAsNjQmaN0xR4P0koLZL37/vlix+fcDaF0QPMZxTmtoO1f17iCYucOVfgKxp8VVlZUg+Kkx4F0bXbBL+UMuKTnQcGEagzk1Qp4RyV2LGCdoCKTtOV9Or4rQHa2IyVCgP1NK22NJ0j6SSZFjFDYo9kb3i9rEq0f9gLfea6TLC3iZDgY6uioxFF9tV5CEAtrbF2ti5VGU59di+j5J7wja9ufEjhIJODaHZC3rYvwWqJmQRA9Wy0sIeP9DcY/jdhklC7csIbuZYrl4wF4trajXLNIZM0S0uQ6xixr1WylX5Dp7XcVvPiG652VAPdw3WVJXGzMuCHtBRrvECH8tHkLRIC4TUlKGzcbs4kqI2p85hBGnHWqJBD97lTYjH9lutOLycGfclGhqQhgN5qLvrS6ryiWev4HtqXDM6/O4tbqWVPxLr8BVqWYN9Fp0XBLnkeKNcxeO3Y7pz/11mAZRz5jhX+K7C2z+dclHXGot1jYM1D8kTxFScp9ztqlrRlUPVtowIn4wsOe0FoND2mDuCf1IkClpfE8i7f2qZCkC0J+6lXPbE+SHrs+UlAnQSrnX4992shVzqVQ4tzBr+vksoNqvAzN2eZW1bKC38TTS2wPpQH1N5pn0VxVDe16AU5ZyxIWh/zvd+WeHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(53546011)(4326008)(83380400001)(8936002)(66556008)(66476007)(5660300002)(316002)(8676002)(2906002)(85182001)(66946007)(33716001)(86362001)(82960400001)(38100700002)(6486002)(6666004)(508600001)(54906003)(26005)(6512007)(9686003)(6916009)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFNYT2paWTF2NFdQWnJMcThzTUpQQzJaQnFjYmxCZ2E3Uk01M3VMR1p2ZHRZ?=
 =?utf-8?B?amFpei9HN1EvaW5vSG9QbGIraVUxNU9Tc2IrQ3B3RXlLckRQalJ3eWg0WlJP?=
 =?utf-8?B?ZS9zMTFSaDErVGdPTm1UYzdxT2JjdGRjRUdpaE9oNGxES0xaMWdPTUgrM0FF?=
 =?utf-8?B?WW51RjdrQkxuQkRqNDliNndidWhiTGk5N1ZYVW9xeXlaMnpaQTlUY1o2NGZ3?=
 =?utf-8?B?TzNaTWwxVHJiVm01OVhXK1NTbldrRWZ1anREdlR1N0RiNzI4MDh6MXBkZkhv?=
 =?utf-8?B?TUhaVWkzcjE3Nkk1aWh4Y0lDWUNQK3kyYzlRUjFGd3JKTmU4Ylh6aEZ4cG93?=
 =?utf-8?B?VEtxSVVTeDVUYUIycVE1VlNhei9TWDJLbk1PamtQWE5ZbldxNk1JYVdoZlZS?=
 =?utf-8?B?MGIrUko4SzB6YjFmOWU4Y3d6dXUxb3krWWE1dWpPdm9CZmE2NnZlY0JKTUpY?=
 =?utf-8?B?WGswWXJXeS85ZzlBaHJMblhUVDYxL082SEJ3ek5oazFqU3JQdU5xVXNIVnAv?=
 =?utf-8?B?WDhEL3lKT2NaRm5CQVhHRWlTeWxoMlgyZkdzYVR4dm16MnR0REVnakMrVWJn?=
 =?utf-8?B?NmhBTWZwak42QXN0U1lsNm9vQVhSVHk1MGJsSUp5ZEJ2K0QwQTByU1g4S3V4?=
 =?utf-8?B?SnEzMWdJYVpoR2l5dTl2QzlTQXM4VnFMUTlWV3RGNU5jRzBFbWlFalNLTHJ1?=
 =?utf-8?B?b2picnN0cjVGdGJBL1JRNlB5SDgrUFJqSDRiN1JxWFlielkxd0tyeUFPdzdO?=
 =?utf-8?B?aml0WE84V3Q4M3JqYXpZVHFFbjY3TDAyeC8wYzdoQit5U2haRzlqT0ZWUEww?=
 =?utf-8?B?VWdMSFAxR25mYjlEd3djQ1lxWUVhSFJBOEMvYnN6RXZqMlRWRG0wc0tkWnZ5?=
 =?utf-8?B?azZyQUl3bGpYS0Z3N0NmdDR0WWJkcG9mVGI4bituOUxXZTZ3QUE0cmFCKzh0?=
 =?utf-8?B?THVyUmR0LzV4VmxBTHdXQzFBMTl6RFVJMjFqTlJubU5nWkhyaTFqMW5GUmFs?=
 =?utf-8?B?d093NXpGUlRiNnArU055NmdubDBUZUJiNnhRdXZPTDhwenp4UkNsT1phTmdq?=
 =?utf-8?B?T0xTOHFRSWI0aG96Z2JDWUdmYWNoenRNSTI2djNKY0Zzd0NCOUxmMHI4eDJo?=
 =?utf-8?B?aG5NSWtING0xY0tDeFkvZ0hCa3UyZzFzVXJQamJSNExWZUhGMWsweks3dHRu?=
 =?utf-8?B?N1JyQ05zVlZ4QVFmSVB3RHdUOHBTdkhyRjFKVk5lWXZiMkpjNlZVeitMeXA0?=
 =?utf-8?B?b0kvbDRZTE02N1cya2xGWjhISzV0OS9UYUE5SHNJbVBDMTRwMU9ETTQ4YjFR?=
 =?utf-8?B?N2c4eWgyN0FHWXNuK25kQkVpd2FmckRwZktiWTIxWUZzWXdmRWdQV2xNazhG?=
 =?utf-8?B?aUJIN3ZsUzhabWQ0N0tLTXVVbDZ1ajhHS3JFWi9YcmNQSDBuVTBNOTVFY0U2?=
 =?utf-8?B?ODdyRmZidWFYYkMxSUJIUW9FOTRQckErcWVhN0ZqWEhKUnRVbHRCcElTK0pU?=
 =?utf-8?B?SlpuZUhPUlZtdWZkNW81bWE5ZUdnbG1Mck83N0FST2RWM3hTUVdhNGc5TWx0?=
 =?utf-8?B?R296eDJha281VmlOSVNJdXZ0ai9WdXAvU1NtaGszdElmdlVtdzF4eGQveUo2?=
 =?utf-8?B?WXd3bzJHbnZWZkVqUzdBejlGY2lSVGJFTExPVDlUMVlQMjlpb3YvOGNFNVdT?=
 =?utf-8?B?Um1uT2liVzErbDgvNmsvRTYwbkJHN3hxWHRmSTZwVjN5TE41UG1YNlVjUTdK?=
 =?utf-8?B?UTM0ZlZ5b0FDc1JLY1BoZThkYWY4Q0QzSlRRdEo5NHp3ODl5SWp6bVJ4VGph?=
 =?utf-8?B?WVN2WU5XVVl1ZTBaQ1JjbnRVNnRDYkJnek53R254d2pEcGJkUGJZczBMaExa?=
 =?utf-8?B?ZVdMdkdGUmx5UUZibS9YS0hXV2VDejBPWnc5MlhEVWJUVktvWjJmT0I4alpG?=
 =?utf-8?B?b1E3MlBzWXNmekxQTTA4T3AzczlqVlNUZVhGOWZ2ZDlSU3BYOFQ1aittKzYx?=
 =?utf-8?B?cDFtWHNDSDJjR2J5Q1Z2cWE2YU9jc0sxQTBLWk5wd2NINTJwejFOWlo5OXhi?=
 =?utf-8?B?cG1ubVQ0cEl0eERiVFdHYU51N040QTZ6YkNVNzBWNzNFU3hSeEpFTGNCRVhF?=
 =?utf-8?B?SGZrUVU4WURLOTY1M0o1cEp4T1pjMUN1R1R3b09ZWXAvRW1VK1lUUUpQUmRp?=
 =?utf-8?B?VUF0ZTVjVkpva2NMdnNJUzRDOWdtQmRLNlhCUEliSU00VjhSMFBIbml6Z2FG?=
 =?utf-8?B?L3gyNzQ4VzVaUmUzTEhpcWNqOVNwOVJ6RUg3NkZUQlVKRnpuRUY5aVRtRzM3?=
 =?utf-8?B?TTkvbFdiYmg1ZUxQS0JJUkFGZ1VMMnNmL250U1NBQnE2RHp1bEpZR1QxYVRq?=
 =?utf-8?Q?wiF5pdyrjmv0+8DE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37170875-bf2a-4a83-de91-08da26c2b9a5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 13:51:40.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3e2n65RWswRYc5QDcKmK93hJ8jq9hPLWF1nfyro4hNqYUah/c/gsls/vnQ5JD2YUPbhf0DXDPQ5JLaJO/+x6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6708

On Mon, Apr 25, 2022 at 03:19:46PM +0200, Jan Beulich wrote:
> On 25.04.2022 14:59, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:49:34AM +0200, Jan Beulich wrote:
> >>  char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
> >> --- a/xen/arch/x86/dom0_build.c
> >> +++ b/xen/arch/x86/dom0_build.c
> >> @@ -317,9 +317,12 @@ unsigned long __init dom0_paging_pages(c
> >>      /* Copied from: libxl_get_required_shadow_memory() */
> > 
> > Could you also update the comment, maybe better would be:
> > 
> > /* Keep in sync with libxl__get_required_paging_memory(). */
> 
> Oh, of course.
> 
> >>      unsigned long memkb = nr_pages * (PAGE_SIZE / 1024);
> >>  
> >> -    memkb = 4 * (256 * d->max_vcpus + 2 * (memkb / 1024));
> >> +    memkb = 4 * (256 * d->max_vcpus +
> >> +                 (paging_mode_enabled(d) +
> >> +                  (opt_dom0_shadow || opt_pv_l1tf_hwdom)) *
> > 
> > opt_pv_l1tf_hwdom is only relevant for PV guests, so maybe it would be
> > best to use:
> > 
> > paging_mode_enabled(d) ? 1 + opt_dom0_shadow
> >                        : 0 + (opt_dom0_shadow || opt_pv_l1tf_hwdom)
> > 
> > Or something similar.
> 
> Originally I was thinking that people simply shouldn't use the option
> when Dom0 isn't PV. But meanwhile I've figured that late-hwdom may be
> PV even if domain 0 is PVH. So yes.
> 
> >  Maybe placing this inside the sum will make the
> > expression too complex, so we could use a separate is_shadow boolean
> > to signal whether the domain will use shadow pagetables?
> 
> I think
> 
>     memkb = 4 * (256 * d->max_vcpus +
>                  (is_pv_domain(d) ? opt_dom0_shadow || opt_pv_l1tf_hwdom
>                                   : 1 + opt_dom0_shadow) *
>                  (memkb / 1024));
> 
> is still okay-ish. Note that I've switched to is_pv_domain() to be
> independent of the point in time when shadow mode would be enabled
> for a PV Dom0.

Thanks, LGTM.

