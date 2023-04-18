Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F2E6E5E6E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 12:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522727.812275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poiP3-0003Yk-7n; Tue, 18 Apr 2023 10:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522727.812275; Tue, 18 Apr 2023 10:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poiP3-0003W7-53; Tue, 18 Apr 2023 10:17:37 +0000
Received: by outflank-mailman (input) for mailman id 522727;
 Tue, 18 Apr 2023 10:17:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTWx=AJ=citrix.com=prvs=4659928b3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poiP1-0003Vw-VU
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 10:17:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bbaee54-ddd2-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 12:17:34 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 06:17:26 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6075.namprd03.prod.outlook.com (2603:10b6:408:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 10:17:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 10:17:24 +0000
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
X-Inumbo-ID: 3bbaee54-ddd2-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681813054;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/pjCGsjSFflJwwCj7qG4e/Fx2p1aYOB73xPCXI/OSdQ=;
  b=gsiAW5WEBFfEXQqQoLvS9sdahTk/VbcgpP8xiKJe9VKApiak+7ZI/aFH
   xO9fniJmtD6NfWBFdq4vDWN6emLsja2P3LrVKZY0Qd73Vmp0/WTnWtCyN
   1B3Do/gqY/Eb2QsTyK4AnBhLso2DnBTNJ/9s6zCdP99e9ihSvpEVX+4QH
   U=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 108373692
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6BC5YKIUrNtmvfo0FE+R/JQlxSXFcZb7ZxGr2PjKsXjdYENS1mMOy
 jcXC2nUOq3cMTCke4wiO97joENQ75bcmtAyQAplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gVuPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5IWnxNq
 OADDQkzcwmsgO+7g7KxE+tF05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGNnGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHurA91JSuzinhJsqESe6UtCCBM9bgP45taGoW3kfOAcF
 UNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4J5oflqYRq1xbXFI89QOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:gXbU2a9gLxOrazxFv6Fuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: =?us-ascii?q?9a23=3Ay2ek/2o6zm9fihWTAL0BwWnmUf9+b36A0Gz1GnG?=
 =?us-ascii?q?lEEluRbDWSVXJ+ooxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AqqIgVw2qHDzeZPw3HY9a3ryFrDUj+qmBLxENn74?=
 =?us-ascii?q?944rDGhNbGG26vneJTdpy?=
X-IronPort-AV: E=Sophos;i="5.99,206,1677560400"; 
   d="scan'208";a="108373692"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6FtxsPcnBKX61nOMi7UFdaqcK6IBMluwHg72Ygoi6ptfAC5W7BLJd7h3pnzgK61fvq6iH/9XRpMu1DBZO9vMWnMTEr6WEza+vGRGwXZQbf+f0R3t7Td+Z/DLdibzhUkfce9pXox2SNMNbvlMZbP4y6ypIKEG0iJw6m3b4KcHHW1AJnvi8lfxJquES/aBgp9xtA9h5EnMdLH2iUucf2jglZdQAcRfwYvfbinWtqZDtlxm+TsPOHR+/ItB8a3lqyWb/rFAPCgo6Nqq0DxtnsYZBmrE9c0rb5E7lhc8kQBytReSG2qsOxqIsyXuriBwajmPR7ic4A2BSDBik1zlHE6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pjCGsjSFflJwwCj7qG4e/Fx2p1aYOB73xPCXI/OSdQ=;
 b=H00wVlF/3i/pH2ncRSyzr20yXUXIVHohaF3MdIAyftbpaHN3RcCA9qpmcvGtm7mk7yXfkDtO27XNUlVffinMEoBf34HxzJi64Ln4y8jJDlpLvsRjhtMactWF1DWCSNNwnmOnKVrANE2fI9rC8WRbC9M5nmWlcOhxf3/PLrcVCg7RpnZCjQCki8+WIMQEXDVf89lAl54MvYtqrIO34jxLAbn6FzhhGTvFrl4uk3aHa60b0QXr+DL9BYyxs80LXjwEEO+3biIT9eONib40j+QqIcX3C7yfqBYuOtmWat1ZHLgLp+SlGnaKM7HUcUfskNZSM45Vq00NGzqT0b0tvJoF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pjCGsjSFflJwwCj7qG4e/Fx2p1aYOB73xPCXI/OSdQ=;
 b=MrVaZtnLi2AJ0SC6exWDOvcpotY0Zjgd1BjkhL509hAn8jv00oYA6mccEs0eQfY/BWWv79ri8Df511CeRee75ZUyY3rxHyg6Vb8EBo53W/l2rxLcVb3buNQYkOOpLxbpzgPZccrX47iW7JxFPkJAJ1jedZ52PyuUY+2UEVLm/vU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a00a5295-e3a6-feb5-3c30-1cf6237cb26d@citrix.com>
Date: Tue, 18 Apr 2023 11:17:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: fix build with old gcc after CPU policy changes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <65f14053-1816-7f8f-b20e-c108575eabd4@suse.com>
In-Reply-To: <65f14053-1816-7f8f-b20e-c108575eabd4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0011.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: d09c75b0-06e0-4240-bed5-08db3ff61a72
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aP8usRvLVhnt0EwXGdFCTqh4zfpTIHOqFXcxzLAT1IClVBXdQo8IkiB9ZGh/CrVOdb1y5yFmq+PZhsOju10piNgQedcE8iqhYvHCiHJnjmALGryU4UOP5pQ4QaST/qYpWZ0Lnz2ftcXlmcGX1C+QN0F4AQs6XQbx23IAHPQlWQeHolwYTJuUPDMNvKqy0dsiPLywPVQ3pF3wCR/qWyRDWrI4m8PfyZYfOJIK+XhGs3q2+WCVRWJwms0rz+PTAOSimcxep3T2EKMenOG8fYpYmFXUVcBN7t1ZjpnhVJUTnz8sh1yoxmXrE6APQIObvVQFkqhMj3tyGzbNyp2EvL7LBPbvTEvqLecMq4+1BmJrV6nY/uFJp83FcS5+Tx0DBz4l0ycqv9MwZ13E7CmMmAGUoQcXi7y/u9UNwBZt49RRnNJEnp7BvYQSogm8trw9+90T17PZw5otpqMSC0NnNN29Zb6vOoLGddUL/SWJG6eTCU2x10ksYT+li3ByPle7DVfBwJt9elwRiYLe3JL3o4eYsDl4fTUfbrX25AMuBWWSZdEFx0nD35WFNGhoMWYOsPGta8WI4TFCdk6y5OKF6muDebxwXZSdtcPgMVnLANWqWlX0evtbW3W6RLblefyYdWhJZruUcoSyrxb59dLlYoMLlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(5660300002)(2616005)(31696002)(83380400001)(86362001)(186003)(26005)(6512007)(53546011)(107886003)(82960400001)(6506007)(38100700002)(8936002)(8676002)(110136005)(54906003)(478600001)(6486002)(6666004)(41300700001)(316002)(36756003)(66556008)(66476007)(4326008)(66946007)(31686004)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OS9jYktuWE1iaDR2TWhJM3c2ZTRHSTh1VTR2V3hxQzVabTFYUHJ3cWIwZG9r?=
 =?utf-8?B?TDJPbVVtK01hRU5RdkZWNGo4bmZid0Q4MEcxRmNCeUg0RExTR1pSalhqNnR2?=
 =?utf-8?B?dTVDeE9qcjAxc3pKam9pTDJ3M25wK2Jua2Qxd1dPUkFlUkxMOXVwTGRqNkRS?=
 =?utf-8?B?T2pWbkVBVFh2bE9EcHBpb3FnTy9sdStma3RHR1drL1VoM1lxWVJnZ2p4MWsr?=
 =?utf-8?B?cDhHaXk5MVlxK2YrS1J1VFRFMkt4QmZBVmVQT3NtQnczTzUrb1BGSXZ2RFdw?=
 =?utf-8?B?NFBCLyt1enlnZTdGNElEMks1ZzdCRmhpTW51NTBTU29xMC90cGtIVTVqQXZH?=
 =?utf-8?B?QWJQUERNTkd0NzVZVkhBK2luaHZZQWE5TUg3WWp2ZytMWXpmQ0JERFYzWTdE?=
 =?utf-8?B?WFlUWXVBVkFFY1QzblZiS2dWNnUyNjVKMTVUalUrb0xCNGNPUjZEWDRKYWFS?=
 =?utf-8?B?U3pIeTNWZ0pjQnhNNGt6U0k1L1V0MHdYWWpYVEJCWlJienAvOWg4c2REMnAx?=
 =?utf-8?B?S0QvbWRiWElVUmUveDhGNlBldXNGVnBNSVM1QmlSR0gyNVdTajVxRVo2ektt?=
 =?utf-8?B?Uy9zR0VOY2pnZldCaHV6Yy9raG1UMmM1MzZLWnNtNG9KR1g2M2pkMDVRNUhw?=
 =?utf-8?B?Vlg3Mi82OXVObzh4V3pHRU1sc1BnN2hDREVvTTRKYU5sanBrWGJPRlBjZ210?=
 =?utf-8?B?ZDZGS04vY2swMkIrTFNsQjNRMzVpMVh4VlhPTHpweHRnU1M5MTNmOS8zSEoy?=
 =?utf-8?B?bU5wOFNHWHUyeWpTQmRxdW9FYzNHN0hmTGZISDI3eXhrSGxwME5ZMmNVWGxX?=
 =?utf-8?B?S0Q3YWdZMHFYaHM1cTR4OHNuUGo4WTBTbFQ3RzdpVWx6cXUzaWFwTHd4ZVlM?=
 =?utf-8?B?UGhPVWZJK0JmOWt4MnNDODRuY0hXWnJsTWpGQXRqVHVENmlmNkhDTXdIM1dS?=
 =?utf-8?B?SG5adVk3SjNpc3FoNlhKRWRjU3dPUEtkd3B3T0ZTYmR5eDRsK0czNFJpbXgx?=
 =?utf-8?B?R3VrRnhNbWkwbXBrd0RLU3o5NCtpT3Q3Q1k4c3hEWXZzeHBOWE0vWlN0eCtj?=
 =?utf-8?B?MkRhWVlsRGt2VFdIVGJZSUZrRFY0TDErUlZoMVFFNzNWZ3hVbCtTa1JST2s1?=
 =?utf-8?B?S2dYR1dqNElRRldia3A1blp3TUUvRDZ4bVlkeEVFNHFMbHFyb0JnQUU5eERu?=
 =?utf-8?B?bzFVSlJpdEthSXB2LzRVNFJoR1A4R1hVcWVyWDNYTHhqQmN1U0VvZTdVbDFB?=
 =?utf-8?B?eXA3Vzg3dkthTndGSjlyNVBaYmJxOHdVbWdnNFIraG9XdXZiUmQrSmYrUEt2?=
 =?utf-8?B?YW9uOUhnU0IvbVltaGUvNk1RejB0K0lDR1ZqUlIwdEdZTUtJZG0yR2g5NXJj?=
 =?utf-8?B?Z0ZFdkN1cVhXbHRKMSszQytxcTBVMWFoOVEzeGdrUEJvNEZhVVVnZEp0TUNO?=
 =?utf-8?B?TGpzQ2pxNnpoMDZJY0U0c05rZkd3VjNBTWtiTElHTEJWMG16VGFvbTVnZG5P?=
 =?utf-8?B?SEFPL3h4bW5wN28wTy9RR1RIUlgxeVN4MmRlSzJiem5vSGl6VTF0QW8wekZH?=
 =?utf-8?B?ODdUa2s0N0FqNS96SjVjbzVraHg3dnk1QisvZGhwK01pdTgyL1h6MUh0MVdW?=
 =?utf-8?B?cW1GNmtkckhLMW1MNWFxdzJQcWxGa3paeUlvS0hVUSt0RWxYTzBxeXY5YjJB?=
 =?utf-8?B?Y25zMWpkVUlBR21jKys1V1NoWDNHeVRzazJjMzJXOFR1c3U1VHl0Wm41cGpp?=
 =?utf-8?B?WTRMa1cyZjBmQUxWLzRNMHdxZ1FzdnVlRHR3aDZhSkxRcDBqbDJocUZKenJL?=
 =?utf-8?B?TEcvU1NrdFJkRDI4Z0JoVWk3OGg5Ryt4WlFvckxUd0ZVNlpKeERFTFE4aTJO?=
 =?utf-8?B?d3JMOUJydFZpSGhmMUtFMnRxamZkQ3B3emtQZEp6blFSenVVL2kyZC80TUk5?=
 =?utf-8?B?V2hqTzl1WURJMjR4TThPUGZuaGJjc1c4ZnBoRlRyMFN1WGVWeG5hZ3RkVmhV?=
 =?utf-8?B?K2RqajFxa2drcXlJdzZYQXFqU21hZC9ZR296SGd5S1pFY3pBVlJTMnIveUNB?=
 =?utf-8?B?bmh5TFNDdVRlL2cyaTZLT3d1VjlJWVpHTnhIZmFxR0pEak9rdE93SXoxency?=
 =?utf-8?B?WXFTNHNLbFcxbGQ5cGEvN3QrcG9tY0xISmgzL1o2VVpYSklDZDlRckZxYXRP?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y5JJenAlpMdXvA5tMQTl+07XVTZGFmUMvgyEMboHlOuO3z6/7XqDzyhYm3SKTjhYc9V+kjsQOjyjMJgsXzi6zw1t0JaS0MWGWBGviK8kRcQRjnwBsS93boLny2HZE4u5qZ4KlfBB9a/VDpRW7mekqXLT/JgZqodhsFxcDjC5MH5Z29Dq60p3lChop7X8xHiifCZQTGwde8t1Wqm3l/vCs5NXYQ6UfLH+sAeSVY9HL1kNEajxZa8ZyBbx+09ObZahThNfSTa4II4g+yq/EnI+pJIQDCvxi0Tq+SItw+HvwH4Jr5XBwdpMGAMG1dnJH9c68Kd9Hrj0UFWyU94srsStfl0rlcooycUwYA8hQkETSmNMUomoJW6n33q74p3TaYDgVCPChbbrcE/rv9Tw2yUw626cqHtsP75BAzKETvRRO9VDP+l3W2OrtnqUht84dgMi0R6HlJj/2qhSvCXMKrTf7qmUZLuFBYhhoHLALWNvHj+Hvm195mckfPtjpysSAKPJnER93UoNweqVS6aCwcFEQtLN3UfIXm5WJKKpfEFO0P3IOPhTddDcIKB/aA0j6HYY8iS9xcHXtH/wEYnBklzSXayRsIAF7DGI8wsryF2WZ8sLmk9U8ElRAK8QewDHIssD+8ZdqPyVY5r6N9BX+vHnzPSvil9q2gMoPAS5csRZcesba55ldHkgjyem3D9P8N0bY0h0ZG3bUENxGY8pvniMTKC52kLxH58kJz//JJo4ZiRgoDtLB/egyCzfl2Mxm9DbL/LohpfNr/XzgvKWeMPxhRQnUdyAFD7XM1Sxp6aDgPWFQJn9uILg/8Brc6cpiBPwhAs15oBau8886Bzjj4kkZQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09c75b0-06e0-4240-bed5-08db3ff61a72
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 10:17:24.4861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDMyPvOWzjT9Qi8LO87K5otBeOvIe7ZZpmSNGu0BxNjJqK79nnIvZOmDIPqsqsewMcwmDMzxKLwupyB5ZSdP7V0CvIp5InvmAKUhKxuPfiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6075

On 18/04/2023 11:15 am, Jan Beulich wrote:
> Old gcc won't cope with initializers involving unnamed struct/union
> fields.
>
> Fixes: 441b1b2a50ea ("x86/emul: Switch x86_emulate_ctxt to cpu_policy")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>


Urgh.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> I guess, but
I'd honestly far rather delete support for such obsolete compilers.


