Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A087B365AE6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113779.216856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4p-00024U-9Q; Tue, 20 Apr 2021 14:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113779.216856; Tue, 20 Apr 2021 14:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4p-00023V-1m; Tue, 20 Apr 2021 14:10:07 +0000
Received: by outflank-mailman (input) for mailman id 113779;
 Tue, 20 Apr 2021 14:10:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr4n-0001lG-2b
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:10:05 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90bd426b-64ac-423a-b518-259ed8123f39;
 Tue, 20 Apr 2021 14:10:03 +0000 (UTC)
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
X-Inumbo-ID: 90bd426b-64ac-423a-b518-259ed8123f39
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=EawpHgaCPssKy0w03Zn3vt1Po3SOLbn8R3gB+qDePj0=;
  b=UTaIBj+dJjxLFd8eUtvLtlec3RqQVOIRyUFy/dIYF+jgQvgjR5HPwCMe
   9lZHC9MkvnmpQI7m8ufPedLjhHrDGg0qgBqi2SwkC3aPBdDZHGi07Qe8O
   2LFJuc22UihR8u7UOeMrn+lmbBvQqbolHoxZwyqvtEbuREGpQQgGEd6dr
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XOe7fnT/5ubb+lD/7lVLeXqTOp8nPSdy0sXX8INu0wjghZKVflCXppAuSAmdK1O3bjuT8Nw0LB
 u82cNySaWZL35V6TdxA942yXs3NPGBrvslKzs0Syw0JscaP64ERKvO79BFMlpPlxulFEk1l5N7
 UpchroWs+AbTEgMvmcfnIFaIr/NaPCQFgYwf1OizZ+b8TkAmdWCf0QvqvNhWS1cHTFizgB0rbv
 OCUPWnogOFNJXLIQRUara5A0JRTU4H9dsrwqWsQsAbUOu2g4jQXhc1W+XAT0vnLGsSCQjVpYH4
 IYA=
