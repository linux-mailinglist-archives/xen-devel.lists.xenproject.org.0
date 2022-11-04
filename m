Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B14A618FCD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 06:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437273.691533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqoqB-0000Ma-U3; Fri, 04 Nov 2022 05:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437273.691533; Fri, 04 Nov 2022 05:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqoqB-0000KW-Pv; Fri, 04 Nov 2022 05:02:03 +0000
Received: by outflank-mailman (input) for mailman id 437273;
 Fri, 04 Nov 2022 05:02:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pjMC=3E=citrix.com=prvs=3000da1f0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oqoqA-0000KQ-DX
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 05:02:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf54cdc2-5bfd-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 06:01:59 +0100 (CET)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 01:01:49 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5474.namprd03.prod.outlook.com (2603:10b6:208:285::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Fri, 4 Nov
 2022 05:01:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5769.026; Fri, 4 Nov 2022
 05:01:34 +0000
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
X-Inumbo-ID: cf54cdc2-5bfd-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667538119;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7v4JX06bnruSnfUstudr0IiKSAjk/5gSwhWdF4I81vY=;
  b=F3RmZzVKc5zcblrw+NN2YyIuv1h7lFOYeZbAyNLI7AHDxu4xb0sQN4Vk
   b0hAvpN6Zq+D1gMIZJxL4+QS8mLUAw5/8cWMJ9XMtHrlHCDqNk2QVUBmR
   l0vdUzKAe+Ue4fApiyRGEpKfnvcG8JTcT0HU6lGrfLd3CGvU1VnX0yy6X
   A=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 83755405
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nGrDw6z4dxATpMzUnxN6t+fGxyrEfRIJ4+MujC+fZmUNrF6WrkVUn
 GUbX2vSMvyPYGOgc9BzO9ng9ktTv8LXmN9nQFBu+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPawT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXxXy
 /gFcxczVC2K1rKcw72WCfRRtst2eaEHPKtH0p1h5RfwKK98BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVMuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAurA91PSeHgq5aGhnW64WIyBxgzeGCmgqS3hGC8VOxcc
 EgLr39GQa8asRbDosPGdx+3unmfpTYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXQ3+A8rafrRupJDMYa2QFYEcsTxYB4tTliJE+iFTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1U/DqyKhoN7OVAFdziXaWHi0qDxwYoGNbpatr1Pc6J59wJ2xS1CAu
 D0OnZiY5eVXV5WVznXSH6MKAa2j4OuDPHvEm1lzEpI99jOrvXm+YYRX5zI4L0BsWioZRQLUj
 IbokVs5zPdu0LGCMcebv6rZ5xwW8JXd
IronPort-HdrOrdr: A9a23:z0qMo698xpneWZ5MWMFuk+F7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCKlaDPY0LDErXQBeoR8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0XbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9M1lVBw6du/22z6IJyoHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.96,136,1665460800"; 
   d="scan'208";a="83755405"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISMV8mhKGnqed0j1an0V4q0LMn6k7RSckYyYe4Y6PCqC/65/7d2o+3r/ns8y4DjNG4jmrBFWpjcTK9ZbtxipvtyZXL+sv1TemgTrKPqcmatY+7/x7efmaD/u0aRcOw0lgfS5Zo3i7aU7TT/iR/gUk89LwK2WYgrThBTQ5Z+hZ56BjAGHR9a7pZSAYFxV8btQvmQM+RoPpjI6Jx0hgxNWO+rFNx8Kah1PvVU1RcqKQAFM8ZBDxZjPKIayOEvivofmifkzydk+IhgUiNe+fSOxKgExKj8Sj97pjA6OUQfiyPnRKrJc+IhxteuY0nLSJocO07DXBqcgeEufSscOBVcFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7v4JX06bnruSnfUstudr0IiKSAjk/5gSwhWdF4I81vY=;
 b=W4RXbICabCEyqvgXhiInmNP7glyg9wydpdsVHQOyatjZavylYwhoGABQjPpKTdXddVQNqJu7S76SQKe7Sd28q8qxX0pdl4xq3Rbj16kLunoywJDC2TK59eGG1pGM6JK6EfXEs2T6e924BfEt4yWKu12SANiYt5cA62Pq0Xc0BMijxzcFpSGV6UXouj0gBrMOLjFWM/Us6LhfuHd3PbodFnt9pAfsucqaCMzSqJU8SMeyJ47Y/Pj0pQzXbFOUDhIW0MJAeRb9vHE4GSzn3GE/PdJzZv8Kb23rDfPeUSxHW3GUjOX4M3InP1FIr7HEMzblIyPp/seLdOW8lqUSWuYujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7v4JX06bnruSnfUstudr0IiKSAjk/5gSwhWdF4I81vY=;
 b=vTvnwaKJ51Sp5YQ7gJnS3zaJJBf7kkMiP2rIZel72p+SoB7ZCLmGSm4EoFeOrgYAzJL8TRC4TrqXfRkl0x17NqwAjYvA3fdR8JdO+GiogEzAFxPkeE2HN2YR5QJqytq/pFBcNalg/1AIHerScVFfH9UYG6PWJf2/vRWhL64PEjk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Revert of the 4.17 hypercall handler changes Re: [PATCH-for-4.17]
 xen: fix generated code for calling hypercall handlers
Thread-Topic: Revert of the 4.17 hypercall handler changes Re:
 [PATCH-for-4.17] xen: fix generated code for calling hypercall handlers
Thread-Index: AQHY76JzuJHqrt9HWkCsd/BvJMgfvK4uNcAA
Date: Fri, 4 Nov 2022 05:01:34 +0000
Message-ID: <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>
References: <20221103163631.13145-1-jgross@suse.com>
In-Reply-To: <20221103163631.13145-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5474:EE_
x-ms-office365-filtering-correlation-id: e74bc54d-3992-4ea8-03d5-08dabe21a57e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 HwGJYw+ovL7yoP0/S9NhlQq+j+6/uW4ErBUyDzyr/yzA/7Fw5btZkWu5s5m4TAWGrm4VDOmJ/G65hwxbzSDJVHlCA9Z1Q9TU063gwXcHGpUobA2tZWctIYxeb7Fmdj0hQfSRrrYvcYJm6eG66jMb0wejmtCeeW4jQ3XUXfFpy89Au8CE61P+PrLnx/pVYl8Qz7puZY1YkJbKcpY5NlhLBfE8yYmj3zqcTsfQ3Fjc8joVr1MrV+IVR3zGsnzbuhQg96zNfqFtuRkuSiDN9OzMddXL8UfGFhcyDTk6FXOR6lRKOU1AghNSgHMIJQEKN+a2vIzjkizZDC6TOfy6BXAeVgb4z0GNw614FW2ZZNfg9Splov2pllsbjrPEgm1BEsudj8ZqpARiJlgcS19pyWlZO1vNzpwr16F0xR6/SGcGCBSpv9GeWNGD1ITuF0/flcmX3VWNg36cBqYwSFpZEsHvX6ADPJiz8LQxKURuwferYCxb7b8xYlSIvKZeHqq8609RdjRaDRUINoWvfF9F5WFv4Bn62M0lm0xK+gmYWWrJEB+pt6VD7De6QabE1WDceU0aM6ozZSJLgzHCArzvZdHrObsBpDtvXtJd0igis7K87CxMAonu1wBJstclCeefD72rVaoGZp9HS1rK04ZDb64kEax3VZqjVLkeMRdN10y3xVOHVkwSCwF+fOT8rBt2xLIVG5/ko0MWhxsMc1vh+dGYVUOFJo4etAJyivkPWUldNwfnv21d1ddHbAGgAFqtTXhigExxWq8LFGdcN5ZujmGdVsZiGx4D2JN/B9jnajyKyxz8UX3057CSS+PGJX4XHYTX+U8MbijNbFl9q4WCqch4pesesWf42TvK93PH4rsBY68=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199015)(76116006)(31686004)(54906003)(8676002)(316002)(66476007)(66556008)(6486002)(110136005)(66446008)(71200400001)(91956017)(66946007)(38070700005)(478600001)(4326008)(86362001)(186003)(64756008)(31696002)(36756003)(966005)(5660300002)(2906002)(83380400001)(8936002)(41300700001)(122000001)(82960400001)(53546011)(6512007)(38100700002)(6506007)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cS9KMnAzWlNTbEhWL1F3Q1hpYWFGVjBkc2RoN1pwSy9DM2ZMdWdjeDlwR3FB?=
 =?utf-8?B?STczUFdhdkZBTUsyS1lscDh2Zk5ZeENuV3hDVVVJRHNlMTF0UWZZQTRFYjg2?=
 =?utf-8?B?MnNrQVFIU1NrbytvK2NLSmdram9tZW40TmpCYSs1WTFiYkRLUEJrV1RiMWhp?=
 =?utf-8?B?aGh6amM3anhhb1FTTVFXZ0F6M0R5d0pic3JkNGpETTYvcDFlaXd4dDhVU21r?=
 =?utf-8?B?djZGSHp4U0Y4SkxvM3ljTGtMeDEzZHFtUUJPUmJjTmNjRmVhTDZCQ2hSeWlL?=
 =?utf-8?B?SmxVaEhGVnF4RldrYXlFdTRKQjY5QkhydGs1RzNpSzhUZEYvdUFrMzZvL2Er?=
 =?utf-8?B?L3pBcXdiOXlMbEhtenBsZHhWUGhwVXdkNmNiVCtBdjBSSDJpeEp3V2N1MWxJ?=
 =?utf-8?B?T0RsVStKL2ZTZnMwLzdxdFdOWHREZ0NBcE9NNEVHR0FOcjgwRFU2U3I2K2hW?=
 =?utf-8?B?L0dNNnliRTFGbGd4N2hUUWkza2NnT1dzYzlDeGlRZEpyN1pGVzl3Vzk2U1lS?=
 =?utf-8?B?MFVUZWNvWnE0Y3l5Q0ZUMVZKMEFjeHpHd1Rpb3V2Y253dmJXR2tQeEJxcm9q?=
 =?utf-8?B?UE5POHp1aUY3YWpOWGRRb3JTYUhQTU90bVJycDZHTmhkTGZkMGlxeHhuTitH?=
 =?utf-8?B?TWtBbFZVbXJSOTF6cXpkMVpvYldab0VmV3VMV2dhZXBnMmljdGoyZVB1N09u?=
 =?utf-8?B?ZE5ZUHYxcUQ3QVhuczBRS2dFVUdZRTJmR1dOL2VhSnhpdzgxYlV5VGsyS1R0?=
 =?utf-8?B?WUI0L2xTdFBrQkpLckphakh6YlFkNVAxZE9VSnRlSDBDeWlmWEtqa1MwZFZ0?=
 =?utf-8?B?ZEpPTFVXUVJEVHNCWjZsQzlBaTlCLytNYkNTOUF4ZHFPY2tNWWR1YzFoMzV2?=
 =?utf-8?B?bVRyNG5rblZhTWdoencwWTJkT1NQdUJHaFZSbURsNngyemszc1NiUUhEWkNz?=
 =?utf-8?B?N2pKaXRrNHA2UGs1UVBqL0FXbkZ2T0tyMUNZMHgxbzF5TjBpNXdvZHA2K3JY?=
 =?utf-8?B?cHEyMVdHTFFVTjdSWUhhSHA0L21mT0FiaU9sbERpNWVZR0UxdVpGdDNIMUlY?=
 =?utf-8?B?VGs1NVVKMDNHMVo4d2h6alZqTzR5ci96Y0lQZ0R6TFpEWEpMcCsvcnlsbXdi?=
 =?utf-8?B?alprNVJqU3hEMmg0N0tXUHFQMUc1Z1B3Y2p0ck1vNzY4eWxTcnNZc2trbVlX?=
 =?utf-8?B?bTJrME9LTU53SXpwQ1p6QUk2cGxPVUFhUjAzQTFDWC9JMEtGSk0xcTZueVFL?=
 =?utf-8?B?aHkwL2g0U0pEQTJwS29KWjdKNUJMWElwbmlHTWZuQzJDSkZ0a0c5cUE2ZjJt?=
 =?utf-8?B?b1pJSmpzQW83UXZuNHNLUjlybXc2cGVGYXp0S1U5OVd1L2JwOEZ6UUR5ZFU2?=
 =?utf-8?B?cmtlWFlyU3ZydHRLVlE2OXBvSUdtU2R3ekQyUUVjM0NvYW5STUV1cmoyL3Y4?=
 =?utf-8?B?dUNwN1UzZWhKTFgySGxVdUsxdit2ZHM3dmZ1cXUySTl0d2NXZGQxU0RDTnYw?=
 =?utf-8?B?OGVNRmNZUWlWNGNRSkg3c2FXVlIvT0xiQXVhWis5ZFRDQ3Y2Zy9kUTRCMVVW?=
 =?utf-8?B?QmNjc0MyNFdIbHVvbEN5ZHNYYkptSzU3OVZDcGNMaGk4QStRZ1ZrYk9nTm91?=
 =?utf-8?B?SGg2LzdYWVQ2R01EY1NJc2RoUzF3ZTZYZ2pxdDFJaVBndmZIb3R4blJqRUFh?=
 =?utf-8?B?cnNjODNGSm5SaWVjVXJuUW9kY3Y4MUJjNk5iWkpJTElkdEhlU3k2WVhwMnlY?=
 =?utf-8?B?a2thNHA4TXBDalAzMksyS3l2N0xZbDJsTVhPa2pXMUg1K0dOY0JxaXdadnl0?=
 =?utf-8?B?ck9QaEdnOXorUVorQmsydmlZN29QdUEvSnRTY3hTSHpvR3BhR3hDaUlMc3N6?=
 =?utf-8?B?TnJpV0ovaHV4cUxkWGw5M281WjVFTDlnZ1FxQk5CTGRHdmhWZDMwRzMxL0h5?=
 =?utf-8?B?RkRNb3VKOXYyV2FjR1VCSVgwM3VZeHhaMzAzazZkQzJsQ1ByN0lFdS82ZTZG?=
 =?utf-8?B?YkJGSkQwMDFhZldWMDJUWGh4TkV3WEpoN2FESW84TkhsVjRpTGp3eEJFbmwx?=
 =?utf-8?B?ZDJXOExkeE54bkN6YnppMEdvREN3UEZUZFdUcmtUNTFrcmNlV3JqQ1cwOExP?=
 =?utf-8?Q?PdaNwVE4e85UjGzjlllZDKhYe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1A61F1622093741AAC317BD0B19A892@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74bc54d-3992-4ea8-03d5-08dabe21a57e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 05:01:34.5887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xrp0Ya9PkgVM2eep68lYj+ctsBco9ID+r9mZsLgrgMTXCdKLmgoZixB1Hto282NsrYp6Sn9ZzDPd726VFJMOLvgh+yYpmD9XqCcwXI+2qhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5474

