Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553E73729EE
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122233.230514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtxd-0002Xz-C2; Tue, 04 May 2021 12:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122233.230514; Tue, 04 May 2021 12:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtxd-0002XY-7u; Tue, 04 May 2021 12:15:33 +0000
Received: by outflank-mailman (input) for mailman id 122233;
 Tue, 04 May 2021 12:15:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldtxb-0002XT-5H
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:15:31 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f400856-5ea6-42ca-b0ff-9c22d068a34b;
 Tue, 04 May 2021 12:15:30 +0000 (UTC)
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
X-Inumbo-ID: 1f400856-5ea6-42ca-b0ff-9c22d068a34b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620130530;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bO1/plI8n3xyY78l+HYLvvvHIHf+gjkMgfcGHi7zPlw=;
  b=HApFU2RAo7u/z4Tr4ysI6iGWMhViAzsNmDPkX99LfdPI605W86EOTwTu
   doutJCc/vz7GPtxIw2BynGyh8pOXeU8HrhQf8fQVWCak4YM1YyQ+PI+14
   j8k7UtsBRoGv5G2xWUmGxrmfyhQoGTMg6mvLJZ0x9iVdh1DKcHELmOQe3
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ujbbvgy4WMIDfX7QDtVq8Cl+HsMXiwoo24DmkUb3vMLyTnPOvcGe2Sgr2KXFsIfdn2LP8+KnM/
 vwOcdg7uHJtRwfI6t6kzYgso/AMDZzGAbp+BqqcaISHcZy48SBnbTZKBaoxkwNCjco60ciLdLw
 rXIELmvI5iYF3HVuwR40JFc1JYO26XY63whNKnAMXcb2lj7KzjVTlhrrgnCkyC+hXDaceAwUW0
 lOK9iRnGob4QDqRIB5LAlWuMKu+JZgmGG94Z5C3bWDZ7/cy70r0XhCwRiLUQYO2/RntcIX154D
 87U=
X-SBRS: 5.1
X-MesageID: 43009141
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:86CKHarzoV4YdMZU8tork4waV5rAeYIsi2QD101hICF9WMqeis
 yogbAnxQb54Qx8ZFgMkc2NUZPufVry7phwiLN+AZ6DW03ctHKsPMVe6+LZsl7dMgnf0sIY6q
 t6aah5D7TLYGRSqcrh+gG3H5IB7bC8gcWVrNzTxXtsUg1mApsIh2wSNi+hHkJ7XwVAD5Yifa
 DshPZvnSaqengcc62AZkUtYu6rnbz2va79bQVDLxAq7xTmt0LO1JfKVyKV2RoTSFp0sNMfzV
 Q=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43009141"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vfq+1/3VrX/BaGc0kMJcHB23vPC8wQ3KIflJT/7XD3MzgvlUI+WDzOsHjf6tYjvfoBzVgtRWeVDrtsS2Yp7QQJLexGnGWcH+HwRsiPP2lDY5YG6W0syE0VQttrnj1YJzoGoa9qErIgHNrQ4lkQqdPCt2vu2vsGwHOQu+ataoK9Q8IKuHGtcriln+BDPFwM7afQ8+7uYMVNaWXBYqfmcoqhutYtDjdT9mRgYnLnSv9CXU3s3KZZtz6f/fiJNlXOUR4pS30pX+JwD60N7fP7GHRoSfQ5kHtbIWP+KddMezdO9X9+D8S+nkMQKQUGuZJVjv21cKj1nwpWb/EikgFvKSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlMIyk+8wBM13t2FCxK4lt6KVBCkfBaWOQiPDpVj+Jw=;
 b=SU827rx/1RGEb/KSWV24AyJcuLiTTd+0UPsZ7bPzhgc6Tt0dXI459kQSTMTVUm1P0QNNzCupKrMswIrioPjGWxuCJ+RQDFx6NrF3O6yU42siq/fmo2jke8i8+rytaCuID5KclIXFIUc6af7vZdfpLNSYhZnatpPzaqXD9DCEa13/6dtn2KoaiYn68hSq57asvP4tbyWpQcW4ZKwlqSVquOWzBr4BJpx+9yW5u3iauSMayIuhuysxAytNuTDXz+aeH4pZnmAPCe27whUAwrXFCW4AcFTN7sX7I0i71R5eOg24Z3vYCtMq7bUF8+HNokxTyQy7Y626pY7VXQGDcf5G8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlMIyk+8wBM13t2FCxK4lt6KVBCkfBaWOQiPDpVj+Jw=;
 b=xRZ1XOediXwjoE9hVE60Kpg07AgcQ9Aq9lfZC1nhC5F2p2X8bLF1unOlBl4mQIPf41NGgTa40x1m62FfOls2AnQFouYVpHc00Fs2urBk2p37L1XioEAnxlUD7GCMNr7KwT66K44tOe+m918zsCQbwWZuZ27OoI2eM1wKYtzT0vo=
