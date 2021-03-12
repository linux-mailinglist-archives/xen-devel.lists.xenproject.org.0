Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C2338870
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 10:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96920.183851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKdvU-0008Mf-TR; Fri, 12 Mar 2021 09:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96920.183851; Fri, 12 Mar 2021 09:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKdvU-0008MI-Q6; Fri, 12 Mar 2021 09:17:44 +0000
Received: by outflank-mailman (input) for mailman id 96920;
 Fri, 12 Mar 2021 09:17:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c+C0=IK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKdvS-0008MD-UZ
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 09:17:42 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf8f147a-f303-4c1d-a304-04fe09e113ba;
 Fri, 12 Mar 2021 09:17:40 +0000 (UTC)
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
X-Inumbo-ID: bf8f147a-f303-4c1d-a304-04fe09e113ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615540660;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=W3px+BUg/rTI+S1HncfRe1xwPoKeUxUtH4x33O16eBM=;
  b=DpKDCjsOtY0OqGJxL89+D2oO2ExpgpujIfIlOy7dKeuNwaRTjfVqN58g
   Rb+cIz8a42GYEqVQopdhgOGnp6h7YgSWzgEOZchKSVV/4tDjv8L5YqiQ6
   sWT0X+/h3XmSEkfLwk1NzPRjIP8hrCKheHZxhJVgH7jTu3ruzqVzktVyk
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zBaAJxJi7sVu5ZNg+6xKSpVMBcDcFXxfABl4ZwDezWOGVJlfluVIAgmkXioDB3aFzOciJaS4+U
 ke9hggUxurxCRtixRSa5mXgdCGYMQkHIrLZN13ja07GclfExOPzqDqiHQPgPSoldeoe55OEsY5
 0fymLuijjiojSmVyXwVc9fMOJhS/zXjKnGp1EK0x4RboyZH50ObPRJRW89g9Rq0/fO/VxY7ZRa
 fnwVTAmC2c1zVhL5SfAQ3EhEo1h2lwbK2olThU20TeI2uER7zM/0xyh/TIsQJQXnJ2pFus1JZk
 iHs=
X-SBRS: 5.2
X-MesageID: 39498830
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:W+kDaqDM6p12wRXlHeh+sceALOonbusQ8zAX/mhsVB1YddGZnc
 iynPIdkST5kioVRWtIo729EYOLKEm9ybde544NMbC+GDT3oWfAFvAH0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JbzqzNkFtXgFJCd4YOf
 Onl6l6jgGtc3gWcci3b0NtN4T+jubGiY78Zlo+DwMngTPksRqT9LX4HxKEty1uMQ9n/LFKyw
 n4uj283IqPmbWRyhjQ12jchq4m5efJ+594K+GnzuQQIjXooA60aIpmQK3qhkFInMifrGwEvf
 OJjxA8P9liy365RBDLnTLdnzPO/Rxry3j+xUSWiXHuyPaJOg4SOo56qq9yNj76gnBQ2+1U4e
 Zw8E+y86dzN1fmmh/w4tDZPisa7XackD4ZvsM4y0BEXZB2Us42kaUvuHl7Pb0nByzA5IUuAI
 BVfbvhzccTS1+cYnzD11MfueCEbzA2FheCdEAIptaY5ThQhGx41EsV3qUk7w89yK4=