X-SBRS: 5.2
X-MesageID: 42368720
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6JPnbq5p3dhQW7a7ewPXwU2EI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbjqzOEtwWQVAGN4FD5
 Ka/MVKvH6Nfn4QY8S9CBA+LpT+jvfMk4/rZgNDOg4/5GC1/E6VwZPZMzzd5BcRVDtT3awvmF
 KqryXV7riu2svLrCP0+HTU6/1t6bnc4/tFQPeBk80Ebgjr4zzYH7hJf52nkHQLrPq06FAs+e
 O80ysIG8ho8XveciWUjHLWqnDd+Q0j4XPj1lOU6EGLyaeSJENYerh8rLlUfRfD500rsMsU6t
 Mw40uju4dKFhSFpSzh5rHzJmBXv3Cpqnkvm/N7tQ05baIibtZq3Oki1XIQOpIBECXm0ZsgAe
 ljAerNjcwmD2+yXjT3uHJiz8erWWl2NhCaQlIassjQ6DROmmtlpnFoiPA3rzMlztYQWpNE7+
 PLPuBBk6xPdNYfaeZYCP0aScW6J2TRSXv3QS2vCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtEYpEnieSfGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uqc29uP8Sa/erGs
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5IVQFSLjsXXKpD7l+DSffrJTYCdUwoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwje8PtLYe3n1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7BLvml6i8tFSn5Gqg1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmFyKOwF4VMGTNA
 JEvVx49eaWIvWrtG4fIuPiFljfo2oYpXqMQZtZsLaE/93ZdpQxCYtjfrdwGwXNHxlcgh1rt2
 9HVQ8BSibkZ3DToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqemEWRAe0UcmcgR8nQh1dgl
 EZyd5ZvJOw3RKUbUcviuUxN1NBLECaGqhPAgi+aIJIobzzYw1rQWCWhTuVtgErdgPRhjYvr1
 2kCRfRVeDAA1JbtHwd6Krs/V9uXki2fk57aBlBwMZAPFWDnkw2/f6AZ6K13WfUV0ALxfsFNi
 rZJREIJBl1+tyx3BmJuTqLGHk83K8yNujFALlLScCU5lqdbKmz0Y0WFf5d+5hocO30uugQSO
 SFZku7Kij7B+5B4X3iml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NAgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso6I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfCvA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu+lZMfRmmIpA79Ij
 CkglVg1saAeyuIzrgBDa0sZUxQdUgn8XxnldnyPbH4OUGPd+tZ+kC9PWL4WLhBSLKdEbFVih
 ph+dmHk6u2cCX/sTqg8AdTE+Zr82y9R9m1Dx/JMelU88aiMVDJu5CU2qeI/X7KYAr+TV8Zi4
 1DfVERacoGqgBKtvxJ7gGCDortokwklFNC5ypAjVCF4Pn+3Fvm
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="42368720"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwMWEJR/YE+3blOd47hlIhfmIPlZpXJ5H2c2BwwA4FlWQTskJIF5KGgiFBXrazoWUZ+Mpg+3rAFo9LSCZew+tK4Rx525mzjMtMn8ZTByTk5QIrMBoyBWprEscBb3hK2gFBMIaqKQiyfuvVq4hOIVE2Y8xg43RFP/OOtrzz64Ub/CP4m6E9zdS0A1TFRlBQZwQ1wgVItWHAkEJotwIi36xNSQjBKnfEGmFUqYtt+gajLTmHaT7h9OBbU/9RKd7xfVDArY1W4EEpY3h4qFVZwJSCZ+nojrApjJyduxVu1SGIRXaAbtCZRSkWUxTJWUgOR6j2xkZFPnIvol5DkUdzxiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpczQuO47SkhWWpbzazODSpFWqenkbs2N4Y7huesY2k=;
 b=YrPtwHcnZZi3xe/GGmkFOE4HqBUWbGGlQ+Gb+ImyX+t9+k5lPwpP8+XlsGV4VWtyTsStwEbyt7vOz9EfaM6i+sE+UEpjGc0Xq89BEYwb2JSBfyZhIkOn6/a9ivuaHtyMpQtM0cqYZM8MgN8IAW4XuP86MqkfwPtEvgA9TWnTW1x5/MUoVA9TaMOI690rUikSR7dj1i1Cfs4Yp17Zc3lqOksuDQVCTXYBdDclvRYSoafuv3DKBiIfxmhZdWVgUu4v2DzNjtsXVIq+K3jCxK6J3FUpKA08wlBSEB1nUj+u40ih0UlRpJETilpQ4ViOx/GxvPl2GtQ9dAqRMV7PLymWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpczQuO47SkhWWpbzazODSpFWqenkbs2N4Y7huesY2k=;
 b=YA/riF+sNtVKRT/Yz4IZjIxeKWlRDsACPRSDCmaSiMuiha1OH+7tV1Q73LkjYY2RbabqtNibvhoKtWMMppDkyOF3zQX/AVjTJ6xZTCo7M/FXodoAGvjZaT+WacQp+B4sOlPNKPVK6d3qPRExF6i/bCoHGMxgMhRVu9D/oWEUHrA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 11/12] x86/vpt: remove vPT timers per-vCPU lists
