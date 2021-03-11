Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6994C33743F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 14:44:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96556.182770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKLb9-0007kU-Fg; Thu, 11 Mar 2021 13:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96556.182770; Thu, 11 Mar 2021 13:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKLb9-0007k5-Ao; Thu, 11 Mar 2021 13:43:31 +0000
Received: by outflank-mailman (input) for mailman id 96556;
 Thu, 11 Mar 2021 13:43:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcZr=IJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKLb7-0007k0-Tt
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 13:43:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a15c02fc-7f36-41ce-b986-1f680e50260a;
 Thu, 11 Mar 2021 13:43:28 +0000 (UTC)
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
X-Inumbo-ID: a15c02fc-7f36-41ce-b986-1f680e50260a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615470208;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CsIkHXPoOGSxp7/5w/kygfKmQ1VAFN1rV9r/PpKO+Ts=;
  b=UoY5mNjV9zl6lbojqHNY+nPs78yRldcViWgeM57uokviUTafaugN38Ou
   2PfntXnqkOXPjW4MXxQR3+58BHKdEyLwlztlJBKWiWZze3J2jjEh00o9E
   CyhvlLs6cnWJGpIdtpyBVSXOElE2xwRMQ8POrzEVVLVieuqww7gnlG62R
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TNyQV1SFqRtu6AZxxmdfAwKcyaF+OX2pENIvRJwwViuQMIHBSBvLttCdfrF0aFdCxzbkWwa8to
 E3ksIDMbhayIGCOPcEWb5sjt4Bg2v33vHxl1AlWUW3O6Fprfq68mE9VnZ9hf0zx2Ae1GmgvNRm
 I6wv5crph4G/xc9i9fLx6wCpFTAY0BXQZd+0lSZedtcyKdqjrPjqq6p0Ae1ut0U43FIMsbsh1d
 2kPnyd9ozxeyyaXsG/qm6ePj5TWyA1gHXb/i8j+SVjGFBpNC6kQ/2Nkvx6JIopBv38aCyp6E73
 FNk=
X-SBRS: 5.2
X-MesageID: 39048749
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JySPvKF4m8ickNv6pLqEcseALOonbusQ8zAX/mp2TgFYddHdqt
 unm+4V2QSxpDEaXnwhnt7oAtjjfVr385lp7Y4NeYqzRQWOghrKEKhOz6vHhwfhFSr36/JH2c
 5bGJRWJdXsATFB7PrSzxK/F78br+Wv1ICNqaPgw2x2TQdsApsN0y5cBhyAGkN7AClqbKBJca
 a03cZMqzq+dXl/VK3SbBQ4dtLerN7Gno+OW347LiMggTPhsRqYrJjgExaZ2R8aeyhVwagr9F
 XElwCR3NTGj82G
X-IronPort-AV: E=Sophos;i="5.81,240,1610427600"; 
   d="scan'208";a="39048749"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiBlT+P2omx2KzxpyHvl2NYDY7MlP+cIXCKvhAK0UxRvEI4KI40B3eJVvAEiV7hou8GL+kGri8Dp2zaUbzSB2lXFjVyh5RgiU6beOYUL90VIbGX7SMuoWqVhdmb9kdMq2d+NGy1cThm5bgVUmIstkDrW78NO6NbyKE8bjXcIZlsQdTo5Ev7fjtg33NdOF89FWREmffhmZeCcQh7p8C6czL7V61KY2SWz8TVQk7dhPH+/ChhUuDPjo8c2TWeB6lCBPJnP3mZrQ28eWYmyQ+kMytbSDv/47Un0OeIIhCs7QAgU0P0lwfua0lEfowUDiKKli0gOSSLc71ihPlpxqE9+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsIkHXPoOGSxp7/5w/kygfKmQ1VAFN1rV9r/PpKO+Ts=;
 b=jO4g79V+qSzZewqodRyFK9YTcMx555AU48O2Y/96T3c5hDFxnXHTJYirYTWUItOc2ga1A9Cd9SwWUfhdwP9/qlE6l44DtKETf7hDAgNGOioCsJP0L8RQGHUTXTHXMPBBv8Jqwrng6ZEMn5ta9WTgrEv3sKC/5E4YJiHtdxC0uLda/1HIiDz4JY1uME+cfW2BD9ieHEh6G1Fb0waqcNO7yQgkRmgDB4WAbZY+Q6W5JYPFfPFmNyxR6/6peZW9QI30DXX/7PWDbTe4LqFjzewZ4Qr+9Mp+pkkKlhY8LUI6MiOyeKph/+3dthcrM+gIUowke1p7HwbYjyoGBJ/S0/9n2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsIkHXPoOGSxp7/5w/kygfKmQ1VAFN1rV9r/PpKO+Ts=;
 b=TazFNiCE9oEygGyANtVAU8jq2veuvjSaN5RvqJ0wXL9aCw8X5lbmDBwG2Z5OPcDU6P01z15FbfNHIjPV6VFmm9rjmUh9aSz+sCszA2ILu+W5gxUjjr6SGSiE3Z0QcumYcDwoxnLuZ6KTKIVL/3AQLHUjgKvNFX/5rOmvF1amOmw=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Paul
 Durrant <paul@xen.org>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
 <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
 <556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
 <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
 <c8ed458a-6064-95d3-f189-f0928b09baca@suse.com>
 <62b79d56-2438-23ab-49c0-a8c4b290c4f7@citrix.com>
 <9a248354-f68b-8cba-f18c-f4a26473f9bf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
