Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B603F8897
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 15:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173046.315752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFFB-0001so-Gv; Thu, 26 Aug 2021 13:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173046.315752; Thu, 26 Aug 2021 13:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFFB-0001pp-D3; Thu, 26 Aug 2021 13:16:33 +0000
Received: by outflank-mailman (input) for mailman id 173046;
 Thu, 26 Aug 2021 13:16:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJFF9-0001pj-SG
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 13:16:31 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 432fcb1a-5553-434b-8713-409e1f58eac4;
 Thu, 26 Aug 2021 13:16:30 +0000 (UTC)
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
X-Inumbo-ID: 432fcb1a-5553-434b-8713-409e1f58eac4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629983790;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vHzgO/6JE3l3+82E9BaHeYvUwNiG1G76LyDzdfqGIWM=;
  b=ety/AG3AZT6cm6W4ozFYnEVK5Gmosoh4N2uh82OO6lR+/Wt7qlx2feXX
   MOpYG/q6jliWjQbZCuoBEnCEyt/olj+1s7u0PuUPsPND+heC5/O86ehVG
   5f4BblworqwqlHOcThnNeRphIDKIC3xdIa/K68ydtfU7xRv201Havd/D3
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: m5KXhnJnuiawheZYWHygA26z/jvThByX2YBA1/HzTy7W3uOtEAsSb1FI7GaUGBwplnexj0Ktc+
 eDxRHp+h/G/uwJO7w5OpiQAvdGaoTFpUTLCxvVlpXITumEjRErzSqTa9RmPvKlv1GW9WVWUfrz
 jtj84kk1flIQMtFFFTtQNnUdoW7dp/6SyNwMpzfCNnX1bLbVQervnfkaYeRRuIA8COHvGYGFh1
 MeYxeF7LMXsM1T17DzFvp72in4PNV21b4NirH4wS+Tg1ZTk17hw92Ap253tmd5R+B+6rdMmthj
 KNYcgoYaOok1gzG8RMB5fu35
X-SBRS: 5.1
X-MesageID: 51367032
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UX13VaqKKxQNQklXIBe2FlsaV5rPeYIsimQD101hICG9Kvbo4v
 xG785roSMc6QxhEE3I9urwSZVoLUmsk6KdpLNhT4tKUTOW31dAT7sSprcKoQeQaxEWn9Q1vc
 0QFtkbeaSAdSkA/LzHCUuDYqUdKbG8m5xA7t2us0uFODsaFZ2ImD0JdTpzfHcGOTWvi/ICea
 Z19aF8ywZIMk5nGfhTTkN1KdQqpbbw+64ONiRpO/Z+gjPusduug4SbL/CftS1uMA+mxdwZgA
 r4eiLCl+yej80=
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="51367032"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuNyuCz5LlOgMY8bSRsUS+K1+8AP9FMtNc1KE2c8QmFoGpWJW6wY0agC5Am1l6wlnwyX2QGajp7QbAeXBQ4EDv06Eo+urYPDn4KnYEPp54dbo9176z74FRQ+1BMZCsMaIzrCQbdh+1sclDiGQ9t3a9k2S/HKyRQ+7ThUvUV2rrXej5Dyl7yaqvjxWFlafAEKE7LGbo/5uN7h3ERb2/PGbiqMug7sySG0nEgf/w1Gf07A8POz1fK4hoVHOphtYlSwG1Neemgzzd0HdzFUrNN7MTht6CK6WaeTBCF/KtQp7lBkT3750+OdeX0o/vePtw8twKqTgLGx1f3wr0/ZVzCljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHzgO/6JE3l3+82E9BaHeYvUwNiG1G76LyDzdfqGIWM=;
 b=lsayYQoSfhZu9Ia8QF59EKDtZoO43q/qpMtiMgK2gG7fYel+w5bSbJnB8oqXHJKVpIcz7XBoo7id69F6UryvUQ8VTXOpXZsH29hPNmQh/yiglCVdW62XBgb5TRfZkAbxSREJeXB3qeYgGv58NERy78IgHswXPrQq5glATaI+i0ygOuDVoLl8r/7dEmzJofw1KBqPPukBLf+EKKe4rnD/WxHNNqQRgRH56r8npgn/KaX2JXipO+sXoHn2LjZzu+SzuuF+gCXiu6gXrWTsrbld8Q7YF0OSQ/OUCT2FxCHgh40vuGPVVI7RSajiOj4fHoGn3HwdO+csGJJug2n1HGMuCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHzgO/6JE3l3+82E9BaHeYvUwNiG1G76LyDzdfqGIWM=;
 b=c8Kr3f9vWATmgZB/2O1AazBJwHyDbBTSkR2F7ltB5Ta9WhBcsbxt09Tr8CMeEoyIWzTB2hwr8g515WId2gHIRYQ2YbK1L/grvrxFLOd3I1B6hYWJpBTv+dDnHQ+Vsmlmk9gzCQcnZz6zuNIstMpPod30leJJQ13HJkW/VzKzCsg=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <c0b49a0e-44fa-4e15-ffb9-d49002060edf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 4/8] AMD/IOMMU: check IVMD ranges against host
 implementation limits