Date: Tue, 20 Apr 2021 16:07:22 +0200
Message-ID: <20210420140723.65321-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0177.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::16)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e8d0619-2564-4581-8b16-08d90405fbae
X-MS-TrafficTypeDiagnostic: DM5PR03MB3068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3068BC27730C36A54470A51F8F489@DM5PR03MB3068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ot903jG5ohElQrZBEWVAxJj1c9HSJ3w1/sHAADpXPis0O5bnR4cWah9w1MuGRJzzITEMEvIPSg4H05VqniJLtQSrAEsT3bp/ggbe7x86oRZr6SJeg+sQnMshLp+Gq16tohFgYizczOpyRRitCatN/13MW4eikCfNvbTX4pglwYA1t4IaLMg9EYAfyuSBSx2T7HcU/06uuyRBoZrWuCVYjsRd7OeyJkq3xBz9fAaEQ0l5Ic2DRe2n4//CQuAyPSAZvIe6MgyMnMC7oKL9g4DlpOiHphejarCsGXMeIat3S6Gpims2HGnKLKQzCFgtSCNDTQtlMI+RaOuMk2VCGmjgsvn+z+lHQliUYn5Fk2PWsvEcifPEEgBEvx0InYBogbkrBWXnnSAhenbB3XneSDQoMx1mOBZTsfx01U7d92emPPvSuUo5Xb9V8XtHxddwff8OCmW9PsWaB/QVWf3CjYcvgByblBiHjrTh3OUuXg+H2A0VheuUpasIUG1V/IUWIrW7UrHQSW+hZ7ZrpB6fTEW3slL2MqNo9GtyvcpQHqJ8tQ14XiafCJDGBT5SZ3SBjSPLdqOaXP3IDrspIreU0XUJvW32xgUgRUPYC7X3Ha2wp1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(54906003)(316002)(2906002)(6486002)(30864003)(956004)(1076003)(38100700002)(36756003)(2616005)(16526019)(5660300002)(6496006)(83380400001)(4326008)(8676002)(26005)(66556008)(66946007)(66476007)(186003)(8936002)(86362001)(6666004)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MStEdzRJcUkxWG9acWJvTXF2Wlc4aHo1OCtGdFA3d3prUVBReVRHSXBFby81?=
 =?utf-8?B?dG5PeXpTTjk0TFBUcTQyWlI2Si8xMys4WWVMS0lqd1BLeVQza3l1dmlxT1g1?=
 =?utf-8?B?V01RU1lOS010eTl5c3g4Z1VsU2dMVSszOUNZcDBtbEVXT3pMR2pJZ1NmRm9K?=
 =?utf-8?B?TW1IaGMveDFoVUlHOEsvZEFIdGZmWkN6NzZDc1JHakhDZU5HRFI0V3JDejlq?=
 =?utf-8?B?dWpuWi8vaEhtZndiWXlCMU1YcW9hN09EMk1TQ2NMQ0ZKVGVaTW1lallmV2t6?=
 =?utf-8?B?Kzg5T3d4TWZlUGh6eGNUdENhRUVmeUg3MHZtVE1ZeUdxZ24zei9QQldaTGFU?=
 =?utf-8?B?S2ZpeVRqTnVtYnhFSnNNanh2Wlk4cHd1aFVhUHNJSlZsbUVMZUlpZ09yQ0c3?=
 =?utf-8?B?b1pWVW5JSWZSdmtYQ0t2dlRjV3RpSlBvQXFkOFBva3NlWFJtN0tyckdENkxp?=
 =?utf-8?B?YnJxaVNWaUxPVjVkeEM4d213RXJDbjNKazdNbjdhU0o4d0dHWHIyTFZJVUpI?=
 =?utf-8?B?cnk4WHR3b3hxeCtISVhUODcwWXl2UlJUcm4xVGkrUnlUTjFoNmVidTFxMWwx?=
 =?utf-8?B?Q0U5NzJqbzc1RmtmRVgzcWlNZTlNcnNMZzNvRUpzbWdsZ3RNNTZPbTFLSkt6?=
 =?utf-8?B?SU9UTThNUjdhWXJyZEhhQlk5RVlNTTZDaW5UN3NKK0xTaWJHR2tuZG1xM0J2?=
 =?utf-8?B?ZmJnSnNQZFhvS1Z2d012aVo2NXpRaGlPZHUycVRsOUpWRStNR2ZPdHl1MlEx?=
 =?utf-8?B?NksxK1haR1FqTlBpdVltVmROUDVSWVN1Slo4RmpNcDAxaEVwQ0g1UFMvVTJ5?=
 =?utf-8?B?L2NxejNmdmNYR0E0M3JhWFVlRFdxaDZER3BBUHh6aGE5bzVFS3hPWWg3Y1NV?=
 =?utf-8?B?QjErRmFlWko0ZkZqc1U5V21SNVpHemsyWFQxdlZ0aUpTRWxXQzdDT0RWcnUz?=
 =?utf-8?B?aGZJakdBSkJvcUliM0pJN0hFUEVkNGRGZWNMeFlYMXB0bGtQeTBjdm4xUkJy?=
 =?utf-8?B?bjZGNndkaStVWS9Ybk4yclNLL1ZDbjNJa05Mc21CTmtjVTB2SjloNi94VU9C?=
 =?utf-8?B?RG9IQ0VCdlU5RkR5T2JwR1hSdmprK2dkSDk2NEljU3hjYVFzNDUyOWY1cTQ0?=
 =?utf-8?B?Y0RNeGZaUFFxUSsxQmZLRXVUVlozMkdvcTJ3WVJsN3Q2MHZOa05IMjNnMHBT?=
 =?utf-8?B?dDZEeGVXWHptY2dxdFVYUlFxOXRMckJzSnlzc1g1QjhDYUZwekxZaDBHWGdV?=
 =?utf-8?B?Qk1DQ3lycHBMRVhqWEdLZjdaK0MxcHllWWVhV0I2LzJRY2JFaS9rYlZEeGwx?=
 =?utf-8?B?bWJ2QVpwcU03TmRObU1PY2dhajd3VUVIRXExUW1lODNvRU9BSGdWcDFJR0FO?=
 =?utf-8?B?V2FObzlXNDlHTXBXN0E1OFU5eTZVVGpNYkNtTmdwNHk0UW01aGp6L2tzOGx4?=
 =?utf-8?B?dTZlWlRnMkhma1h3T3JXWU5CN2RKd05ObGQzck5zOUFaQlRTK2t6L1dzWEl6?=
 =?utf-8?B?OFpDeVZhYlJHdXZKSjM3dGU0M1NPc0xKR0FpejRoWVI1Vi9uMDlSS3JhUVRz?=
 =?utf-8?B?SEJRZVpWMXY5Vi8ybHJRc2NiZ3o3djNkVUs2NkJMdTlMSWtMSnhVamYyN2Y1?=
 =?utf-8?B?N0FneWZBYitHaWdkL1pUZ0M2OHdHbjdSYmVCV2UxRWJXQlpqQU9xQmVvQ3ho?=
 =?utf-8?B?NkV4SDJ6RVQwQzMyMEV6V1k3NWhPaUkwWEM4Ty9DUnJEbmFtYkFSN2oraXl0?=
 =?utf-8?Q?PJf8LWTRDSYbnC/lzrt4kOQRtnN/1MC4UJW6x0B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8d0619-2564-4581-8b16-08d90405fbae
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:09:59.4807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VlPeKNLGt6z5IN3PjjXlqE71FQFDsAomWRlaVsOeK2UZZ3dAfc26CaT5LG6TJGEH9XRExjsAQ8eDzT2zO9rDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3068
X-OriginatorOrg: citrix.com