Message-ID: <586f5bcc-9d96-dc37-2aa1-aed0bf11117c@citrix.com>
Date: Thu, 11 Mar 2021 13:43:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <9a248354-f68b-8cba-f18c-f4a26473f9bf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::18) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da0346a4-cf55-4de9-34ed-08d8e4939e8b
X-MS-TrafficTypeDiagnostic: BN7PR03MB4513:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB4513B8C617A6AA55A97AE9AEBA909@BN7PR03MB4513.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fc8Y7yQmRXAdUe3WrMaLJmlPR0bFk/XEVIUI+evCBntCpeccCisVC0jBlnfFKgOv2K7cuDHn/nNNRJck3l1bMzOPCpPRxADloK2uKnKDOv6kAQglhSIp+IpUTxjP0qMILtKF2kMu1Yq9mMAfu2Aml7dMEX4p6DZjZO3u0QvoNUIgwKvaChnEjZAgpdpVu+eQoCmvHjZARHVX5TF9ILWgAzODdTQQ3WMfkOG6oPg3GZbKLOGtwJW9Z/81P80CxO0tB3w09IuvmNlDEWXJdR7CX+RRRPbvQeGRqsi0WT7VL5XFqzVBN6gbOkZ/kAUHDp0F0PcEfIHWBnwRzdRAqQIC8d+jSgX39yY1necTs0AhhKyja7RuZAe9hOy+LR2mD91GsmczuS15rNlVDTA9Rdbk9fRAFhL/6EJ4Hk1zkAxJ49W5uuLo2BrF+/QTmrROJhRSGoWU+ZnKdk9cA7WMkI+9XRtfguXAZxGkvDmWsF65slB0SVzq9birlInxd0W7nrPaASZqCQGcPEXbuN7fPUaaUpagDXuVbwqcJhA9MuexOvEszTmeL8FNyeSma8zNII4pXStO2Nm6oztzGZGkZwCV5M32plj7mnRPeT/zR+3oX9PdAD/xAooljQDrupeQoqgYCRGiomKHFF11uJjgCUPrzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(31686004)(2616005)(2906002)(6666004)(186003)(16526019)(26005)(6916009)(16576012)(66556008)(53546011)(54906003)(316002)(478600001)(66476007)(8936002)(956004)(83380400001)(5660300002)(86362001)(31696002)(4326008)(36756003)(8676002)(6486002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUVSVk1ULzVzYTl5cnJocDRlZXRDTTh5TXo5a3VzbWRFMERZRnhRYURFaEgr?=
 =?utf-8?B?SkNZRmhEdU9Xb0NRVTZTTWx4S3l0WXlxZFQ3VnZQS3VLQitjYWFLUm1OV3Ax?=
 =?utf-8?B?ODVkNUhqaHhRV0xINWYydVpSVUtUWjJiQzZIc1FoUTBhbFd1ZUZiRUJ2RlZq?=
 =?utf-8?B?MzdFQTd5eTRRUklkTlBqK1ZEZjNKa1ZRTGdtdFJBTGFwQ1ZtcUs4NDlHOXJZ?=
 =?utf-8?B?VmRJbGJmdlJ1NmJPV3hnNXZlRUJTM3QzbnZCUitmM2lWL2F5KzdkTkx3U29o?=
 =?utf-8?B?YVVidnRyVEpLTmkrUEFIQmlhaTBFRzQ5Ry9VUmsvT0hLUHJYdzZNNGZMRitD?=
 =?utf-8?B?SjNTbGtURzdMZG5UYmNsUFpZN2pndGxxanR2TG5kalB5Wks3Z3pOZldxYmJt?=
 =?utf-8?B?NVRuLzkydHpZVjdYUDM3RTBTR3h0TTc5K1dkZ3VXMzEzZW5yNWZNUDF3K3Bt?=
 =?utf-8?B?WmQxNUFKOW0vRCtiOFhCVWtGWnlWMHVCUnVITUZSOGYxQ2R1YjBNRzB6dGxW?=
 =?utf-8?B?VEJJWFQyLzZOeVlpLzlMNkxkS3B0OUdCQm5SODBqd0xyZ0FUWUhsbER5bzgv?=
 =?utf-8?B?cXZCQUY1Y2xpRzlxM05tdkVaR2twTEloRjAwb2U3ckZxeTJNVXVudkVoZXM0?=
 =?utf-8?B?RUM0UHBpTjU3TnRRS0wxMVZKQk9wN0taTEo3bEZjWTlwUEh4Z0g1OW84MDBF?=
 =?utf-8?B?MXpxMmlDMUQwQVp3UXZtSmxlRVV6cWRaak9yRUtBNmdHZXg3eUxHUHpQV1B4?=
 =?utf-8?B?c3pTTU5NN0U2YUF4azJNN0hYa3pYTjNnY0ZPY045YXVIOTJqUFFZclhqRytE?=
 =?utf-8?B?YVRGekszUTZJbnl6bU5EaExyS1dvZ0puaDZyRDBCaHJDeVc4MmlCYU5obnNq?=
 =?utf-8?B?RVFYRllYcE1jdzJjT2Rtdk4zVktQY3g2ODJla2UzQzAvT1BWU3czVTJ3aXJr?=
 =?utf-8?B?amo2aUVkR2VZdEpoT0NzWGZxWkNHQUgxYlJGZHJWR3BOeElveWdsbGhWNEtL?=
 =?utf-8?B?WlJMRGZtczd3LzFzck9OS3U4RFFaZlZjLzd3V2k3YVFjNUNWNUVWTXpicmVP?=
 =?utf-8?B?TWgxRG15N2xQQWJyMXBNMlM0Zk9vZTZNZWd4ODQ4MWMrVndFeVlnT3Vad1lV?=
 =?utf-8?B?R3Q1YUVVaWlsRStUaFhIUXhJQ0o2d29rbjUvTGVoTFBaRGpPZ1BnZzU2aUlO?=
 =?utf-8?B?bVFZUWhoVHp6T3FGc05qckVJTytPS3pjZGtGM3d1ZEc2ZWw2cllUeUxsdXc2?=
 =?utf-8?B?bFIrdmdqQkJQT0xoUitEenB4ajhVc1VXKzBuS05DRUxLNHcxUk9VVGFWWnRD?=
 =?utf-8?B?Q1lEKzJJL3ZBUUI2TVZ1TlR2VVZpek53RWJGbXlGdWF2eU1PdzRNTFJITFdk?=
 =?utf-8?B?eGFGd2FRMlQ5VU1qQ0dsYnVSVVl6Q3RUSjFSYnBXKzFCMlJwdnlIMjhQRG9E?=
 =?utf-8?B?M2dwaG80dlVjR0FqeFNmYVFEYW9tYjUrQnVoY0RpUXFPUkxUNzFJMGRJVEMv?=
 =?utf-8?B?NGloa2cvSjZVZjV6dHV6b05qM25xMnp3SWR1QlVRVVhpSUxQUjJ4UUVXbDdz?=
 =?utf-8?B?UUNiVzJDcTJmL21rdUdSUmJ4bmRxcXpsZlpWRHBqMHVWR2wyVEU1d0dLRFly?=
 =?utf-8?B?OVB0Qk83c2RaZ3JkWkRHakJwMlVNbkNpam0yakUwYVZPZVhUTzJpcFNURzVS?=
 =?utf-8?B?Wm45UTR4S0hJQit3bFNkQzJjWjlzR0h2Z3BKQm9hTEx6YXhjaTNyOGR6ajkx?=
 =?utf-8?Q?mq9ldInYD2Zy2WsB23VVPoPIjiASWtzBmdZ86WG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da0346a4-cf55-4de9-34ed-08d8e4939e8b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 13:43:14.6452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmsa4T8LCqo/3Zz9T+f15OGGBbcSe1tKfRgOg3dpiiSjEt9x886smvqwg1aPFluykz1n6Na6pvqf0PBL00VXnavWqbQ5SQ8DXy8/swCZFFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4513
X-OriginatorOrg: citrix.com

On 11/03/2021 13:28, Jan Beulich wrote:
> On 11.03.2021 14:00, Andrew Cooper wrote:
>> However, having laid things out in this way today, it occurs to me that
>> we should consider further cleanup as well.
>>
>> I do agree that code wanting to use the libxendevicemodel.h API almost
>> certainly don't want/need the dmop ABI.=C2=A0 (i.e. an individual consum=
er
>> will want one, or the other, but almost certainly not both together).
>>
>> Should libxendevicemodel.h really be including dm_op.h?
> I was indeed wondering.
>
>> =C2=A0 AFAICT, it is
>> only the ioserverid_t typedef which is API shared between the two
>> contexts, and we can trivially typedef that locally.
> Hmm, a local typedef isn't nice - there should be one central point.
> Granted there's no risk for this to change in anywhere halfway
> foreseeable future, but still. Also neither C89 nor C99 allow a
> typedef to be repeated - in those versions we'd then rely on an
> extension.

I wonder if we're depending on that extension elsewhere.=C2=A0 As far as th=
e
stable libraries go, we are dependent on a Linux or BSD environment
currently.

Alternatively we can drop the typedef and use uint16_t instead without
breaking things in practice.=C2=A0 (As long as we make the change in 4.15 a=
nd
we lose the wiggle room afforded us by the entire interface being behind
__XEN_TOOLS__ previously).

Thoughts?=C2=A0 I can't think of any ifdefary which would help, and swappin=
g
to uint16_t would reduce the use of an improperly namespaced identifier.

~Andrew


