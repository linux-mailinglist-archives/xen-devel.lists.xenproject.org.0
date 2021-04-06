Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CB53552DB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105921.202570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTkHA-0001wZ-D0; Tue, 06 Apr 2021 11:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105921.202570; Tue, 06 Apr 2021 11:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTkHA-0001wA-9m; Tue, 06 Apr 2021 11:53:44 +0000
Received: by outflank-mailman (input) for mailman id 105921;
 Tue, 06 Apr 2021 11:53:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hTMm=JD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lTkH8-0001w4-GT
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:53:42 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea13516e-0bdf-404b-b1ab-607c922fbcd6;
 Tue, 06 Apr 2021 11:53:41 +0000 (UTC)
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
X-Inumbo-ID: ea13516e-0bdf-404b-b1ab-607c922fbcd6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617710021;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uBse7rk8WKSz7q06G/Wy075gUEWHCDjkTyYk3YEELi8=;
  b=cbsLCo0PVlOlFiciGsnVzoxCS6Con+lfNP+iJSB7k5sQVeHRY5pHlm46
   aCkvffeh+UWVu831zBCG6Mcanvj3ps1H+hbfUns0Mj07hM8wmcXNC90qI
   58/fKAuqQAEwI816Nex28uVeYHdW4VqfYP+uBp16KV/wV+61WWAC6ZehM
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1gfjigUhXjOQy7/TtnNjDyAsFOSFAXxX8YOu+DcE6JV0rZbRSNCAIqr2OasrgkVDgJYEr0Zuyl
 TuN/BQSQgqv/GsNgKhre4ExzG3yV7WsEHRV4Hsvy30HYKPW8L4KWTzfp9HuthhYRRyiNhSNmJO
 hWYNYFOQVEds5vvoWwsg6hoU6MPoCgw4nyhoYuty/a0pRONVH1A9WNmunXmc/56TysnyRPCT++
 v47vFlTcOXN8mgeoBYRqOthlrwt2gn5UFNern1d57nwVyhS5wq+3j0pXDSShLJjGz7SUOUsvOl
 VAQ=
X-SBRS: 5.2
X-MesageID: 41338039
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BZnfyKmOJ2gUJLQKLHIl0sJkNdTpDfOlj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN9AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 1dWoBEIpnLAVB+5PyQ3CCRGdwt2cTC1aiui/vXwXsFd3AQV4hLxW5Ce2WmO2dxQxRLAod8MZ
 Ka6NZOqTbIQwVsUu2QAH4ZU+/f4+DajZ6OW29NOzcLyimryQmp5rnzDgSC0n4lPw9n7L8+/Q
 H+4mvEz4q5tfXT8H7h/k/Vq69bgd7wjuZEbfb88vQ9DhXJpkKWaJ96W7uE1QpF7d2HzFoxit
 HDr1MBEq1ImhXsV1q4qxfsxAXsuQxGgxCN9XaijXTuusD/Tj4hYvAx/L5xSAfT6EYrobhHoc
 B29l+ZrJZeAFfhmynw9rHzJnVXv3e0unYrnKoviWVeW+IlGdpshLEYlXk0LL4wWAbBrKw3Gu
 hnC8/RoNxMd0mBUnzftm5zhPSxQ3UaBH69Mwc/k/3Q9wITsGFyzkMeysBatGwH7ogBR55N4P
 mBGrh0lYtJUtQdYctGdak8aPryLlaIbQPHMWqUL1iiProAIWjxp5n+56hww+22ZpoSzt8XlI
 7aWF1V8U4+EnieSPGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmNU1Yrn8y8o+gOA8HSVv
 qpUagmQMPLHC/LI8Jkzgf+U55dJT01S8sOoOs2XFqIv4bKJ+TRx67mWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9hBDQXnjqa1Hu5J4YKtmew8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZLX9kq26omGy9X3S73pgPwdcCko92sShb1p64Ssxd2/ke7cKvNuSPUpI2mGcGxN5R8TKVB
 JEq09v4qKxJZyIzSUkA9aqW1jqy0c7lTavddMxi6eD7cDqdtcEFZ4gQrV2DhiOPQdygxxWpG
 BKbxIkSkfTGij1s7isiIUZCYjkBp5BqTbuBfQRiHrE8W2AuMkkRxIgLkOTeP/SpTxreh15qR
 la9bQFjL+JhDC1QFFP/NgQARlrc2SYALVPEQKfQp5b84qbND1YRXuWhDCclhE4cnfr8UJXnW
 D6MSiIY5jwcyVgk2Ed3aDw/FxucGKBO0p2d3BhqIV4UX/Lo3BpzIawF+OO+nrUblsJ2ecGNj
 7ZJTMUPwN13tiyvSTl7wqqBDEjxp80OPbaA6lme7bP2mm1IInNka0dBfdb8NJkM9/p29V7J9
 63akuQLDniDfku1BHQrnE5ODNsoH1hiOj2wnTenRqF9W96BeCXLEVtRrkdLd3Z52/4R+yQ2J
 E8id4up+O/Pmj4d9bu89CeUxdTbhfI5WKmReAhrp5Z+bg/s7Z+BJHXWzrF3nMv5mRLEO7k0E
 cFBKhr6rHIPYFiO9EIcyVC51wziZCBKlAovgGeOJ50QXg9y3vAe9WH7LrDpeBxXgmPpA7sNU
 Ke9CMY9fHfRCeH3aMbDaV1IWk+UjlN1F1yuOeZM4vXA0G2cusG+lywOHq0aqVcR6iIAq94lG
 cO3/iY2+uMMzPl0wXRtyZhKq1A82y7Udq/aTj8aNJg4pi/IxCQmaOk7864kSfvRTa6Y0oeg5
 dZdUZ4VLUxthAyyIst0iazTaTrokUq11tGiAsX6GLQ5g==