No longer add vPT timers to lists on specific vCPUs, since there's no
need anymore to check if timer interrupts have been injected on return
to HVM guest.

Such change allows to get rid of virtual timers vCPU migration, and
also cleanup some of the virtual timers fields that are no longer
required.

The model is also slightly different now in that timers are not
stopped when a vCPU is de-scheduled. Such timers will continue
running, and when triggered the function will try to inject the
corresponding interrupt to the guest (which might be different than
the currently running one). Note that the timer triggering when the
guest is no longer running can only happen once, as the timer callback
will not reset the interrupt to fire again. Such resetting if required
will be done by the EOI callback.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Remove stale commit log paragrpah.

Changes since v2:
 - Remove pt_{save/restore}_timer and instead use
   pt_{freeze/thaw}_time.
 - Remove the introduction of the 'masked' field, it's not needed.
 - Rework pt_active to use timer_is_active.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/domain.c          |   4 +-
 xen/arch/x86/hvm/hvm.c         |   4 +-
 xen/arch/x86/hvm/vlapic.c      |   1 -
 xen/arch/x86/hvm/vpt.c         | 192 ++++-----------------------------
 xen/include/asm-x86/hvm/vcpu.h |   3 +-
 xen/include/asm-x86/hvm/vpt.h  |  12 +--
 6 files changed, 25 insertions(+), 191 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 4dc27f798e7..b6cd715dce9 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2039,8 +2039,8 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
     vpmu_switch_from(prev);
     np2m_schedule(NP2M_SCHEDLE_OUT);
 
-    if ( is_hvm_domain(prevd) && !list_empty(&prev->arch.hvm.tm_list) )
-        pt_save_timer(prev);
+    if ( is_hvm_domain(prevd) )
+        pt_freeze_time(prev);
 
     local_irq_disable();
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2c4dd1b86f2..ec4ab1f5199 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -489,7 +489,6 @@ void hvm_set_info_guest(struct vcpu *v)
 void hvm_migrate_timers(struct vcpu *v)
 {
     rtc_migrate_timers(v);
-    pt_migrate(v);
 }
 
 void hvm_migrate_pirq(struct hvm_pirq_dpci *pirq_dpci, const struct vcpu *v)
