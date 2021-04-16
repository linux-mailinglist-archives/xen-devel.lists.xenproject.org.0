Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA691362176
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 15:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111763.213749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXOt9-0003Xm-4S; Fri, 16 Apr 2021 13:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111763.213749; Fri, 16 Apr 2021 13:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXOt9-0003XN-19; Fri, 16 Apr 2021 13:52:03 +0000
Received: by outflank-mailman (input) for mailman id 111763;
 Fri, 16 Apr 2021 13:52:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kml=JN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lXOt7-0003XI-TE
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 13:52:01 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23b2ea9d-f621-48dc-a7fd-b08feca78864;
 Fri, 16 Apr 2021 13:52:00 +0000 (UTC)
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
X-Inumbo-ID: 23b2ea9d-f621-48dc-a7fd-b08feca78864
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618581120;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=aeohhhKKAm6meSXtE59Iz6vTz0lHGCF2S1wRzPflROM=;
  b=U+GXx6HitB3BRzBlmM7MGjUS2L3rpqcxZdyGFrrUQD5BWK55XI/3nDnj
   c/oCN3jydNcTs9jOvoDPFaQyaEf79o0KfghGYJDx557tb7IyTNoxWQbD0
   BpgdBWwAcV7E1A/jiSSUQ9/j8SPJZYWjz5LULACJbnaTaikcVluSTq8wr
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vcUSk5pFwH9+ajPhtSmr8CticifXUW8WoylxarKijn3CnJfZc86dIW9stfhGxoGtnq7V/Ym7sR
 m/pjAYOAuSaELQWiu6mwlBVfK73CUmLOQ25GYsH3pU1V2PAMlz8v+/IvOaN9KE9Ujr3UflX5HH
 6xWJEIiaLrMFeokZ+nwu39Es4dihJ5f5HEfa+BVxTIgrtIk69wdhbwEul79CiSEJQXi8armeu4
 KXkOrVaQtCBLoGyUd4xeOMDwaolUGibDzGk6t+9SxK2UEhBXOPOobu+4XbNAtXUZwgC2t6u+yR
 qTw=
X-SBRS: 5.2
X-MesageID: 41763928
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mRhZkqBwkw/UvBrlHekQ55DYdL4zR+YMi2QD/UZ3VBBTb4ikh9
 mj9c516TbYgCscMUtBpfmuI6+FKEmxybdU5s0rMa6mTE3avgKTXeRfxK/v2SfpFSG71uM179
 YFT4FbCNn9SWd3ltz75g7QKbgd6eKK+qypmuvSpk0FJWpXQppt4AtjBgGQHlcefngkObMCCJ
 Ge6sBbzgDARV0raK2Adxs4dtmGjfniuNbPZhYCFwQm8mC15w+A2frRNzC1mjsYTD9Lx64vmF
 K19TDR1+GGu/G/xgS07R61071m3OHM4Od5KPahsfc4EXHFoCyUDb4NZ4G/
X-IronPort-AV: E=Sophos;i="5.82,226,1613451600"; 
   d="scan'208";a="41763928"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXeMmXYQ93pYD8A/vy8k5x6xn9DmKAbd5pKyHoZBzlnXaFntLDSR8OIB1B15F/hbE6IzRA8gnDSSnojaQdznIOC+O1D0CTaSPVH+uUkPozTq9kXVnXAovqDA9gfQFXuVp/8rWc8vxuQo5KKVXaCXpMqxgXLjSIGWtpOJHF4Kg58dClXFlyv3IBmvLWPc2OA6LWMWKBM2jGt9Lof80Hr5hXaDVW5O8wkfPxbUrAz7Ytv0R7PiPtfhMQeXTV7YiGxsRZDDfo4P74L31q+U9Q5WfIfROsBL79zMOw6Zt3bprAeVaDeB4BZSc7ZJGCg2ErDTuPRjZZyIU2Cpkma/yzLLHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeohhhKKAm6meSXtE59Iz6vTz0lHGCF2S1wRzPflROM=;
 b=fY6Tw5zHNsKavdkrT3w2QngpcjJtKKpLoVFojy0moBmVoUdT6iCpsdoKQjz6aRW/C4CIlgsjSxXI2ZRkKowJItlMYqxBuOXIMQuznfVh/JXlCqfWn9oJC8fvs0utEHnO3oGQlq6qczdmD5LgS3u7tdDxvDjk05cWs6rNmhmnE+8jZ5OtioNCojkk4JeNMWNckvZbcyHBhnBPgbxjoZW85dN9jk7dfNs/W2t60FGG+ZXqL7bhKEgVYwLwygynIBzdepQ0UArXC49tnr8A5Ib6oHOqrg0bftA75MDBlmGOr7ZzDJHSbXoJZBL3qxoS5ZaqgWEDjmEckhEI6GL3KYDNdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeohhhKKAm6meSXtE59Iz6vTz0lHGCF2S1wRzPflROM=;
 b=WQC7NsDQlwI1fc8dH6ehturjib/0WAvIrLyreiFDMXGFOHE1OvLuQhCJq7jU+HkXjLoQX4IbTPcgGUCZetZe1eCMnhbkc9r6xoMY/yPqj1SEoDIrtkscLhH0vbv1UItXp9ZG4/M2vRBQaFi1bO05sAsvkm2oaXYE/a4KM4wjsig=