X-IronPort-AV: E=Sophos;i="5.81,309,1610427600"; 
   d="scan'208";a="41338039"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gX/DwznogCU6b9YFz3u2F2hVFhw3s4hBlnD7VzHQs1z3P62n1XmgHumdFuzHZSBJSw2LU2qcCZ3ozfr0Zw/Kt01fGTFNZ+pwHuMOud/NRlgPWjX6My4AuGeqzwE5nrQTi7/Qse2yJ/UyEIQeg7jlwf0Lk5vDUAZZ8OYUs3z5g0x4IzWCKO4N2Ftvq2iuRxcY447sc677tFqdA4xQZztmTmgyyy8RlKKHlZnupMdwmAFQ/0JEUQRjDDgKqzU/M1vf7KTHUCe3IgHfpCbufl+XLdn/ot/47l3rJquYLg806sSn4hZxztCu2eBynF8XejuY7fjH5494nZn9xhwgdk4nWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBse7rk8WKSz7q06G/Wy075gUEWHCDjkTyYk3YEELi8=;
 b=aqilivYbrIF/wcx46B2qPUytR8m+MC173wTke1tL7JCmKJhYTbx7ZDv3/wYiy1JYIkw6bcFB9FrHh+W9lBzNWV4w0LhmHc7Dzq7x6dwbfP9w1128BOGTUJUUbfV+H/yf+4GorRNb/fkoe2MwPRQfnsFjbKSURxcPI/SPCFREJnGedK80D2F73zGY1WyCsq81zYJWPgnD+y68T0eYrp8JpYWFnjCw7Jw0gph8nTZgxC1XKXEwLK5gVh8EHTw0wLd2L6Tl4vlhxopiM2FuJX1xAG9myoLaSZ4taThvt9BNwDPDL5ocRBu1MQpfBeX/euiSD6s1fc6EOuUI+H+TkbiG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBse7rk8WKSz7q06G/Wy075gUEWHCDjkTyYk3YEELi8=;
 b=bTA5o4f67Ee3t5jWIgyo/UYkNc1cMEz4hI130i6Glo2ih0H9Cua1X27PaWm47NJJc1nJcGOOG4EIrpE+Ecw6eVNuR1fMe2XQ+tuKvZUKnr4T6LrlpDBCLe2pqE309CUHT3rIWvNocHaoe1xJ7khuhKPXdMISrqNDNpRcjPuFWOI=
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: <bertrand.marquis@arm.com>, <wei.chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/3] Use Doxygen and sphinx for html documentation
Message-ID: <225d7e0a-c5c6-a954-9141-ba1d859f400a@citrix.com>
Date: Tue, 6 Apr 2021 12:53:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210406103603.8530-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0335.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::35) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17e384a7-b477-4cc0-ff6f-08d8f8f29cc8
X-MS-TrafficTypeDiagnostic: BN3PR03MB2371:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB237124307DC3C0C3A55D072ABA769@BN3PR03MB2371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 99pj7xs19/uJtjq/C/niIts/gxrsTYwRGDIJQTe499vGXPUmE0lJPdACuC7ke4bSm/7R4Ls7eySH+Y82NQK2V1rN016CadYm6Mg1hYDJ188ipoKGagkiDTUrA2ZrrEBxMlMgkMZGMIU1xgxiQSeOJOrwZPpyD6ZIdmeLAtHuNbqdd4m2yLC0aOK8P1sHVBFhuMiCE8XjXSvvUoTyibZBE9clpgvWz2fJn290yTWH0kAFGmlFKckqlK4GR591KhJVRtZm/+UrockStDX8kDlTpS8er8stbrT+sxsDWaUXpcBCttj0uXmadRYSiD6OWN8kfJXrxVaiaM0yRiDxdZDCQPuAYeiI0kTwnqRbSlRCGtB9gPymva3sZs5uPwmBMEZOde+u0nF3uPt4vYZKZvdr4QJaCesN3dA6/3HW2TTl6izxABstoHTTZz6UV43IiSWzS8Eybh8rfU3G6YhrC7ZgnlLqKR7mHDIcnrKDecLN+i3HhDasgmgSD7EJib/V+rapEGMLqrlAK4Kc5bh+WMeaWe74yTttgrrBwVRDicyksRWSt/+8zavS/MxGHXwCl3Lne709Q7iGfO2YxyoCy3PueiloMCoqBIbb4s8dRXGZQCR79udq1tiWzyedwnvbQsxJwUFEYkKR3TWi2nI07djHJgvI35I4HB9Iss4Pt2ko7cD1isF3un9AR87yxpD6QjzMT7VF0BBTK1FlJeXJIFwobxNC3cc9UBCUrAYr86CzvkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(5660300002)(36756003)(2616005)(956004)(66946007)(38100700001)(83380400001)(31696002)(53546011)(86362001)(2906002)(66556008)(66476007)(478600001)(6666004)(4326008)(31686004)(54906003)(316002)(16576012)(8676002)(186003)(6486002)(26005)(8936002)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Si9LSVhTR3loRm5ISnNGMFVxRExpcS9iNVhIbkVTY0dMRENhQjQwY1lmWFRJ?=
 =?utf-8?B?T0hmQmxCUDVqUzBWL0VJUUtVUHRPcTNVUGJKUE4ybU1aWmRiUWVFTzUxWVZQ?=
 =?utf-8?B?cW5ZdFlTQXdzNUVlMGlBQnIrQ0ZydTJsZktzVUozQjAvZzNLbHl5RW9MdUoy?=
 =?utf-8?B?emFUVUg0NjdPTXkrdWFLMzFFOEk3NFkwTXAxQ0dVK0FONXFwRU5rSitndVZE?=
 =?utf-8?B?N01wYUxMSkdnc3hoeXVsZldpOTRTbGREN2tqUHVjdE5XVm1BRzUxcDBDR2tl?=
 =?utf-8?B?V1RNNEdOQThJUEltNFBuZW44RThWaXEwV2RGT0lLMis2ZEUzMDVhRVNweGpr?=
 =?utf-8?B?cFZVVC84SE9DV3VjeWR3c3Ewd2kwaUNldzA0YzdvZG9NakxSSFZWL2JnM3Z0?=
 =?utf-8?B?VU5VOE5lWkpqdTcwSUNZVU1POGJHSDRFYWdZYzhFSlhDRGRGNGpXaTZVL3RM?=
 =?utf-8?B?MlV2N2pJUm5tK1R1RDRwM3BGZDF6bmtGTHBpdExYMGdMU3VnYUluOUJEamN5?=
 =?utf-8?B?eDNsZzBSbG56VDEvbDVOd2p3UDlBM2grTkJvbkZtZUVRRmFGNm9KRkNpN3B5?=
 =?utf-8?B?RlBVWmE3S0JGeGRSc2JYdlAxQTFUTDVKZWpkUXJoanlCbGZyalFsT0xoeU9v?=
 =?utf-8?B?ZHNub3NJVFd5eEFzZ2ZqYStpVm5WcTZZV2hxOFVzTUhxUVo2U1k4RnByQThT?=
 =?utf-8?B?d0REcUZGYzVCejRzVTh4MTJFdEhqNk12dEFYZ1VsRUp0WGlWZW5UOUlpYmdD?=
 =?utf-8?B?Tm1zMUVlZFprVythcVdjSmU2dVVHMXpkRTlkT3piNEl5TEgwU1QxUmMyaWd4?=
 =?utf-8?B?T3dDdk9SOGE5eWZIQXUrV2NiNS83a1V0LzYwWEYybXRhMGNrN0RWRmxZeUY1?=
 =?utf-8?B?TUVvOVpBVUU3Ly9jTm9VekU5TlNTRUFJUXZ6THRmeGdFWlcvR0FWRjhWQmp6?=
 =?utf-8?B?eGxDSDBOSTlMSmlFUU5FUVdqWGthb3U5NFlpajZJeWk3a2p1UFlUVi9TdWRB?=
 =?utf-8?B?eFZWYTNKK2hJZlN4Z2c4bjY1dnR4bWVESDdFZGlWY3NMUUI5cHI2L2YrMmcv?=
 =?utf-8?B?SHpwRDJRcmE1RUF5b1VnTzBXYXQ5d1puRk93bmlNU2ZwMmpEY1RsRGxvbzF5?=
 =?utf-8?B?Zkx4dVJzWURvaWU2dkJTK25haVBOdlVqVmZPaVpLNjBhTkhXSHlYc09ob042?=
 =?utf-8?B?NWs5RXpCVUJyaExqVnNYQUd2N1UwQklFTXVKQUdvVFRvcTBTUHcyZ1dSSExL?=
 =?utf-8?B?dEtheWN2ek9jamVsWXlEdGNyUVRrb2VUOS92NmhKSTRuY3FCU2t5Zk81a2Zj?=
 =?utf-8?B?Qnh5N2x1aVNoeDUzclFoZ3c5YTJLRmxuTkdVLzdLVm03cUJCSm9PSWlMdFJW?=
 =?utf-8?B?Wk91REtHcm9yTnZWaTY4MHgrTEdweXFYcjErREk3dnUxVzNvTExNeno4M2ZK?=
 =?utf-8?B?bm5QcHc5dVRGd3NHT01ZanE3NWtTSlhTd3pPRWI5UzkzTVhKYmZiTnZFZTM3?=
 =?utf-8?B?c20vcjBzbk1qQWVUaEQ1TlpnREowSjhQcUxORXRZZ1ZwRGM2WUZyR1JvemZG?=
 =?utf-8?B?STFZMW1KdTNjUGJTbXQ4cmFRZ291SDNBalBlYVB2V05ScVExa01TanFHZWNL?=
 =?utf-8?B?UTBrekRiaVRxYnNSanBIWkpkR1pPZ0JJeGEyWVZGYlNEbVZDaUlETGhVYjFV?=
 =?utf-8?B?UnAxMEk5RmZtekxZbXVpQXZzVG1uSWQzNUYrOE0ydGRvb2o3RFdXaFpyWWgw?=
 =?utf-8?Q?P1wP3KxMYU67qQ5xtbMXEH9fUYagEgq4l7oy0m3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e384a7-b477-4cc0-ff6f-08d8f8f29cc8
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:53:37.2545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDQ7iQFLX8ZsvZnh0P3AnQszQ2Sp/BPZp81sliyK1lu2Z2W1ytJebAiQe9sdjCEH6PT/1LmwiVrvznYbBIDRM1m6LzCFjCfkHfrdNCm2qrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2371
X-OriginatorOrg: citrix.com