@@ -544,7 +543,7 @@ void hvm_do_resume(struct vcpu *v)
 {
     check_wakeup_from_wait();
 
-    pt_restore_timer(v);
+    pt_thaw_time(v);
 
     if ( !vcpu_ioreq_handle_completion(v) )
         return;
@@ -1559,7 +1558,6 @@ int hvm_vcpu_initialise(struct vcpu *v)
     hvm_asid_flush_vcpu(v);
 
     spin_lock_init(&v->arch.hvm.tm_lock);
-    INIT_LIST_HEAD(&v->arch.hvm.tm_list);
 
     rc = hvm_vcpu_cacheattr_init(v); /* teardown: vcpu_cacheattr_destroy */
     if ( rc != 0 )
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 8f3a0a2e8f7..2af24989dd5 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1342,7 +1342,6 @@ void vlapic_adjust_i8259_target(struct domain *d)
     if ( d->arch.hvm.i8259_target == v )
         return;
     d->arch.hvm.i8259_target = v;
-    pt_adjust_global_vcpu_target(v);
 }
 
 int vlapic_has_pending_irq(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 639e45c520e..6a8d216c7b5 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -125,24 +125,6 @@ static int pt_irq_masked(struct periodic_time *pt)
     return 1;
 }
 
-/*
- * Functions which read (maybe write) all periodic_time instances
- * attached to a particular vCPU use pt_vcpu_{un}lock locking helpers.
- *
- * Such users are explicitly forbidden from changing the value of the
- * pt->vcpu field, because another thread holding the pt_migrate lock
- * may already be spinning waiting for your vcpu lock.
- */
-static void pt_vcpu_lock(struct vcpu *v)
-{
-    spin_lock(&v->arch.hvm.tm_lock);
-}
-
-static void pt_vcpu_unlock(struct vcpu *v)
-{
-    spin_unlock(&v->arch.hvm.tm_lock);
-}
-
 /*
  * Functions which want to modify a particular periodic_time object
  * use pt_{un}lock locking helpers.
@@ -176,14 +158,12 @@ static void pt_process_missed_ticks(struct periodic_time *pt)
         return;
 
     missed_ticks = missed_ticks / (s_time_t) pt->period + 1;
-    if ( mode_is(pt->vcpu->domain, no_missed_ticks_pending) )
-        pt->do_not_freeze = !pt->pending_intr_nr;
-    else
+    if ( !mode_is(pt->vcpu->domain, no_missed_ticks_pending) )
         pt->pending_intr_nr += missed_ticks;
     pt->scheduled += missed_ticks * pt->period;
 }
 
-static void pt_freeze_time(struct vcpu *v)
+void pt_freeze_time(struct vcpu *v)
 {
     if ( !mode_is(v->domain, delay_for_missed_ticks) )
         return;
@@ -191,7 +171,7 @@ static void pt_freeze_time(struct vcpu *v)
     v->arch.hvm.guest_time = hvm_get_guest_time(v);
 }
 
-static void pt_thaw_time(struct vcpu *v)
+void pt_thaw_time(struct vcpu *v)
 {
     if ( !mode_is(v->domain, delay_for_missed_ticks) )
         return;
@@ -203,52 +183,11 @@ static void pt_thaw_time(struct vcpu *v)
     v->arch.hvm.guest_time = 0;
 }
 
-void pt_save_timer(struct vcpu *v)
-{
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    if ( v->pause_flags & VPF_blocked )
-        return;
-
-    pt_vcpu_lock(v);
-
-    list_for_each_entry ( pt, head, list )
-        if ( !pt->do_not_freeze )
-            stop_timer(&pt->timer);
-
-    pt_freeze_time(v);
-
-    pt_vcpu_unlock(v);
-}
-
-void pt_restore_timer(struct vcpu *v)
-{
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    pt_vcpu_lock(v);
-
-    list_for_each_entry ( pt, head, list )
-        if ( pt->pending_intr_nr == 0 )
-            set_timer(&pt->timer, pt->scheduled);
-
-    pt_thaw_time(v);
-
-    pt_vcpu_unlock(v);
-}
-
 static void irq_eoi(struct periodic_time *pt)
 {
-    pt->irq_issued = false;
-
     if ( pt->one_shot )
     {
-        if ( pt->on_list )
-            list_del(&pt->list);
-        pt->on_list = false;
         pt->pending_intr_nr = 0;
-
         return;
     }
 
@@ -266,7 +205,11 @@ static void irq_eoi(struct periodic_time *pt)
     }
 
     if ( !pt->pending_intr_nr )
+    {
+        /* Make sure timer follows vCPU. */
+        migrate_timer(&pt->timer, current->processor);
         set_timer(&pt->timer, pt->scheduled);
