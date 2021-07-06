Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2163BDB0C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 18:09:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151531.280044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ncv-0007CO-Ug; Tue, 06 Jul 2021 16:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151531.280044; Tue, 06 Jul 2021 16:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ncv-0007AQ-Qa; Tue, 06 Jul 2021 16:08:49 +0000
Received: by outflank-mailman (input) for mailman id 151531;
 Tue, 06 Jul 2021 16:08:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rBn=L6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0ncu-0007AK-Cn
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 16:08:48 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 711604a3-de74-11eb-84ab-12813bfff9fa;
 Tue, 06 Jul 2021 16:08:47 +0000 (UTC)
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
X-Inumbo-ID: 711604a3-de74-11eb-84ab-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625587727;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EhBJSMffj0WekHiNCUjxdEbJ/5FzByTBTqtLD8GvgyA=;
  b=fBOZIO4iCf1XlkNmP6V+ScjbObEUNZttKz75f3UEtvas98GcCqyHC+NL
   eMKsxH1JvtUq71b3mZESXu3GIz+P7XD7mRMI81lPt9Dj0tmAWbSFK1q3S
   5fQVPQG8bLPR5yCzszBXTbK9XQrGb320iy6+mKubOgyogwVBejPXUT6j/
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: y2gtkoZybMovo53fGYeuuNyHKVNvH6vZcGcmMYoFaBdfbNGEioatvr6DQrK4nce1DhmykNUY3D
 CFIqO607cl2i53GY2o+tJvm/HpBps8310hiYNZJTHiZSeamKVPDeTq9CoNEHKjCvbDwjjJOub/
 UATPtXbU2PPj7B2e+gUvoqUZo/Sc3qQ8lFyOgZu5OHWjmNyTIpWpI1jXwr0ek90PReoiAbcCy9
 CxJLeufV+U/h7dg0shQGcj6faCOcCPDwL8UkLVsZ/Ap/zjNzxYSrL5aGKa7GnwSAcCIqSmpvDb
 Gk8=
X-SBRS: 5.1
X-MesageID: 48040768
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YQz7c6n4KBPkR7LWFdHjBwt9SarpDfLU3DAbv31ZSRFFG/Fw9/
 rCoB3U726WtN9xYgBYpTnkAsO9qBznmqKdjbN+AV7mZniChILKFvAF0WKB+UyDJ8SWzIc0uZ
 uIMZIObOEYZWIQsS/U2miF+r0bsb66Gc6T5ds3zx1WPH5Xg6ML1XYGNu5MeHcGNTWvBvACZe
 qhDtIsnUvZRZyOBP7LekXsWYL41qb2fMKPW299O/Y/gjP+8A+V1A==
X-IronPort-AV: E=Sophos;i="5.83,328,1616472000"; 
   d="scan'208";a="48040768"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbmNuRoBKImC5+LzX0Zv/pHD1nO5gFYdMk3+vMG9kJq0wF0c8XgwG3FzzYmNknv3PYPl3qD14iLNs0AN/YB+cKiM40q6yA11lPrhxpz92yHjVRj0CtmR8USsCtpsnX1+EJb2c2YEcqHmoYR0jpcxvtuWDL4Wz7y0u2ssUek7JqK57marTuQjZwOJGHQ2dbuoxWIqQ/AelBFpYrkI3Qrm8OCXuceoP4QsAl94iv5CgUOa7gR5GtliofvVrqr7SSML5ZS3Hj2gdIMp5tNhQt5wdQ14VCNIPat9gN1cGIZ98nkUp4FQDsyMI97QMFhfGK6bTXHUqSeIU4VF39p2yJTqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhBJSMffj0WekHiNCUjxdEbJ/5FzByTBTqtLD8GvgyA=;
 b=eTpTjqS1DeLTo9tjSteZmE72cVWliJpredhVasCihbd0XBaKHRTI/82cq/MEt3Px+kEjWaYQnaUFshJ+bDzKOWGdriw2jcWbxvj+U6CFb93uN/1QlvyR5IONQ+kwI9ySl89F+L258ztI+YrIiGJu6PQ6D1JidfNRLNis7VrGXY83+SX63VAIBvbzxOEJFXr3/oyC/2lm87msHvK6PCwcoH4smWANwqMHmgY0aNdsRkZOx8VpFi7ahmjDygfY2jzr5srrXVtJr4Qs9uVE5fJgMnD+k86EPl9nC9wvfYXzMUIsVX4VoySGIl+OXLSqGHw5YLGx/OSqJHf+6PedNj2I/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhBJSMffj0WekHiNCUjxdEbJ/5FzByTBTqtLD8GvgyA=;
 b=LBnHohNJmeXum4wNeYhldDOwNZnYYNaE96XOayNrASE3QeXbt6x6LoEv6ajN6Ep5Od45xlFxZa4dhHagOU87eTuTDz/3SVAzyWuy4OEVXAVTglnUnSsbAwF6DW6hnrUdYRTef2q6ESCxK8g1nzPbikQAtq3vSqhF571EXrLILzA=
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
To: Jan Beulich <jbeulich@suse.com>, Olaf Hering <olaf@aepfle.de>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
 <20210706112332.31753-3-andrew.cooper3@citrix.com>
 <20210706145804.1ab98f16.olaf@aepfle.de>
 <20210706161120.2b6394a9.olaf@aepfle.de>
 <20d002fa-d050-0ea9-4c2f-1b98d618d9f8@suse.com>
 <343794c4-63de-4aa2-30b8-ae3bc5e3fae2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7880cd08-dba0-10b9-1547-923d6a5b3880@citrix.com>