On 06/04/2021 11:36, Luca Fancellu wrote:
> This serie introduce doxygen in the sphinx html docs generation.
> One benefit is to keep most of the documentation in the source
> files of xen so that it's more maintainable, on the other hand
> there are some limitation of doxygen that must be addressed
> modifying the current codebase (for example doxygen can't parse
> anonymous structure/union).
>
> To reproduce the documentation xen must be compiled because
> most of the headers are generated on compilation time from
> the makefiles.
>
> Here follows the steps to generate the sphinx html docs, some
> package may be required on your machine, everything is suggested
> by the autoconf script.
> Here I'm building the arm64 docs (the only introduced for now by
> this serie):
>
> ./configure
> make -C xen XEN_TARGET_ARCH=3D"arm64" CROSS_COMPILE=3D"aarch64-linux-gnu-=
" menuconfig
> make -C xen XEN_TARGET_ARCH=3D"arm64" CROSS_COMPILE=3D"aarch64-linux-gnu-=
"
> make -C docs XEN_TARGET_ARCH=3D"arm64" sphinx-html
>
> now in docs/sphinx/html/ we have the generated docs starting
> from the index.html page.

Do you have a sample rendered output?

The plan was to try and use Linux's kernel-doc plugin for Sphinx, which
is very doxygen-like.=C2=A0 Did you experiment with this option?

~Andrew