+    }
 }
 
 static void pt_timer_fn(void *data)
@@ -282,21 +225,15 @@ static void pt_timer_fn(void *data)
     v = pt->vcpu;
     irq = pt->irq;
 
-    if ( inject_interrupt(pt) )
+    pt->scheduled += pt->period;
+
+    if ( !inject_interrupt(pt) )
+        pt->pending_intr_nr++;
+    else
     {
-        pt->scheduled += pt->period;
-        pt->do_not_freeze = 0;
         cb = pt->cb;
         cb_priv = pt->priv;
     }
-    else
-    {
-        /* Masked. */
-        if ( pt->on_list )
-            list_del(&pt->list);
-        pt->on_list = false;
-        pt->pending_intr_nr++;
-    }
 
     pt_unlock(pt);
 
@@ -313,22 +250,12 @@ static void eoi_callback(struct periodic_time *pt)
     pt_lock(pt);
 
     irq_eoi(pt);
-    if ( pt->pending_intr_nr )
+    if ( pt->pending_intr_nr && inject_interrupt(pt) )
     {
-        if ( inject_interrupt(pt) )
-        {
-            pt->pending_intr_nr--;
-            cb = pt->cb;
-            cb_priv = pt->priv;
-            v = pt->vcpu;
-        }
-        else
-        {
-            /* Masked. */
-            if ( pt->on_list )
-                list_del(&pt->list);
-            pt->on_list = false;
-        }
+        pt->pending_intr_nr--;
+        cb = pt->cb;
+        cb_priv = pt->priv;
+        v = pt->vcpu;
     }
 
     pt_unlock(pt);
@@ -397,19 +324,6 @@ static bool inject_interrupt(struct periodic_time *pt)
     return true;
 }
 
-void pt_migrate(struct vcpu *v)
-{
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    pt_vcpu_lock(v);
-
-    list_for_each_entry ( pt, head, list )
-        migrate_timer(&pt->timer, v->processor);
-
-    pt_vcpu_unlock(v);
-}
-
 void create_periodic_time(
     struct vcpu *v, struct periodic_time *pt, uint64_t delta,
     uint64_t period, uint8_t irq, time_cb *cb, void *data, bool level)
@@ -429,8 +343,6 @@ void create_periodic_time(
     write_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
 
     pt->pending_intr_nr = 0;
-    pt->do_not_freeze = 0;
-    pt->irq_issued = 0;
 
     /* Periodic timer must be at least 0.1ms. */
     if ( (period < 100000) && period )
@@ -488,11 +400,6 @@ void create_periodic_time(
         break;
     }
 
-    pt_vcpu_lock(v);
-    pt->on_list = 1;
-    list_add(&pt->list, &v->arch.hvm.tm_list);
-    pt_vcpu_unlock(v);
-
     init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
     set_timer(&pt->timer, pt->scheduled);
 
@@ -508,9 +415,6 @@ void destroy_periodic_time(struct periodic_time *pt)
         return;
 
     pt_lock(pt);
-    if ( pt->on_list )
-        list_del(&pt->list);
-    pt->on_list = 0;
     pt->pending_intr_nr = 0;
 
     gsi = pt->irq;
@@ -532,64 +436,6 @@ void destroy_periodic_time(struct periodic_time *pt)
     kill_timer(&pt->timer);
 }
 