X-IronPort-AV: E=Sophos;i="5.81,243,1610427600"; 
   d="scan'208";a="39498830"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQtADgaxehEK7j6KLDLkoGfr7fnuQZspHHGLjqthWGmRcasEy1w+pirEprCHE6mbCTCX12L/iUir7Aj3e/xvhbP2m5Ww3hHj5XRSRmepe46ELuvtC9gIL9rKQl9zrHPi4QwONZhQONiF6JQyKjaPzMcCsa206FNYnsJbfFt7Tm4zSZ50PA/+E+TPPkTivKuc3S4BjjJZlam2UTp642p1RI3BObtNK0rKM34qj09lHv6dGnbTsRX3YiGGI5QKKfT5ndlelUFGi8oMp9g8gueqHMyJKB/hYYqarP0MsK1BhpbwazgUSSBEwjlzhfqVIkI7Q3xuonTIKak3fDCxZ3Km/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXEesVwcIzvJnI2AeWvQ2pA4aR7oZWJHG/XQjhGHEvU=;
 b=SB9f7OzjUrmmkEWqfYMNMb67KJWkdf+foFPaJuSwkTU+AQLLh6HHzK6YUwktHvAEF9Opm+o/SED2I/EAj77mPbMZMyK6XW0lckJt8MGuYFHsmwEITSRwDLjO30R9kPjkDSr3fmohI4VG4vHfcypSqEYZ5qA1SIYMIOQ3TUcxj3Ya7LrZ2cwE/i1sy4OR627VZbCRXl+p3T+FrtVzP7Kn8VnE/RN6phZIW5JV1rwy+tgV4r8tkd+UuxzHrGAikcx6CCxIThmMKXNFQob9cp49vlP0RP+DkUKLpJ4oTtCQiF6mmqcv4uQr88mi08f87lQae8pN2wwUSASnqNYI7+8C9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXEesVwcIzvJnI2AeWvQ2pA4aR7oZWJHG/XQjhGHEvU=;
 b=XS5lj6CzITCH+8VF87sxww/197JNIB8GXN6tQh9aSsaFUNLAdmTQ9vYMIpCsRH0bEqku2TU7PMdqRDBx5DxYnHA/fDVRw0obK7m1uFYaQ4AGh7T5SuH2YdFPWI/TOwjy0/f7FJK2QGeiqjRBGBW33MBGp0hOqc8WSApqLH9BOX8=
Date: Fri, 12 Mar 2021 10:17:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2][4.15] tools/x86: don't rebuild cpuid-autogen.h
 every time
Message-ID: <YEsxq0FIHK6Z9pzV@Air-de-Roger>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
 <1b8aee19-9194-153c-8dbb-0aec3412e255@suse.com>
 <YEo3VzlTRTaBUkqw@Air-de-Roger>
 <c88981fc-b83b-b3c0-f003-59af72e6065b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c88981fc-b83b-b3c0-f003-59af72e6065b@suse.com>
