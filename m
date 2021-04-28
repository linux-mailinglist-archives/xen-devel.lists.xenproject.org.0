Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F1536DEAB
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 19:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119527.226042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lboOT-0007OI-Lq; Wed, 28 Apr 2021 17:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119527.226042; Wed, 28 Apr 2021 17:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lboOT-0007Ns-HN; Wed, 28 Apr 2021 17:54:37 +0000
Received: by outflank-mailman (input) for mailman id 119527;
 Wed, 28 Apr 2021 17:54:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8fo=JZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lboOR-0007Nn-Sr
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 17:54:35 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d437c87-0d52-450e-a649-2181adc5a218;
 Wed, 28 Apr 2021 17:54:34 +0000 (UTC)
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
X-Inumbo-ID: 1d437c87-0d52-450e-a649-2181adc5a218
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619632474;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+85mThslUdn7Mqn4W4u4tqNhNUT6oqVngKQkRJ0P3cg=;
  b=PcKnFTD7oRjHyFR7VCbH5YHWs9mGMoiH9AOt2q/A9/QAgUA/N9ayZtTj
   bNObvGE5kXlW3BNowL8zsERqNKB9vCKWSZPWy9t1rZqfESBao7IyHvjvN
   X16u8bPnk5SbxBiSNHpzkXyX/ofp+m+T43ZEHZEoGSMWV1fO2OZqV1FJw
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qgj1cDKD7cQVnOjOnjfp1jkT2fBM0b73+U1gQkcBTRns3CwnefSbUmz6Yww7FoUe77Cz5vkJni
 owKIWI6XUbJdJTuEHTMTK0L75mYS0Lrege355s6PaKj8tN/1Gxq153+84TYxbKiaWu01zOw5JS
 WRja7yhTg2vqaPmgt2gNAuCsd2EkXITeqSBlYXhXrrBtGJ2B944ire+5zMgEsGQeC9OHbOOr2z
 W2v1s1CaOWvJBJp1nlr6YIEfMO+LloME43yKeZTP4cQ3O13Z/ouAZNQGODXkJnQ7sa2jB3rTnJ
 898=