-static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
-{
-    ASSERT(pt->source == PTSRC_isa || pt->source == PTSRC_ioapic);
-
-    if ( pt->vcpu == NULL )
-        return;
-
-    write_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
-
-    if ( pt->vcpu == v )
-        goto out;
-
-    pt_vcpu_lock(pt->vcpu);
-    if ( pt->on_list )
-        list_del(&pt->list);
-    pt_vcpu_unlock(pt->vcpu);
-
-    pt->vcpu = v;
-
-    pt_vcpu_lock(v);
-    if ( pt->on_list )
-    {
-        list_add(&pt->list, &v->arch.hvm.tm_list);
-        migrate_timer(&pt->timer, v->processor);
-    }
-    pt_vcpu_unlock(v);
-
- out:
-    write_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
-}
-
-void pt_adjust_global_vcpu_target(struct vcpu *v)
-{
-    struct PITState *vpit;
-    struct pl_time *pl_time;
-    int i;
-
-    if ( !v || !has_vpit(v->domain) )
-        return;
-
-    vpit = &v->domain->arch.vpit;
-
-    spin_lock(&vpit->lock);
-    pt_adjust_vcpu(&vpit->pt0, v);
-    spin_unlock(&vpit->lock);
-
-    pl_time = v->domain->arch.hvm.pl_time;
-
-    spin_lock(&pl_time->vrtc.lock);
-    pt_adjust_vcpu(&pl_time->vrtc.pt, v);
-    spin_unlock(&pl_time->vrtc.lock);
-
-    write_lock(&pl_time->vhpet.lock);
-    for ( i = 0; i < HPET_TIMER_NUM; i++ )
-        pt_adjust_vcpu(&pl_time->vhpet.pt[i], v);
-    write_unlock(&pl_time->vhpet.lock);
-}
-
 static void pt_resume(struct periodic_time *pt)
 {
     struct vcpu *v;
@@ -600,14 +446,12 @@ static void pt_resume(struct periodic_time *pt)
         return;
 
     pt_lock(pt);
-    if ( pt->pending_intr_nr && !pt->on_list && inject_interrupt(pt) )
+    if ( pt->pending_intr_nr && inject_interrupt(pt) )
     {
         pt->pending_intr_nr--;
         cb = pt->cb;
         cb_priv = pt->priv;
         v = pt->vcpu;
-        pt->on_list = 1;
-        list_add(&pt->list, &pt->vcpu->arch.hvm.tm_list);
     }
     pt_unlock(pt);
 
diff --git a/xen/include/asm-x86/hvm/vcpu.h b/xen/include/asm-x86/hvm/vcpu.h
index 8adf4555c2a..9a756964fb0 100644
--- a/xen/include/asm-x86/hvm/vcpu.h
+++ b/xen/include/asm-x86/hvm/vcpu.h
@@ -148,9 +148,8 @@ struct hvm_vcpu {
     s64                 cache_tsc_offset;
     u64                 guest_time;
 
-    /* Lock and list for virtual platform timers. */
+    /* Lock for virtual platform timers. */
     spinlock_t          tm_lock;
-    struct list_head    tm_list;
 
     bool                flag_dr_dirty;
     bool                debug_state_latch;
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index 384d2e02039..323afa605e7 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -31,11 +31,7 @@
 typedef void time_cb(struct vcpu *v, void *opaque);
 
 struct periodic_time {
-    struct list_head list;
-    bool on_list;
     bool one_shot;
-    bool do_not_freeze;
-    bool irq_issued;
     bool warned_timeout_too_short;
     bool level;
 #define PTSRC_isa    1 /* ISA time source */
@@ -151,11 +147,9 @@ struct pl_time {    /* platform time */
     struct domain *domain;
 };
 
-void pt_save_timer(struct vcpu *v);
-void pt_restore_timer(struct vcpu *v);
-void pt_migrate(struct vcpu *v);
+void pt_freeze_time(struct vcpu *v);
+void pt_thaw_time(struct vcpu *v);
 
-void pt_adjust_global_vcpu_target(struct vcpu *v);
 #define pt_global_vcpu_target(d) \
     (is_hvm_domain(d) && (d)->arch.hvm.i8259_target ? \
      (d)->arch.hvm.i8259_target : \
@@ -164,7 +158,7 @@ void pt_adjust_global_vcpu_target(struct vcpu *v);
 void pt_may_unmask_irq(struct domain *d, struct periodic_time *vlapic_pt);
 
 /* Is given periodic timer active? */
-#define pt_active(pt) ((pt)->on_list || (pt)->pending_intr_nr)
+#define pt_active(pt) ((pt)->pending_intr_nr || timer_is_active(&(pt)->timer))
 
 /*
  * Create/destroy a periodic (or one-shot!) timer.
-- 
2.30.1