Subject: Re: [PATCH 3/5] x86/xstate: Rework xstate_ctxt_size() as
 xstate_uncompressed_size()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-4-andrew.cooper3@citrix.com>
 <a8487667-1f47-1aae-1528-4a1224cbda7b@citrix.com>
 <07a03e61-742c-5880-1003-fcded7efc662@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3adb681c-9638-4603-018f-6fe096243cf0@citrix.com>
Date: Tue, 4 May 2021 13:15:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <07a03e61-742c-5880-1003-fcded7efc662@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::31) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4165ad72-c468-462a-4d8d-08d90ef64c30
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5584BEA73578A4332BAAE8C1BA5A9@SJ0PR03MB5584.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93hMzQ+S4URV6ngc/+A42zMyLNaxm4t+fSxAeIjJuf2Rir0bJs5E9QNEK6JCVTcwZ+zA0M8VYp9vfnDs1/vJlJLDV7vQMxg6fA83+LWCZ152ZzOiE7emkqLTxWeMKNXVR7JrfXQVZjxpcXzOuL7Q3pWtqS9eI07gIZEgynd7hq28QVVs8llc4KUSyArNjzBCFJljKOpu7eTDHoiB/BK/xAd3Y0hcaK6ama/RHaKQRA2Wu8m6biYEj8PtswBG5TiSVr8ULjdhaPykHiJu927FY7TZGhyqzGa/979iGbXcMINBED7iKKLa5JzD9KFmJi113EqSOw++dW1xUP2+sKrmGXkFYAPD1/vFnNUzILaPiefg4hwhP3BRWsKvlwY/Mum/pgMr0HAIP9sj7qCtKBZxOjFlBcFtMYjWjoUBztPAg2mTYEgNmcXr2/cybhrKKkijOA7heK4UMnkAnDMU5VEpBlz3vTa3wqj+Z0B26JdH6k/JFfhb+y8FLS8r4NI3SU4tWgjrhKkTFwT+ABsq9LSAjrsMWCQeFidx87YVoveTiFzXuBdA5u5RibgXEm37i6/ONszMPkyoK9A/fGG8XiTcrSp/WqbA5WaZFqVsYqVqepFeM+LY/y7QX17A56lJrY1wOo24YYqAHZ6oZRAHilEjwGkDC1ovCyAUZI0l58IKLq0ilSn/SEiJlmzjcE70Utm5dnnII3kC5S85StwDBZZnO+CjQHhVELVjL8qlSQPZHv6tLI2GLj8WZrs0yQeaqOFMAIuyLEBQRo7ie6FWsnGNmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(38100700002)(66946007)(6916009)(5660300002)(2906002)(66476007)(66556008)(31696002)(26005)(186003)(478600001)(16526019)(8936002)(6666004)(53546011)(966005)(6486002)(2616005)(316002)(31686004)(83380400001)(8676002)(86362001)(4326008)(956004)(16576012)(36756003)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVVSdkNVMll4bnExc0VWamNrd3JnNk5hY1UzVlZUZUdxNWVyaUVOMHFZUVFs?=
 =?utf-8?B?MUFXQnZoK0E3RmVRMG5DYnFnSVg3dG5EN2ppTTVyaGgyNFZyRVc3NnBGYlBY?=
 =?utf-8?B?N1ZXbU8xZEVlWlFmL0F2a1hhWExYUUlOZHh0enZhT3k0OU5JaVpmY0NneUZI?=
 =?utf-8?B?VGdWbWZlN1dhVW9OODFScGNKYWMwNzJDSGg0aUViUWNYaDJ1RTBYZFNaUzBN?=
 =?utf-8?B?aldEclFibVRsaVZPUGMzTzNMNlQ5RzRJSStPUHRBT0RoTWx2Unl6UTBZNTFl?=
 =?utf-8?B?TTA5OEdIbEhQSVBJZEFOZVMzV0h1L3lsZXl6WTVGdmtha3dUYkgvSEtSODdY?=
 =?utf-8?B?WUs4MUhIZm5NTUc5d1JidEttS3kvaldTNlh1SUdKQ3hFMW96TlJMTm5IM1FZ?=
 =?utf-8?B?eXIxNHJMbmVEMHcrSnVwOTFySllNV0VaL0Q5ME8zWWtCMmdQbE85RjZvT2x0?=
 =?utf-8?B?eS9OYjR1ZVZDQmxvMi82K2ozTkNDcGR3WTJYRGRQWEpFRnJpSjgrOTBkak1m?=
 =?utf-8?B?eWZJT01kcFBMSmNNMzJTdE9vM0xEZXcrR01vaDhOMlJmbXZOaEhFN0FmNExZ?=
 =?utf-8?B?YmVBOVUzNmFrZXRoUTJDcjdTbG0zSnMwNWdQWnlUcE1mNFN5Vjk1a2tocFZx?=
 =?utf-8?B?SlhLMGlxZmhXdm5kSkZoYUt6RjNUdTFadGRQUHVPRmhJa0QzQ2V4QUFVdDJ6?=
 =?utf-8?B?MGNXLzRGTUR2Y0xrb3lYSFpFWG1qcWxxTSsrQi9aaGZKNE01WWpVUjNaM0RF?=
 =?utf-8?B?bE1YbTFkblVlZW5vQ3pXNXRTNUJ2RWM5WnVyMUhZS1VPVzJhUGNybkd0OThO?=
 =?utf-8?B?bmRVL2VhamdBNlZ5K3VPV0JZekU3WC9mVFU3NGNXNDhNcFpIT1Y1bGptejMv?=
 =?utf-8?B?Zk55ci9qcUw5UEtlc0tvWW95S2JDT2JGZkg2S29QM1lnVVpBOHkvVm9jdVZM?=
 =?utf-8?B?cnpoRDhMVWJLRUhDSWRiN3BjNkJFZDl2MU9YNnNEeDNteVJoTTUwNGYrREpR?=
 =?utf-8?B?VjhRbC9henY0bDlmQzVLblBZUkJ1RU5pZ2tPQXU3U2JsNVFaTXVyMHpjRllB?=
 =?utf-8?B?S3JBbURjQVdqQXRKbkFuWnlMNlA1dVN1MFNpeHZjN0VpU1hGcnA4bFFtakZC?=
 =?utf-8?B?cHFBaG4wSWRraTRoM2MwMDNncUxSUDlQWUEwaTZkczRDWDhyMnRLTW52eW9U?=
 =?utf-8?B?c0E0LzEzeVhBQ1l3NHE3b1dlbTFCRGdHQkF4ZE44Q3J3SjRFakVSY2xyOVBl?=
 =?utf-8?B?dlgybE9LNEZlN2xnSU85Nk1ocVFycXNJL1o2MlZSdXJCcEpJWVluKzdrd3Ns?=
 =?utf-8?B?Zll0cTZybmJ1ang3TXRySnFEcDBqcVh5aG1OQ2tYSzJhTUtrTks4Z2FpSGo3?=
 =?utf-8?B?RzJtYlhZUTFwaFRuZXFBU0RrYy95YzdiYWxFWFJLVncvblVhN2twQ2ZvNXpS?=
 =?utf-8?B?UXpNMFZTaE9DUjNtL08xbjM3RkFyRklKTll2emRycVFqUDQ3MHRsdlYrSVVy?=
 =?utf-8?B?YkJyYVNVRlJOME13b2dOV1JwdUFOYlR5LzByU0lKOGJjYndzck54V3I5Z2M1?=
 =?utf-8?B?VVpPVTkrbnBVVFd5d1N5QXhldWlqeHozSnZscEc3WngxTGdXbkdHQkl4c095?=
 =?utf-8?B?eC92bWtMOWR3UTM1NHVQL2puNnpjczh2RE45dVdpUmpmQ0lWK3FiVlBkNnlI?=
 =?utf-8?B?SWdRclMybERoa3J6MnVvZkI2RERmRmNSQlpoMWcrUzdRbC9GRUtUbGNpSGtI?=
 =?utf-8?Q?Fg80dfZwGpLkfLzSInsawuC1tUJnzMDllvU+V4k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4165ad72-c468-462a-4d8d-08d90ef64c30
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 12:15:25.3672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzbVoqRYDSUVtsH0OBp7DE5cGcar4eCpjZAwdjLJplWhlKwqyauXwwll7Gg8fSzC0PB1YSgkgtJudGL1CjjP+crsgGRrtbPTqgzA4ORlT0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5584
X-OriginatorOrg: citrix.com