T24gMDMvMTEvMjAyMiAxNjozNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gVGhlIGNvZGUgZ2Vu
ZXJhdGVkIGZvciB0aGUgY2FsbF9oYW5kbGVyc18qKCkgbWFjcm9zIG5lZWRzIHRvIGF2b2lkDQo+
IHVuZGVmaW5lZCBiZWhhdmlvciB3aGVuIG11bHRpcGxlIGhhbmRsZXJzIHNoYXJlIHRoZSBzYW1l
IHByaW9yaXR5Lg0KPiBUaGUgaXNzdWUgaXMgdGhlIGh5cGVyY2FsbCBudW1iZXIgYmVpbmcgdW52
ZXJpZmllZCBmZWQgaW50byB0aGUgbWFjcm9zDQo+IGFuZCB0aGVuIHVzZWQgdG8gc2V0IGEgbWFz
ayB2aWEgIm1hc2sgPSAxVUxMIDw8IDxoeXBlcmNhbGwtbnVtYmVyPiIuDQo+DQo+IEF2b2lkIGEg
c2hpZnQgYW1vdW50IG9mIG1vcmUgdGhhbiA2MyBieSBzZXR0aW5nIG1hc2sgdG8gemVybyBpbiBj
YXNlDQo+IHRoZSBoeXBlcmNhbGwgbnVtYmVyIGlzIHRvbyBsYXJnZS4NCj4NCj4gRml4ZXM6IGVj
YTFmMDBkMDIyNyAoInhlbjogZ2VuZXJhdGUgaHlwZXJjYWxsIGludGVyZmFjZSByZWxhdGVkIGNv
ZGUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoN
ClRoaXMgaXMgbm90IGEgc3VpdGFibGUgZml4LsKgIFRoZXJlIGJlaW5nIGEgc2VjdXJpdHkgaXNz
dWUgaXMganVzdCB0aGUNCnRpcCBvZiB0aGUgaWNlYmVyZy7CoA0KDQpUaGUgY2hhbmdlcyBicm9r
ZSB0aGUga2V4ZWNfb3AoKSBBQkkgYW5kIHRoaXMgaXMgYSBibG9ja2luZyByZWdyZXNzaW9uDQp2
cyA0LjE2Lg0KDQpJbiBsaWV1IG9mIGhhdmluZyB0aW1lIHRvIGRvDQpodHRwczovL2dpdGxhYi5j
b20veGVuLXByb2plY3QveGVuLy0vaXNzdWVzLzkzLCBoZXJlJ3MgdGhlIGFicmlkZ2VkIGxpc3QN
Cm9mIGVycm9ycw0KDQpUaGUgc2VyaWVzIGNsYWltcyAiVGhpcyBpcyBiZW5lZmljaWFsIHRvIHBl
cmZvcm1hbmNlIGFuZCBhdm9pZHMNCnNwZWN1bGF0aW9uIGlzc3Vlcy4iLCBjL3MgODUyMzg1MWRi
YzQuDQoNClRoYXQgaGFsZiBzZW50ZW5jZSBpcyBsaXRlcmFsbHkgdGhlIHN1bSB0b3RhbCBvZiBq
dXN0aWZpY2F0aW9uIGdpdmVuIGZvcg0KdGhpcyBiZWluZyByZWxhdGVkIHRvIHNwZWN1bGF0aW9u
Lg0KDQpUaGUgb3RoZXIgaGFsZiBvZiB0aGUgc2VudGVuY2UgY2xhaW1zIHBlcmZvcm1hbmNlLsKg
IEJ1dCBubyBwZXJmb3JtYW5jZQ0KdGVzdGluZyB3YXMgZG9uZTsgdGhlIGNvdmVyIGxldHRlciB0
YWxrcyBhYm91dCBvbmUgdGVzdCB3aXRoIHNwZWNpZmljcywNCmJ1dCBpdCBkZXNjcmliZXMgYSBz
Y2VuYXJpbyB3aGVyZSB0aGUgZGVsdGEgd2FzIGEgaGFuZGZ1bCBvZiBjeWNsZXMNCmRpZmZlcmVu
Y2UsIGFzIG9uZSBwYXJ0IGluIG11bHRpLW1pbGxpb25zLCBwcm9iYWJseSBiaWxsaW9ucy7CoCBU
aGVyZSBpcw0Kbm8gcGxhdXNpYmxlIHdheSB0aGF0IHdoYXRldmVyIHJhdyBkYXRhIGxlYWQgdG8g
dGhlICI8MSUgaW1wcm92ZW1lbnQiDQpjbGFpbSB3YXMgc3RhdGlzdGljYWxseSBzaWduaWZpY2Fu
dC4NCg0KVGhlIHJlYXNvbiBhIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IGNhbm5vdCBiZSBtZWFz
dXJlZCBpcyB0aGF0IGEgYmlnDQpvdXQtb2Ytb3JkZXIgY29yZSBjYW4gZWFzaWx5IGFic29yYiB0
aGUgaGl0IGluIHRoZSBzaGFkb3cgb2Ygb3RoZXINCm9wZXJhdGlvbnMuwqDCoCBTbWFsbGVyIGNv
cmVzIGNhbm5vdCwgYW5kIEknbSBjb25maWRlbnQgdGhhdCBhZGVxdWF0ZQ0KcGVyZm9ybWFuY2Ug
dGVzdGluZyB3b3VsZCBoYXZlIGRlbW9uc3RyYXRlZCB0aGlzLg0KDQpVbmFkZHJlc3NlZCBpcyB0
aGUgY29kZSBibG9hdCBmcm9tIHRoZSBjaGFuZ2U7IHJlbGV2YW50IGJlY2F1c2UgaXQgaXMNCnRo
ZSBuZWdhdGl2ZSBoYWxmIG9mIHRoZSB0cmFkZW9mZiBvbiB3aGF0IGlzIGFsbGVnZWRseSBhIG5l
dCBpbXByb3ZlbWVudA0Kb24gYSBmYXN0cGF0aC7CoCBBY3R1YWxseSB0cnlpbmcgdG8gcmVhc29u
IGFib3V0IHRoZSBjb2RlIGJsb2F0IHdvdWxkDQpoYXZlIGhpZ2hsaWdodGVkIHdoeSBpdCdzIHJh
dGhlciBpbXBvcnRhbnQgdGhhdCB0aGUgbG9naWMgYmUgaW1wbGVtZW50ZWQNCmFzIGEgcmVhbCBm
dW5jdGlvbiByYXRoZXIgdGhhbiBhIG1hY3JvLg0KDQpBbHNvIHVuYWRkcmVzc2VkIGlzIHdoZXRo
ZXIgdGhlIG11bHRpLW5lc3RpbmcgZXZlbiBoYXMgYW55IHV0aWxpdHksIGFuZA0KaWYgaXQgZG9l
cywgd2hhdCBpdCBkb2VzIHRvIHRoZSBvdGhlciBraW5kcyBvZiB3b3JrbG9hZHMuDQoNClVuYWRk
cmVzc2VkIHRvbyBpcyB0aGUgaW1wYWN0IGZyb20gWFNBcyAzOTggYW5kIDQwNyB3aGljaCwgYXMg
bWVtYmVycyBvZg0KdGhlIHNlY3VyaXR5IHRlYW0sIHlvdSBoYWQgc3Vic3RhbnRpYWxseSBtb3Jl
IGV4cG9zdXJlIHRvIHRoYW4gbW9zdC4NCg0KDQpUYWtpbmcgYSBzdGVwIGJhY2sgZnJvbSBsb3cg
bGV2ZWwgaXNzdWVzLg0KDQpUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIGEgTklIIGRvbWFpbi1zcGVj
aWZpYyBsYW5ndWFnZSBmb3IgZGVzY3JpYmluZw0KaHlwZXJjYWxscywgYnV0IGxhY2tpbmcgaW4g
YW55IGRvY3VtZW50YXRpb24uwqAgQXMgYW4gZXhlcmNpc2UgdG8gb3RoZXJzLA0KdGltZSBob3cg
bG9uZyBpdCB0YWtlcyB5b3UgdG8gZ2V0IGNvbXBpbGUgYSBoeXBlcnZpc29yIHdpdGggYSBuZXcN
Cmh5cGVyY2FsbCB0aGF0IHRha2VzIGUuZy4gb25lIGludGVnZXIgYW5kIG9uZSBwb2ludGVyIHBh
cmFtZXRlci7CoCBUaGVyZQ0Kc2hvdWxkIGJlIGEgd2hvbGUgbG90IG1vcmUgYWNrcyBvbiB0aGF0
IHBhdGNoIGZvciBpdCB0byBiZSBjb25zaWRlcmVkIHRvDQpoYXZlIGFuIGFkZXF1YXRlIHJldmll
dy4NCg0KU29tZXdoZXJlIChJIGNhbid0IHJlY2FsbCB3aGVyZSwgYnV0IGl0J3MgNCBpbiB0aGUg
bW9ybmluZyBzbyBJJ20gbm90DQpsb29raW5nIGZvciBpdCBub3cpLCBhIHN0YXRlbWVudCB3YXMg
bWFkZSB0aGF0IGlmIGlzc3VlcyB3ZXJlIGZvdW5kIHRoZXkNCmNvdWxkIGJlIGFkZHJlc3NlZCBn
b2luZyBmb3J3YXJkcy7CoCBCdXQgdGhlIHNlcmllcyB3YXMgY29tbWl0dGVkIHdpdGhvdXQNCmFu
eSBwb3NzaWJpbGl0eSBmb3IgYW55b25lIHRvIHBlcmZvcm0gdGhlIHRlc3RpbmcgcmVxdWVzdGVk
IG9mIHRoZQ0Kb3JpZ2luYWwgc3VibWlzc2lvbi4NCg0KVGhlcmUgd2FzIG9uZSByZWRlZW1pbmcg
cHJvcGVydHkgb2YgdGhlIHNlcmllcywgYW5kIHlldCB0aGVyZSB3YXMgbm8NCmRpc2N1c3Npb24g
YW55d2hlcmUgYWJvdXQgZnVuY3Rpb24gcG9pbnRlciBjYXN0cy7CoCBCdXQgZ2l2ZW4gdGhhdCB0
aGUNCnByZW1pc2Ugd2FzIGRpc3B1dGVkIHRvIGJlZ2luIHdpdGgsIGFuZCB0aGUgcGVyZm9ybWFu
Y2UgdGVzdGluZyB0aGF0DQpzdG9vZCBhbiBvdXRzaWRlIGNoYW5jZSBvZiBjb3VudGVyaW5nIHRo
ZSBkaXNwdXRlIHdhcyBpZ25vcmVkLCBhbmQNCi90aGVuLyB0aGF0IG15IG9iamVjdGlvbnMgd2Vy
ZSBkaXNyZWdhcmRlZCBhbmQgdGhlIHNlcmllcyBjb21taXR0ZWQNCndpdGhvdXQgY2FsbGluZyBh
IHZvdGUsIEkgaGF2ZSB0byBzYXkgdGhhdCBJJ20gdmVyeSBkaXNwbGVhc2VkIHdpdGggaG93DQp0
aGlzIHdlbnQuDQoNCn5BbmRyZXcNCg==