X-SBRS: 5.1
X-MesageID: 42647182
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Q2Dj/6uvS/ntl+RkmN7HyzRa7skC24Yji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwSeCBtA50lGJ
 2Aou9OoDS9cXoaB/7LeUUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2sjehlIxqov9n
 WArhzh6syYwoyG4zL/90uW1ZRZn9P91sBObfbjtuE5Iijh4zzYHLhJdKaFuFkO0YaSwXYs1O
 LBuhIxe/l0gkmhBF2dhTvI903e3C0163nkoGXo8kfLhcDiXjo1B45gqOtiA2LkwnEttt19z6
 5Htljx3/E8bWKi7VHAzuPFWB1wmk2/rWBKq592s1VlXZYDc7gUlIQD/SpuYec9NRjn44MqGv
 QGNrC72N9qdzqhHhLkl1V0zMfpdno+GQrueDl4huWllxJSnHx/0nICwt0eknoq5PsGOuh5zt
 WBHaJymL5USMgKKYp7GecaWMOyTlfAWBTWLQupUBvaPZBCH0iIh4/84b0z6u3vUJsUzKEqkJ
 CEdF9Dr2Y9d2/nFMXm5uwEzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQ2GKTgKr
 WOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+c06So/jMNpbhuoXgAbbuDYuoNQxhdnL0A3
 MFUjS2Dt5H9FqXVnjxhwWUdGjqfmD54JJsAInX9+Ue0+E2R8hxmzlQrW78ytCAKDVEvKBzVl
 B5OqnbnqSyonTz3Wug1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmF+OJhp1SdLqAB
 dSzm4Hvp6fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IPDdo4nCI0lHIh8Dx/CGRAwuQsCkh
 YDVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7VTFtUudoskrbmABXyGnVPOWhQpGfUsXun
 RBt4skxJaQkzemLmUyxM4iNkdXVWiRCLVaSDieaJ5sgbDtcgFoRWKsjTiX4itDPFbCxgE3vC
 jMPCeUcfbEDh54tmpD2qjnyl9ya16QZll9cHx8rI17G1nXo3ob6574WoODl0+qLncSyOAUNz
 /IJQEfJQ5j3Pib/h+YkjTqLwRt+rweesjmSJgzebDa3X2gbLCSnaYdBvlO4dJOL9b1qNIGVu
 qZZi6YJD71EPkSxgSQv3opURME8UUMoLfN4lnI/WK41HkwDb7uO1xgXagcOMzZwG7+RfqEua
 8JxO4djK+VCCHWZdGHw62MMGIGBRPXvGKsT+Yn7bpTprk/sbNvH5/dFRvEvUs3qykWHYPRrg
 c5Rq8+3ZXqfqlIVOYWczhC/lUomM+URXFb+TDeM6sbRxUVk3TfP9m1+LLGprokP12ZqGLLSC
 2i2hwY282AYjCK2rEbAZ8hOGh6aEAz73J54eOJHregfjmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 IS2aDEo8anMw750hvXpz11P+Zn9HumW9q7BEapFfRT+9K3fXSKja3C2r/+sB7HDR+6YV8fn4
 tLaAg5adlCkCAriMkP6ReJI5aH6n4Noh95+jFollnkx4ig7iP6JCh9QHPkq6QTeyJSPHiOhd
 nC6s6C2h3GkWB45aU=
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="42647182"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRzuySKaLvpnVs9kMEIwGb22VaocQ9HShOtMQzjw0Qg0nBaUUtfJT7S1RXAdZCujL7PHaRtHKC5mCpBrOd8/jltpNERWUC/xVED79luQEyJlmIi4R8OvvA4rmMrFEv7/x/CsSokH6YLhCTZiZFJor6bdfRzKgOMVX1B8491sKsiQDuoUnaRlabN7s71TnM6L1FE49WdhgRASE8yT9cDprHyB4gtgaidKchHABo7YJByRLi0FhLEb5N/3PFzCuoS42uvjYFRfw3qowCwbwQkLMa+SRwhQw3BKaQ/S50lqQKdpQAKKpRlR/WYVNM5UwpIimdPQnSJC0AYtXSH6/o5Dbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Tqwm8Fs2ADZOHdM1i3IdulpDkSnIyXb4xED76D59oY=;
 b=B67yk/fYpNAJTqbxgmVbhhA54KF5QcsjUTicOpXNPQHC/u3auG1nLYC0M+/AAmGH/7CJZ7ZUxKPmlOasmsHT4ye4mPkzL3tenjwmDByOhHOV4dZK4+xprwqJJhGOTLwlTG5003OvzJTUn3b8xs0ALrHIefbL0l7hziNL69NyCDIxeFv0tyk4x9bZUgP/arajYHwVlOYEVb22zVRG7MQXET3m68eWFVoMqbPYkC+yazFtcFs6oYXiCGxI+pGiMWb1ZRZiDpyoEkRPqXHUyaNLCQ06Xeg9eYejjuOmULBIexVwQ7Hz0RY+L6sucTFXL4XcMQd+howqy9MRkH3qLKHGbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Tqwm8Fs2ADZOHdM1i3IdulpDkSnIyXb4xED76D59oY=;
 b=phXpnzMDkcRtxZeG2KQrf1P3vuO8yw3qLI0DwqIWQa8D/7H9N2kPmNMQZgEjU2JwYuXZ00Hu9kSz3GmpqlZp/4T/gQpgRMMFoZfVNsGt2Bs2c9k+sP4nDru72eyn26wLRHQhBdbHMMjgofa8R7lCYeWMCrjd4ws8tw06w++RqLQ=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-2-andrew.cooper3@citrix.com>
 <d8bd932d-071a-4a5b-747c-02cbd5e296cd@suse.com>
 <86cf1d97-2034-7791-071a-48208b6ba54b@citrix.com>
 <28d7b7a9-9dd2-1664-e946-d7e4a330da0f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/hvm: Introduce experimental guest CET support