Message-ID: <05d3fb35-ed58-7b3b-59a7-fb555953cfca@citrix.com>
Date: Thu, 26 Aug 2021 14:16:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <c0b49a0e-44fa-4e15-ffb9-d49002060edf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0334.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d09a0cb5-c366-43a6-237d-08d96893b33c
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5566:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5566E9CF0999AAF701DB549BBAC79@SJ0PR03MB5566.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aztIvf5H+XtbCpx2qTLZn21Qm3zrf0gj7I74jkwF8Z/jwg7DW9RKxI8eGfM1pkQCVZbLQk+yEzISU8hESNfVzJTnQAV9Vs4OqwpMFZa0ZCSnSwr4BPeeJ/ImdvPHDim5n9XY3ODGykYj0HykK5wEAv8OGky0vxYOWBS3j5IyK6ITJ5N6K/n3gptJlIPPI+iwViXXWblyAmq+2sEg1EbWxX16DYQHmFPdv2oVaF51gsueKCVm2zmE55LD3Q/zTPKPIbG4T88Mf3tzA37fASN6i8ojKsF2Xa26OM5v0NpjZ/8CyiSqQiHCPzj9XR036Um4tyWotSzeVJQT0TIv5Oq2E6tVPuMLONGryIqM8yCk4Ez0Y5tMoXS+mNAyIwckZB3jKakpu45ev9skoZw1TAbfJD0fa1F6v+GpWG5ovZmQjjJ/jo+UMoFyqI8cY+4k/FeV+P0u/4Hvx5RgYoT70qn8erjIFMgtZBgoJdovtuaFT99Lh0JWQzrUoPHqSLbRmgsY5GmMrZaLh8u8T5MG9H80/oXgZ51FNLWXZVmVIyx5ZjkXTWN/IqsM0KqCPKYmupQmFN19cmdpuICsaL+PkITDbQ+42mXE0QyR3un8gQCt5HRH3K13yl2JZIGgR9klMDcy7fPAn8k6AO69Ee9Lf+561IZtvmHqwto+w9uP2D+VaIY0AnP0x/2v8qpxEMrifRD5+yueYZZlwFXNvKoy5/Solmb1+I8Bu46qBWbfMlU1XDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(478600001)(66946007)(55236004)(66476007)(6486002)(6666004)(53546011)(66556008)(86362001)(36756003)(31696002)(8936002)(8676002)(26005)(2906002)(186003)(110136005)(956004)(16576012)(316002)(31686004)(2616005)(5660300002)(4326008)(83380400001)(4744005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNOQ1hMWHdWNHRsbmcxM2lybmlCRG9NZE9BaVNTTTVQOUljR3E4SG5IdUUw?=
 =?utf-8?B?bE1XSlZlS2lDRTBhSTE5ZytVaUdhTUZtN0theEVuZ3RrMGZ4NjF3Q0dBS3k5?=
 =?utf-8?B?MEVRcXhFTjdZNHQzbjFSeEhibVZ4cGIyR3o1R0ZqUG9SbEhnQnBHMlAzdUZN?=
 =?utf-8?B?aWF0UmtBTUszSmVtQTl6UEExQ3FrWmdpMDVmUnU2UUxTZTRlWmpHbitiQk8z?=
 =?utf-8?B?c0JQWVVVMGlhRkpiTmZlV1BBTnVNYnQ2bThlZ210b3dPNjN5enBPSnYyWDdu?=
 =?utf-8?B?SDU1NXdjK3owVitqSS9TaVJxMUpmZWFrUUpQWDdua0s5bXFGSmk1R3NPejNr?=
 =?utf-8?B?Y0hkdUZPQUJzdndNVWc1WVBLZndUSy9BU2MyQWdqeExsdW1TYkdicUJCOWtL?=
 =?utf-8?B?WWRnNDlDLzUyNVVuOGtpMVplbWYxZ0xxZnlkY3NXMXhIYTZTKzdVMDZDVnF6?=
 =?utf-8?B?YUJvbG1mb3pJdHVDNEpObkFuVjh3dng2VSs4RUZScW4zZmJDVXVwT2UzSU4x?=
 =?utf-8?B?TVM1ZVZJQ3ZSUDRwSUREb1k5QmpVbTBKblBFL1BUZXBsZkZjTzJQdEFsZGp1?=
 =?utf-8?B?bnJjSnF3STdXTEtDdWExY21YQUg5ZDZVMTBqZWdzc0tVaEdzZmV1Slhwa1Bj?=
 =?utf-8?B?SUc5WHZPVHYwdVQ5blQ0SjU4Qi9FZHkwMXh4ME40ZE80ZDhOWTNaNDdvdFhy?=
 =?utf-8?B?OFpPL2FFNlFhbDlKOGFKczkzdjdYWEJCTzJWQit6eThjNCt4ZFJTNm9YTHhN?=
 =?utf-8?B?aGpRbTlrS3p3TGNodWgwZmh4NVAxRUducDRpV2ttalVHZWJrL0FSMkVTVVlS?=
 =?utf-8?B?cm5lcGZ4alRVa0tucDV2Q0Q4bTVQbk9JRCtOcEU3WW9rK3M3WXdvMWNHRmp5?=
 =?utf-8?B?QU5HbzBiWStRZ3piWWlnMndMQkxPNDUrakducktGVFROQklvQnZXdkhkdnVV?=
 =?utf-8?B?RTRIM1VxdFZYSGNsdEhOZmxOS2hNeDNWNjg0OGZKczFPQVJrTXRaMVc4MGdB?=
 =?utf-8?B?MWVaTjdYTGVwdnlYUTlTelY2YmJWUVQzSnpzbHVZNTBpZnlaeFFaWHI5WWsx?=
 =?utf-8?B?cnkzcmErUkdwU2VjL3p6NHEvQm1jN3gyMHdvRXRPSk56VzZCaW81aytlYzZB?=
 =?utf-8?B?SWkrY0VGaE5sR2NqT0srQjdaa0I1NU5pSDJNdU9wdnhVeFo1L1JVU09PUlRG?=
 =?utf-8?B?aElZejJ0b1hFNGx5L3UwU25aQmpsODhqZGkreDJkV3BUTHltNE4rV01DM25t?=
 =?utf-8?B?bThYTUxUTTlTb016cytqQ0tNeW0wcklYYW5wd29tOGhMVTU2bUxyVm5PVUR4?=
 =?utf-8?B?VzBMMUtqVURWeXlYTTJXcU9zT1VERGw5TXN1cmRvSktmUWtCckI5M2FIVlBF?=
 =?utf-8?B?YmM2R0k2OG5waHJab3RSVWpyR3hFK1dIeXZJT0xySjl4Y1llL2dOMGV5aG8w?=
 =?utf-8?B?cXROOHpCd2NOSWpsVFBZbENpa3hVVG83SE5Ga291ZUV3dllHbGdONmw3bm5j?=
 =?utf-8?B?WUN3bC91SXBDeVgyei95NlBmQjdXb21XNWpkODc4ODFEZXAzT1VUY0RYVFAy?=
 =?utf-8?B?eDRiVGQ3OG56Y3pmQzFneStuUFBnT0xtYmdoWGxYcUZUVDAvVDhwRlRVdnBn?=
 =?utf-8?B?Tm5LRkRtKzZEQUhBYi9mcGhuaUZNVnpzWFQ1SHA5QjNwR3RuUWpLUnJML0Qz?=
 =?utf-8?B?NjAxVURhbWVPUTFMeWF3bUlMM3o2Z3FlbnVtaE9KVExoM09uVnp5dU0yV1Uv?=
 =?utf-8?Q?0wCUQ4z9idYvNZvHZRXgs+Rgyqn5Jwfh0kg1gkb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d09a0cb5-c366-43a6-237d-08d96893b33c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 13:16:22.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8zgz3++0t1Nrx0OKVC+RARABpd3hzEQR3eVw/cwHjG3CmJpsLn/fX7SCJ1MuX/dpptBW+ecxDNPL4DWRzcbgZga0+6G4vteD8RIxziN4b0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5566
X-OriginatorOrg: citrix.com

On 26/08/2021 08:24, Jan Beulich wrote:
> When such ranges can't be represented as 1:1 mappings in page tables,
> reject them as presumably bogus. Note that when we detect features late
> (because of EFRSup being clear in the ACPI tables), it would be quite a
> bit of work to check for (and drop) out of range IVMD ranges, so IOMMU
> initialization gets failed in this case instead.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

I'm not certain this is correct in combination with memory encryption.

The upper bits are the KeyID, but we shouldn't find any of those set in
an IVMD range.=C2=A0 I think at a minimum, we need to reduce the address
check by the stolen bits for encryption, which gives a lower bound.

~Andrew