Subject: Re: [PATCH] x86/pv: Rename hypercall_table_t to pv_hypercall_table_t
To: <xen-devel@lists.xenproject.org>
References: <20210415132138.29007-1-andrew.cooper3@citrix.com>
 <d553a6f2-157c-a4ab-02ef-fdd1ad6b9638@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <84a1b313-2d9e-a4de-4819-82e9e4657302@citrix.com>
Date: Fri, 16 Apr 2021 14:51:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d553a6f2-157c-a4ab-02ef-fdd1ad6b9638@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0500.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8522ca41-e449-420d-3820-08d900decd13
X-MS-TrafficTypeDiagnostic: BYAPR03MB3991:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3991A46E68BF0F36400EAE59BA4C9@BYAPR03MB3991.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PhBIlIpUVifTgBdcUknqo/O960pJ0BNuOEtoELeX0W0ChR5t/zxQKXJB9PtAeOH+5Tf1ssFJVz6SW5gmHGF3CsDws0pJnnlRPX9F+yIp2ABjwKBvOre3K9ruMzK89s39d/ocPDRUrxjbhQ1exVto8RECc/k69/eTcI81Ya4Ka8tjsqRAkS2JaU65NzJkVazSiTkm5IL6TmSwtM0Do6vgmxkMfH8HZlwq9dkaxTyTSf1vv+A2PhW3U1u6WW+/I51tYZyyVlXpGF9ohXknZ1axfNZljc+JZp9QP+ZPxuCFxyGN3t41wZ7DPTYPR+O96I5X5GfiNvGUhPjKWOmQ3+XUVllROfIjsW0eERntWdrWerUn3ILvPIGThvAq4ekCep2fOIs2fNW8cC8nqjSe9q4xqcBp4ErygYeWx+fnU+Q6TQCDuc2DPzGT1FCYQ7AqNTWvOloXdoEw7Mk80FXHSb94AQGIUjIhBfDihQhOXfRkNReNB6jLHLlBytuBwazW0ZCMnzrtTHMWJxAQwxGKn2aaSxnu1Sfo4oogY3fsSa688GEZRiJtmskhn+cU1RM68ZZf5dgWYj/1NBcTcKBH/dugYKK0xJjH/lb+1vpuejb5nFYEwSQdU2G4QDQplX+tblo67VnICI60lsr2HNlvn5/yh535lq9SwQ7s+larmnDKYD39a19CIQdCJRL4eH9k/3j6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(31686004)(2906002)(6486002)(38100700002)(16576012)(8936002)(956004)(2616005)(66476007)(6666004)(66946007)(316002)(86362001)(83380400001)(5660300002)(26005)(16526019)(8676002)(186003)(478600001)(53546011)(31696002)(6916009)(36756003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?anV0d29KVmw2b3JQQmJDenYwSEVoV0o3TlBxZk5VZVU3NmxyWnpNMUE2dEFv?=
 =?utf-8?B?Nlg0SzZhVFllSXRVM3oxLzF5aUpSTDBzb1dtWms4bzhUbkk5dEg5RUhmT3ht?=
 =?utf-8?B?ZkhZUzVBY0dOcHlab2xXMzJGMHdqUWlWazFvRGxmbmVBUCtkMVNMTXQ2d0w0?=
 =?utf-8?B?Z3VidHpKa1F2M0l1YmJ1eHpkWnJpNUE3TzRkWmRoTWpoLzZ0WUZYblB3VWw4?=
 =?utf-8?B?RTBacUYzcCtlQ0xFSmxISGw2REdUUkxheWg3ejd2SmhGUTJld3F1MmlUdWRz?=
 =?utf-8?B?RUsrb0Y2WWltZDk5aS84MG9kQ3U3QnFUdXBXcXlORk0zemp4alQ4a1ViZkNY?=
 =?utf-8?B?SUFaMlRwOUtBSkRkM2pYTnJGbW1EVmhNR1BScnVJTWxCZlNrNFZxamljUFJw?=
 =?utf-8?B?YjBEUDBmZG1mdWIrcjh1R2dVODZkdlpaRXNkdko4THVEMWRJelY0ZGhpQlhm?=
 =?utf-8?B?WlQrSFJNVWszQVpGMitjbzZWMUw3dFVmdG85UW5OZm04S1FtblU0YTdtR2wy?=
 =?utf-8?B?MFNrVWJhenU1K2cyTFI5R0c2a0VNNGFjZWJuWWpJbURuSkRiMU9mRzE3WFFC?=
 =?utf-8?B?ajdrQ1RHT2RmLzVWUHRSc3NRYXVYN2FrRkpRMWhoajRqdzk2Z2x6MWxFYzlH?=
 =?utf-8?B?VmpUaXREd09LaTlrMHh3SHdJMW1EZlFVa29kMlFhWWNtSExwRWVsc2txRWVU?=
 =?utf-8?B?OG9YSVNTUi9tdGhPSklWZnY5VHltK2NkZFB2ZCsxSGVSdkx3T1cvWXJnenhQ?=
 =?utf-8?B?UEV4M3N3SnVUWS9VVE9jNEFjMjJTeEI0MXBQcFRUYnZnamRtR2JYMWh1QkZ5?=
 =?utf-8?B?aEh6Y3lFT2NDV21LSW45OVVjNllZVm9SMVloMkxQdElYMytkdkMyZk9sMFhD?=
 =?utf-8?B?SUtUTFNvWm1DYWdkZnpvRnFaemJKa2wzNVNaUElacW52YWpqVkZzV0FpOGhS?=
 =?utf-8?B?WkVZdExqU3FvK2Q3TzJibHhRRHNVVWJ3NVJsT3V6VStIb0U0N2ViQjl4SUZV?=
 =?utf-8?B?Q3d2eDJidUJReUtrZHROcTJuUzgrYmEwRG5CZitlKzlRRzVyUFcrbEhSRXBO?=
 =?utf-8?B?RmJsYXZMUE1CSnUxaHJZYzMrUU12bU45STZGTngyZFAyT3B4ZVpDRUxIZVQ0?=
 =?utf-8?B?czFTcHdxL0dKdjZ5eWJQdkJpTEtmVDR5elVzVCtvUnpmdXZlMkwxQmR0aXV6?=
 =?utf-8?B?WUZNZ1BpMktCZnVTV1ZRNUh4RUFNZXBCRXJpRVBBWDlhR25GdUxBQzJFbGJL?=
 =?utf-8?B?bWF0N0tzaVBFTi9IL0xEdzRsaXVwZXpNb1pqZlNLYUNva1BwaERpR2daalhl?=
 =?utf-8?B?N04xNWNITS9SSVVnSTdLZkdaTDBMeUlnWldweHd4eEJFNEZ1T0x1Zld1ZGJ1?=
 =?utf-8?B?M3lkTndPaDBQUlFzT2k3M0NtbEVkczFNRzVwVTVhUVhwbXlMZkFud0I3RkhK?=
 =?utf-8?B?OTN3UjNjdnNsQW5OK3A4cmxKSHlxRHlva1FsWWNrT2czbnJFbFgzWnFQd2VL?=
 =?utf-8?B?QkdiNXk3cTFxUUZVRDVoMzJsU2wxakwwSklwNzF2c3BrM3pIcW9ETS83VDBq?=
 =?utf-8?B?SjZBTk1NUFlreGdBQTRMTGlRSGVpMXBJM3JvYkEyQ2JiTWk2STV4YlNIM1V6?=
 =?utf-8?B?MDFvVzFIM0pjbUVZYmRwLzhoM0hJemxHRXViM0JydGd4WnVrKzhiZkhweHND?=
 =?utf-8?B?SHFuOHhtZW9qc0tHK1ZsVTRKdG9uZys0NUYzNXVBMGNDd3N0N3htZjI5RzhR?=
 =?utf-8?Q?SZ7QpaFSSl+CTEKtBQrd1aqzqatiyRgnDRVB9IE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8522ca41-e449-420d-3820-08d900decd13
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 13:51:57.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGGouUWzhen3xiIf+Ia4wQunTDA1iBwG523bprPImmw0yM0fdq1uwE5FrnWPpHun3z2IySHOiGoThzheggUIk9A3qjsIdzezzDn84z+gkrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3991
X-OriginatorOrg: citrix.com

On 15/04/2021 15:04, Jan Beulich wrote:
> On 15.04.2021 15:21, Andrew Cooper wrote:
>> The type is no longer appropriate for anything other than PV, and therefore
>> should not retain its generic name.
>>
>> Fixes: 527922008bc ("x86: slim down hypercall handling when !PV32")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I'm not convinced this warrants a Fixes: tag (afaict there's no breakage),
> but in any event
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> I had considered doing the rename at the same time, but then decided to
> save on the extra code churn. I'm sorry if this was the wrong choice.

I would have requested the change on code review.  Not necessarily part
of that patch, if it were easier to split out into an adjacent change,
but the patch did fundamentally change the purpose of the type.

Part of me still wonders whether it would be better to drop the type
entirely, as on the HVM side.  However, whichever way you rewrite this,
you've always got an ugly plumbing problem with the pvshim alterations.

~Andrew