Date: Tue, 6 Jul 2021 17:08:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <343794c4-63de-4aa2-30b8-ae3bc5e3fae2@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0338.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de9e361b-9110-4635-f716-08d940984da6
X-MS-TrafficTypeDiagnostic: BY5PR03MB5048:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5048326E54842B2C765E4EFBBA1B9@BY5PR03MB5048.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SGrQLSFnPC8TGtA0L88OhGTh9xXWBzgGUbbGiJaPlIAfwDKznRQmK6RN8xkllOE5MOpL2qoAXPnkI5szKbgSfqW3THx5qWjY5CtQQOwEHp8W4jwFra0P/brXUyz2N0scaTMrtICJCg5kDDdsWaZSq8WIGk1TnXUMPgRms4X+RxKOt/+WOi7TYrl6wnTU6KiA3agbqcg0U/21TE/zjLJczGbZGvt6VmG/9Utmgm9lIZfhB4V8EyN3q0D7j7V03kiS2t7pmXSRVx7HeCxevWWHZml8WGzNOpk72rvml7Xfv52evFd07uzoA2+e9PfSy+dv+G0TW5WZTKxIwgXTDE29QSTD1V6aINdK5D69ii4RlFOH4DdgVEm+hb96diJRgVwG72KmNim/SCfjJ5FEvCHFmGIm/SimNpR5TSIOWBE6vEwtOeGspgexMNn0n1MaS4lTr34mdrMH1MyooirpfmDGqWBNrDfQ39pCOaXI0dP6T2x1+HEr5ZAM4TeGSknjuM5qR9SFH5KH4nL8L13iNxvYGD/5rH2FOMkbYeeSIPqOH90oG8Ib8gVutw6XwaCvV95AO2WPRHCs9HPgmciwL7i9e2ffo4Ixm+VAdztRGGTurWyXqUXq2+6sz4e0z6ils3Vip7yUX7V410K/GoF77WxRLQE+Vwk5E3cwuVlT/MKWsSd4FlIsbG6lKMaiZXcGLeDm6iEZ/kiwEQ8VZxcAyPRp6HgzAbUFDAyYS6FfiwolzdTfcNq+0c5yb56p2sTSF49X
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(478600001)(2906002)(53546011)(83380400001)(36756003)(38100700002)(66946007)(956004)(5660300002)(316002)(86362001)(31686004)(8676002)(4326008)(66476007)(31696002)(2616005)(6486002)(110136005)(16576012)(8936002)(66556008)(6666004)(54906003)(186003)(26005)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?l94rNnRAQf6heDOeaKBhQJ52fzfIM9Lpy5al9WwJ3DiQr/uzTO6Q/Ulw?=
 =?Windows-1252?Q?5HXFJZ0/B8hLGFK0PDuGgViu/LVDsXel4MpfOVsu4QsIovNvt05J0n5y?=
 =?Windows-1252?Q?Y1y7boHTv3Tc77kLm1YswNrxRvamORyhWKkCzIwnaiJHDE7d5ae74zTo?=
 =?Windows-1252?Q?X369kTdLfOVswPy87l3i3TyB7yR9t8joR6IenBWCPdfqayCaTBNmMzsZ?=
 =?Windows-1252?Q?Wmr50XhMbMkLjGbuoojGynqUDSwDMw3rmFurEtl+9+mXDVnLqUL5kXTb?=
 =?Windows-1252?Q?hYBwZBys0X8RFoQDkcuz9c49isheEDU6hQJwvWoKCBhrCRgEC2qUJNtY?=
 =?Windows-1252?Q?nQvSzDW8aOMXd+oatErNwd/he+NRYjcdzgIwfIIseRK9PMote5Qe0uwC?=
 =?Windows-1252?Q?gzG2otDS/eikkRpc8DkkmN6M0FdZWnOOWttVfvTzWyjHhObtqb+KrAK/?=
 =?Windows-1252?Q?GIlJlBVZa0GBRopD70MheFNmaoMW4EE0Po427278XNbe/h6ysBhjTc9+?=
 =?Windows-1252?Q?AhqAWXBBXDwu2RFJiHEOpgoY51iAvW1YZiqE8nvtfjBxttV+ICe1KTpy?=
 =?Windows-1252?Q?xF7Xbt3yblg8a6EjJivoP4F3i3MgWx81LQ5It5KGqS3sjaJR1zSDzd5M?=
 =?Windows-1252?Q?ZJezhhEH2QRZQIQuKk+bVDIbv2Ka/kXcTgX7xzCV5pbeW/SoE0NSSCdi?=
 =?Windows-1252?Q?+aUo5SgHEJZay3uBprckYVejoYXZEDg8ll9gCsaEwR52dWNqa1OqADqI?=
 =?Windows-1252?Q?9sDY0ZaoowCd1SwJwL94AYXqGOmPRynspnnSxw1HhAFyVzg6Ra54Palr?=
 =?Windows-1252?Q?Z59t8WsQoOg+fLHbZnJNqW9aYY58K9LYPpqfp9eeIaFQ+12rRVjuc0Du?=
 =?Windows-1252?Q?bkaVUuvMWN4tcAx17AryQfKOUiUxtrlPl/zbT47Z/qpe9/brwxQCIjtK?=
 =?Windows-1252?Q?J5T5nnsN+G3AbhkVyBLYqlERqRRDy5W0SgVZMWjanUsKvq9cSTGJuFlH?=
 =?Windows-1252?Q?J558fHLeoSEs8Y9KwR5ijwC4Rklj2O3bGODz7HXNApH4p64SZVn8j/d0?=
 =?Windows-1252?Q?op63m3JhaS7Lyggvk5s/p7FxD9PZQimoMz3UU0xDK4VTrXAZK8gVsgq1?=
 =?Windows-1252?Q?dyxWRu96ktNSll5HCnAaQx8NyoAnRuOT0Ds/hT0ca4AzfLlZBEvjmax2?=
 =?Windows-1252?Q?TMoyTaE33rMTFqARx4gmmEMo3TyLSqD/XlFI4v7QNDXlQVl7nKWYRbnU?=
 =?Windows-1252?Q?8+iARV+58VaW+6hH9oq+b8G/jGIWBMy8Cz4YVAHKj/H2fh7myi0sTEmp?=
 =?Windows-1252?Q?y65TcroMJEnrlm/8OfJvGwCBc/jjmmW/m1GaTbUiIXhB/ToanjXz11Bp?=
 =?Windows-1252?Q?l+amyB8aJejsiA1VFKw/1CaZXIe34jEgVY0p8Jn2FnRu4j22S2WY/qA9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de9e361b-9110-4635-f716-08d940984da6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:08:33.3509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRiF1XuFKlgthP2TFUCfPn4uQdsbmT0YRTSdjRF/KDoMZsS9RiwJwyxfN3Bpdg0DOcxFCcg18cR4t7yakCtCbhqrO3d5s2f46pdALI9rrXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048
X-OriginatorOrg: citrix.com

On 06/07/2021 16:22, Jan Beulich wrote:
> On 06.07.2021 17:13, Jan Beulich wrote:
>> On 06.07.2021 16:11, Olaf Hering wrote:
>>> Am Tue, 6 Jul 2021 14:58:04 +0200
>>> schrieb Olaf Hering <olaf@aepfle.de>:
>>>
>>>> the reporting is broken since a while
>>> A quick check on a Dell T320 with E5-2430L, which does not have "Page Modification Logging", indicates that staging-4.5 appears to work, but reporting in staging-4.6 is broken.
>> Not surprising at all, considering PML support was added in 4.6.
> Or perhaps still surprising, as the functions involved there don't
> appear to be bypassing any core logic, so after some looking around
> I can't say I see anything that's obviously wrong.
>
> Oh, and I notice only now the "not" in your original reply, which
> renders my earlier statement completely pointless anyway. I'm sorry.

Ok, so my observations of dirty_count being reliable during development
of migration v2 appears to be correct, and something regressed in the
dev window where it got committed upstream...

That is suspicious.

~Andrew