On 04/05/2021 13:08, Jan Beulich wrote:
> On 03.05.2021 20:17, Andrew Cooper wrote:
>> On 03/05/2021 16:39, Andrew Cooper wrote:
>>> We're soon going to need a compressed helper of the same form.
>>>
>>> The size of the uncompressed image is a strictly a property of the highest
>>> user state.  This can be calculated trivially with xstate_offsets/sizes, and
>>> is much faster than a CPUID instruction in the first place, let alone the two
>>> XCR0 writes surrounding it.
>>>
>>> Retain the cross-check with hardware in debug builds, but forgo it normal
>>> builds.  In particular, this means that the migration paths don't need to mess
>>> with XCR0 just to sanity check the buffer size.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> The Qemu smoketests have actually found a bug here.
>>
>> https://gitlab.com/xen-project/patchew/xen/-/jobs/1232118510/artifacts/file/smoke.serial
>>
>> We call into xstate_uncompressed_size() from
>> hvm_register_CPU_save_and_restore() so the previous "xcr0 == 0" path was
>> critical to Xen not exploding on non-xsave platforms.
>>
>> This is straight up buggy - we shouldn't be registering xsave handlers
>> on non-xsave platforms, but the calculation is also wrong (in the safe
>> directly at least) when we use compressed formats.  Yet another
>> unexpected surprise for the todo list.
> I don't view this as buggy at all - it was an implementation choice.
> Perhaps not the best one, but still correct afaict. Then again I'm
> afraid I don't understand "in the safe directly at least", so I may
> well be overlooking something. Will wait for your updated patch ...

For now, it is a patch 2.5/5 which just puts a cpu_has_xsave guard
around the registration.  Everything to do with xsave record processing
is unnecessary overhead on a non-xsave platform.

I don't intend to alter patch 3 as a consequence.

~Andrew