X-ClientProxiedBy: PR2P264CA0042.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84942082-1f29-478a-8e9d-08d8e537ad9d
X-MS-TrafficTypeDiagnostic: DM6PR03MB4762:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4762ED70D7AC43944446E1D18F6F9@DM6PR03MB4762.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHjBLzrmBxQaIkkvJ+R4Q++xzzBgLyvx9tYn4rN99uPbTUNi/2++SXoOjEyLpwVBX5kq8h9KZJFWd4De99P+iu67kgHFbl8QPGoAgQPIU4T8EXY7ZORZ9N0iLROdj3X3ALzvy8oru41U9+DD/OYTNCKFC/KBj+moiXPnklR1tAQeBmZ3feJ6ljCQM3+WWhaXedm9WlWcXtbq7yyVKiZ7K6Kz+yuzIBeZO3L/FIm2koTlxzb5XwJ0aG7k6Xqryj9pbWm51GPrUzRuLVHwuvaJ9EGz+93NVOOF7Xc0Q8GPyUBLP8rjwaY+35Btx2kO3pI347Bi5gBAKVdzY8gW32WcgA89ZFuSJIn05Z6VpXsNO8V2HOyhoRMCODbPb4pCxpbGdRGH61bRN+5ErudcWe7MaottrGSdmiS5o3ajYWTbFekK2prNVSqzDmT3UqxH2B0URRRTuzb+LowMYzO0BngIhSRFb4nSEUWj9uS7t2XaOiPQF1DopSqNDBJfdURn5aJv3+odwRRU9cOpiMzxaWAghA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(136003)(396003)(366004)(39860400002)(346002)(66946007)(66556008)(66476007)(8676002)(85182001)(956004)(16526019)(186003)(8936002)(478600001)(26005)(4326008)(6666004)(9686003)(6486002)(6916009)(54906003)(53546011)(316002)(2906002)(83380400001)(5660300002)(6496006)(33716001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bDl5VzNaS01WWWhBZ25KbFJsZ05IZXpOMWpETVlpclJZai9rU2sxaXhjaFpn?=
 =?utf-8?B?T29IdS94M1doNzY4SC9QL3ZRM2xZakxHZHppSko4M3pZMWJJQk44YVMwajRY?=
 =?utf-8?B?VkdCMGlGQkFQSDZFSFhhbTdmWmF5UzVXWjFRMjNqZkdWMWpBL1hRRTl4SWYv?=
 =?utf-8?B?V2FJeVlOQlpDdU9HazAxQzNhWTZ4aGhYVXJybVNzdG53azJOZkFXaFNnU01V?=
 =?utf-8?B?ZUFPMTBGajdhYWtMWHZ6TGhRZWR0RDk0bHBuWWlxa2IzTFpyUTRKVDRreHdX?=
 =?utf-8?B?d3NOSjBMb1M4WEVkdlpiMDRRemZFcjlJQmZJYU1NUHdoR1JJRHY2MDJSTm5M?=
 =?utf-8?B?dlRaNlFsWGx0WVViNWRzSnpiT0dxSzFFSFd5cXFOVUh6WkF0OU9SVUhYVEs2?=
 =?utf-8?B?RWRPQi9QVTdHdzJxZVpWSW9XN0lVbk1HRWh6ek9rV2RMeUR3R0VmWlQ5RjRa?=
 =?utf-8?B?cUVJN1dJV0hJb1ZGd0k3QkpYcGo4eWdOYXlEQjc2UU5KWU5NaTIzU1M0M0dY?=
 =?utf-8?B?N3I2MG9VZGI5YUxpVUh6djNuSHZiaHQvNW1QdjM1MjVJT0drMmM1MW5ZbnZS?=
 =?utf-8?B?dFdDeWNwU3RFN3AwV2ROZ0RKajlSTW54N2I3UE1UTDI4TjNFOXV4TXBSZ1NO?=
 =?utf-8?B?RnFrQmJMcThRZUhjY0RtYlFjSitMWUo5dlZPdElLQm1mUUo1a2Jmc2VRcjc1?=
 =?utf-8?B?REo3RXF5ekhWbW1yZ1YrbDVuYWtoNGFIMyt5Wjg0eHhMSlRSajZndGppYnVq?=
 =?utf-8?B?RHdwV1BRYW1WWGFVZ0xUWHdyN1BJVkVCNysyZTZkQnd5VjZvQ1VsbmgweDMw?=
 =?utf-8?B?TTgzdTBMaDlma0pMMkk1eTlVaXRIb2NrcXg1dWZvbXRlOWxPSGxZTnlMWjU5?=
 =?utf-8?B?MC8rL0JPV2RVTFIwQ1Y5eXZjRnloM3JwRVdvdUgrc1BDQXdnZXZ2eDVySERD?=
 =?utf-8?B?WGpxdnN0NHNCSkdEWUdIVzhtd01hWFd1SkxWaDBvN2tMb0tGS3BRcWcvYmZM?=
 =?utf-8?B?cC93V25OdmhyMDh6RnM4b09FU2tsMFpUNTVZMngwTjZIVHM0WnVXaGhZamph?=
 =?utf-8?B?a2JYditBaHVxYmlOaUNQUEtXaWtrZUUrL3RGOVlFTDRHWnY4KytURldQbnJo?=
 =?utf-8?B?aFZvclhTZzdMNDkySlNkOXVxRmRWM21zVkpHc2prOHlIYncxTmsydGZoNk9n?=
 =?utf-8?B?ZW0vV2JwL25PdGwreVdQcURMdEwzWTRYTTV5N1REeEpBSXJNMit3ek5RWmNH?=
 =?utf-8?B?dTlVT3ZZTTZURTJOSllNN2NCZ05rMS9UTTAvWVBJelVjTE90eDdFMTJSaE84?=
 =?utf-8?B?TDYrdStGVFVSUVkyQSthTVJCL1VHTWRjZzdWZDhpdEFYL0NGakZZcnF2QWIy?=
 =?utf-8?B?dVk2N25lLzNCRlNXM1pGd1dSVWYvUVM0RXNvVHVQdGw0RVMvcjBrNEM4azFn?=
 =?utf-8?B?T3IvZVhuN1RDTWU2ZEhNV0lONUFvQVdtYnlKQjdoMkU5RTdDcXNnZFp3K2VU?=
 =?utf-8?B?ak5SVWcyNnBmZEFNWlloL2N6WmdXTHcvSjFVY2RZZGNkMUtVVlRON0gzMzFH?=
 =?utf-8?B?aG5xeDR0ZVNweW9ISnFvZG1oMXZnVFJIanVHbmVuWUdlY3FuYWF5VE1XUTEz?=
 =?utf-8?B?TE1QTjVlZmZIZVJONzBPZUY0bkxrYmQrdURnQy9hMGhyUENDRzZXalJGOC90?=
 =?utf-8?B?SmsrOVo4NG5pNGh0ekxGMHJvWUpvM1V5QTBvVXU1eUZLd1JSak5yYVlpUk5l?=
 =?utf-8?B?U1oxZ05MR1E0b3QyREU1SDNxcmkweEo3QzJuemxWRi9vdmZ0eUNHckR4VDdO?=
 =?utf-8?B?VlhaV1BQOEFhamh0d1EyUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84942082-1f29-478a-8e9d-08d8e537ad9d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 09:17:37.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSXTNYzAcvvEQ5er83lqXCuosc7NMQtLvHwURZfJGMlK5DcfhLJ9VrWIw/BBEML4ceRNsV3E2Ew2co22YTQbnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4762
X-OriginatorOrg: citrix.com

On Fri, Mar 12, 2021 at 09:45:35AM +0100, Jan Beulich wrote:
> On 11.03.2021 16:29, Roger Pau Monné wrote:
> > On Thu, Mar 11, 2021 at 03:40:05PM +0100, Jan Beulich wrote:
> >> The first thing the "xen-dir" rule does is delete the entire xen/
> >> subtree. Obviously this includes deleting xen/lib/x86/*autogen.h. As a
> >> result there's no original version for $(move-if-changed ...) to compare
> >> against, and hence the file and all its consumers would get rebuilt
> >> every time. Instead only find and delete all the symlinks.
> >>
> >> Fixes: eddf9559c977 ("libx86: generate cpuid-autogen.h in the libx86 include dir")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> v2: Different approach.
> >> ---
> >> Ian did suggest to pass -0r to xargs (and -print0 to find), but I
> >> couldn't convince myself that these are standard compliant options. We
> >> don't use any special characters in file names, so -print0 / -0
> >> shouldn't be necessary at all. The stray rm invocation when there is no
> >> output from find can be taken care of by passing -f to it.
> > 
> > Why not use `-exec rm -f {} +` instead? That seems to be part of
> > POSIX and is likely nicer than piping to xargs?
> 
> I've looked around some more and also remembered an aspect because
> of the looking around.
> 
> 1) xargs has special provisions to not overrun argument space (leaving
> a gap of 2048 bytes). Nothing like this is said in the spec for find,
> and in fact I recall having had issues when the accumulated arguments
> needed splitting. This was on an old distro, but I wanted to mention
> it.

Oh, the POSIX spec does note this:

"The size of any set of two or more pathnames shall be limited such
that execution of the utility does not cause the system's {ARG_MAX}
limit to be exceeded."

I would argue that not doing this is a bug.

> 2) I've found (old) indications that the {} may be troublesome to
> some distros (Solaris was mentioned) and might need quoting. (This
> would of course be easy to deal with.)

Hm, OK. I won't insist then. I'm not sure we should still consider
Solaris as supported anyway. It's likely to explode in a lot of ways
when trying to build.

Do you really need the stderr redirection to /dev/null of find output
when using xargs though? As that will just drop error messages, making
failure diagnostic harder.

Thanks, Roger.