Message-ID: <3d1847f2-4ba6-416a-7957-3310b5d5124c@citrix.com>
Date: Wed, 28 Apr 2021 18:54:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <28d7b7a9-9dd2-1664-e946-d7e4a330da0f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0134.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63627e6a-3438-47b8-ec3e-08d90a6eabc5
X-MS-TrafficTypeDiagnostic: BY5PR03MB5029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50290C830F5FC5DB744C8695BA409@BY5PR03MB5029.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GvaBcj6bZDrKcC5bxYJNviJuXZOLyWrZMKM+aW+Hqj8RgsJKwjSQW9CZz8Qy6+WqZGzCe0PEntN/iUQBpUmqvQpk1Unlq8hvfdqN4/6ktcNAPPit36blF20uWhoXvsRwSAVlNfvy9AtUHXTQQYBPgcmtuEjLu9wjaoEibgkbJJaQ/pSzC4LEsuKDagwee0e4g4beyUMypNuAEARZ7X4nFAVPjSQfUZ+PgwXB6XX++uCZWN7RcJcuhEk724c89U0mXuvL6qjF7oUZUITIowyBHQphN+1VDpmP14DAY3kzF9XbgZ83XhHnt7QQEoIWkqfcAUvj6yMsKo0vNCfD3LLqU+GHmU+EP/qfRPT+sYtROnfU8OV+D+L2czFvjA+RVz8A1jGVpZ4+FLF8RN2TaJSILUeJV1t2EC6flIAvbtPbu/jTjw/a5DDh6jyRJIwl28V3DbuiK8W+H678xseMtkPU8ELTp1DXY8TABDQrW2CL4uuBmyKuXkhPdRWyTlEgzUgF3SNeRJpeqa1GjGB8/2Ilh7a5BaAqPu1JrAdAvoMLUZHF1YX01oEiddoe4KRg+xH3KS8Dqa0ywMjy5sVB92748LpbpIRM7iqjIn3nxOoP/LjNTW3uPibdlvv11O6KSwPUadANyRvVWEG60aDdkbM2vFeg64XDFiNDua/MbxJT/+klz7k7B6yWqCKxsZcWA5Ud
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39830400003)(396003)(31696002)(2906002)(16576012)(66476007)(8676002)(2616005)(66946007)(36756003)(8936002)(956004)(26005)(16526019)(186003)(4326008)(6486002)(38100700002)(31686004)(478600001)(86362001)(53546011)(6916009)(316002)(6666004)(66556008)(54906003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N09oL3JkQ2lMQU1naS81bDZWc1UyaGpOdXAxdGt3L05KOTJkWU9pSjJSRjVi?=
 =?utf-8?B?MHBWYURCcEo4ajdPUHRMN1hJSGNSRVF5UlVRWW5PdEhlUEZtMTdNMXVQNFRN?=
 =?utf-8?B?bm53Y2NjUXFwZjZUL0Z2NFY1cjJZUUwyblpDa1Iydzl2UFA4S0VzOWpnUHZ5?=
 =?utf-8?B?QkR6SnNTbUVLL1Vza0hFdGdZRDdFSExBN25wMDhmejBQVnVZUTIwVmZSVWpi?=
 =?utf-8?B?eGVzejJEdTBpOWg3UHJpTUN0TUVFRjdMU1BLU240OWJjUFJIMDVhdkF2eWZk?=
 =?utf-8?B?UHVQOGU0aVhUSGRNNXBHL1hjYnRtcFhuUm9odE9TcVlkUFJLa0Y5dUIydW5j?=
 =?utf-8?B?dVBLSmY0bkxwT1UvQyt3c2hLejF5Mk9wVlk0MEZYYTdUU3hPRmlyZGxxdFFn?=
 =?utf-8?B?SzNoR3J2T3ZiZWFXcE9TNGlaNWd5UVFIZ2NyeW1OekNKZEsrb3kveUZlMUJY?=
 =?utf-8?B?UkZrZkZuU250K0V0bFIrSFZZNVYzZHBxQUFkUXN4RlVkeXhPMmthaFgwc0Rt?=
 =?utf-8?B?dk0rUjBoUnh3c29GRFl1Y3JUc2dUOW9JbDdJMUNzcEFtSkVMUWxSYnpmMDd4?=
 =?utf-8?B?UTlCcDEvK1pWZWkrUkZkak5SbnZHZkRNNHk1L3hrUS80K0tyUElrSEpzaTVx?=
 =?utf-8?B?cEovdUU5Q3hiTFh6Tk1zODNua0VXdXVDMGZnSmZ6RTlhbHpXdElDSzBTRVM5?=
 =?utf-8?B?K1pNcVVra3MzYndDOFUvMkhUMHA2TFlCRmoyY1dES2YxVXRuTFpJNUw0L1Yz?=
 =?utf-8?B?UmJoelloK3pQMEZNbEcvK0pSUXorWkNsRlRWczBVR0MvTjU4WWg4eHdvY2RQ?=
 =?utf-8?B?ZnQ3YnBVOFFoQnhleUNJbmQrWXpGQktuNFZuWHRCYnQ5L1V5cmxYTUY1UjB0?=
 =?utf-8?B?MjkzSjNiamlPaEEvd1FnM1lNcFR3Y1NwSFJOaXR6em5leTZORHN2T0d1NlNI?=
 =?utf-8?B?bk5tZHY5SnBWN1ZUbnFCdyttSE5OczRRc25lWUlqNlpidmVpa25QRVlqb3o5?=
 =?utf-8?B?TlVBNXpxOGwrYnZKU2wwR3lsOUhlZXRMbzQzUEV1aVdQSk14T1lUcTZOaUxh?=
 =?utf-8?B?NHJQZ2lnVExoR2lVdUN3dDVPemoxVlUwclY2aE00czFzaDdTOU5NdDEzMDFz?=
 =?utf-8?B?aWxHUUp4TUl1bFJla0ZVOVYzRmtyMWgxK25CbVR5OHV1VFJ1ckxUUmVuYlFP?=
 =?utf-8?B?dFB1MS9TdGwxditISHlzNWhIZlN5VU1LYllFK0x2VFB6TW4yOG52bnRVUm5o?=
 =?utf-8?B?amlPcGUyajcvZFVMdFZqWmxOVWpIaTVLZllTSFZxV1oyTUd5WEZ1V3hiMmlK?=
 =?utf-8?B?SzZjUUQ1MGNhcXptVmdSODh2dit0b0NTdjZIVjZqUjAyTFVpWnpvWDZMMlUx?=
 =?utf-8?B?WlVsSDVyR0RGenpQeVVJNGhJcUpqY0R6cmhxTW5CVUpoWlczZzNpOTBSRFph?=
 =?utf-8?B?dGRkMi9udHhaYUZlWjdoZkdlK0wrRU5DaDVRM294OVRSRVlxNUQvRWJLVktW?=
 =?utf-8?B?WEd2b01GeXNONXNCZnF4aFREbTI3cnBxTmRVTys5Z3pWNkd1YVhLU0RPQTNr?=
 =?utf-8?B?NDRqVHVobXo2SFA2ZkZnK3ZwWXVpUXU1VytMdDFDUktRbmZsUGlFdDdGUnFO?=
 =?utf-8?B?Mk1pRG1pMFhVMFFxNmVOajd2WTFhT1VwNlZ2ZS9ySlRDRFJrWWszU2pPVUJG?=
 =?utf-8?B?ZVQ5VVBQZS8wY094ZUVIcnNBTUg2Z0VPVHcwYmVlc3hMZW5IUUhaZWJXSHBP?=
 =?utf-8?Q?BDETPGZ53xr5LCHeAAdWyYTSpVe+UMBwjlEpq36?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63627e6a-3438-47b8-ec3e-08d90a6eabc5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 17:54:29.5650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXfeVVjKN7aAXAP5gdqDOeGDGqjCh6sol/wXoL7mRSK2+NsLcxkdV4t3AT6yAm8WYikQF81VaQxy6/r9rvhvRu9jh2dCTB5YU9i6hP9Dqnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5029
X-OriginatorOrg: citrix.com

On 28/04/2021 10:11, Jan Beulich wrote:
> On 27.04.2021 19:39, Andrew Cooper wrote:
>> On 27/04/2021 16:47, Jan Beulich wrote:
>>> On 26.04.2021 19:54, Andrew Cooper wrote:
>>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>>> @@ -232,7 +232,7 @@ XEN_CPUFEATURE(UMIP,          6*32+ 2) /*S  User M=
ode Instruction Prevention */
>>>>  XEN_CPUFEATURE(PKU,           6*32+ 3) /*H  Protection Keys for Users=
pace */
>>>>  XEN_CPUFEATURE(OSPKE,         6*32+ 4) /*!  OS Protection Keys Enable=
 */
>>>>  XEN_CPUFEATURE(AVX512_VBMI2,  6*32+ 6) /*A  Additional AVX-512 Vector=
 Byte Manipulation Instrs */
>>>> -XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*   CET - Shadow Stacks */
>>>> +XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*h  CET - Shadow Stacks */
>>>>  XEN_CPUFEATURE(GFNI,          6*32+ 8) /*A  Galois Field Instrs */
>>>>  XEN_CPUFEATURE(VAES,          6*32+ 9) /*A  Vector AES Instrs */
>>>>  XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multipl=
ication Instrs */
>>>> @@ -267,7 +267,7 @@ XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MC=
U_OPT_CTRL and RNGDS_MITG_DIS.
>>>>  XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitec=
tural buffers */
>>>>  XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_A=
BORT */
>>>>  XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*a  SERIALIZE insn */
>>>> -XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tra=
cking */
>>>> +XEN_CPUFEATURE(CET_IBT,       9*32+20) /*h  CET - Indirect Branch Tra=
cking */
>>>>  XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (us=
ed by Intel) */
>>>>  XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
>>>>  XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flu=
sh. */
>>> If by the time 4.16 finishes up the various todo items haven't been
>>> taken care of, should we take note to undo these markings? I would
>>> have suggested allowing them for debug builds only, but that's kind
>>> of ugly to achieve in a public header.
>> TBH, I still don't think this should be a public header.=C2=A0 If I woul=
d
>> have forseen how much of a PITA is it, I would have argued harder
>> against it.
>>
>> It is, at best, tools-only (via SYSCTL_get_featureset), and I don't
>> intend that interface to survive the tools ABI stabilisation=C2=A0 work,=
 as
>> it has been fully superseded by the cpu_policy interfaces and libx86.
> Well - what features we expose is part of the (or at least something
> like an) ABI.

Yes, but that ABI is called CPUID and MSRs, per Intel/AMD's spec.

VM's see it via the real instructions.=C2=A0 Control software sees it via a
pair of arrays ({leaf, subleaf, a, b, c, d} and {idx, val}) expressed in
terms of the vendors ABI.

>  The actual numbering of course isn't (or shouldn't be).
> I'm in no way opposed to moving the header out of public/ (and until
> now I was of the impression that it was you who put it there), but if
> we do I think we will want an alternative way of expressing which
> extended features we support. I say this in particular because I think
> SUPPORT.md doesn't lend itself to documenting support status at this
> level of granularity. I'd much rather see that file refer to this
> header, even if this may mean some difficulty to non-programmers.

We don't need to say or do anything for experimental features.

Hitting Tech Preview and supported ought to be in release notes.=C2=A0 I do
agree that SUPPORT.md isn't great.

>> As for the max markings themselves, I'm not sure they ought to be
>> debug-only.=C2=A0 Its important aspect of making guest support "tech pre=
view"
>> to ensure the logic works irrespective of CONFIG_DEBUG, and I think it
>> is entirely fine for an experimental feature to be of status "your VM
>> will explode if you enable this right now", even if that spills over
>> into 4.17.
> For a release I consider this undesirable. If a feature is in such a
> state at the point of entering the RC phase, I think such markings
> ought to be undone.

Well no.=C2=A0 They either don't go in in the first place, or they go in an=
d
stay.=C2=A0 Putting them in with an expectation to take them out later is a
recipe for forgetting to do so.

I know we're making up our "how to do complicated experimental features"
process as we go here, but nothing *in Xen* will malfunction if a user
opts into CET_SS/IBT.=C2=A0 Therefore I think they're fine to go in and sta=
y.

~Andrew


