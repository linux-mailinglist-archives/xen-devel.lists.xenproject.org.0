Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E1652319
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 15:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467104.726113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7dxX-0002DB-81; Tue, 20 Dec 2022 14:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467104.726113; Tue, 20 Dec 2022 14:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7dxX-00029m-4e; Tue, 20 Dec 2022 14:51:11 +0000
Received: by outflank-mailman (input) for mailman id 467104;
 Tue, 20 Dec 2022 14:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+pxk=4S=citrix.com=prvs=3460f7db1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p7dxV-0001xk-VE
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 14:51:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a6767f-8075-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 15:51:01 +0100 (CET)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Dec 2022 09:50:52 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6959.namprd03.prod.outlook.com (2603:10b6:303:1aa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 14:50:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 14:50:50 +0000
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
X-Inumbo-ID: b7a6767f-8075-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671547861;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KymzHyF0sYV1bpccjRYtSiMvhK76KC21Yhf9X9PE1jU=;
  b=M9lddMbxkvRaqIACV1+wOfbKdvXb+bBoCbNdyst5ntVejo6DZuP+iJ09
   0oV1QwA0h+DvEfVgLnmnOOLfoQl9AwRfhNHXh6H6MsK2A6TDZS3GmLkWu
   8sNzqseepCE6GrmiASPZDsU5BWOOrGt+W0ZLil+eLTgsBPlCERLg+3mBn
   o=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 91778584
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sHXoyKxF7OW//wlK92R6t+cVxyrEfRIJ4+MujC+fZmUNrF6WrkUCn
 DFNUGqAOveJN2v1Lo9/OYqz9EkGupXSz9NgQFFpqSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkP6gT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTwRr
 9tEGhEUV0iKi9vxzoy8eLd81st2eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVMtuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqAd1NRODoqpaGhnWJ6nIQIUM2CWDr4vbkph7kcOgBM
 hA9r39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A79y9pog210jLVow6T/LzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:MHmSwaATB0gwpQTlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.96,259,1665460800"; 
   d="scan'208";a="91778584"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmioY4o+8AxczSThuNfHqvPBWrbrz3xY/PeT9E1LXLaDTWWudaV0anH0llxTAPxKFiOU1A0cGi7xc34zPSAmaOyfPx18wktc2yYu3LM4ppX7JQNKgJG2P5e8V4CNgqJl4s/Xh3Iu5JW6EX5U2XzqQ43iOhay3/rN5EI8rxCeHYbo2I7fMgnszDuqeOKzb65hfcsXaW1UUit3auPG1cISyVqrXFEB7EoXAn27iiaxCs784P+j74Tvkb7KbSBiMr0QeLGV1g0vsGUlKBDuCwT+da2b5aDszpXJRzeRlCiWmXZRgcB2yr2ythUvWyOcx+RmzIQtY9x6w7TRIK9ubOLzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KymzHyF0sYV1bpccjRYtSiMvhK76KC21Yhf9X9PE1jU=;
 b=iMLEy1He1tCvdyX9sBN+wCW5XGHN4IYWeVzBaO8a9CvB/fXUMZqZWpORe6Lot4k5L0Nxnzm70VbrLXYl0TocLHjitXIV1VcUzjOVKY4Thi3ztKHeUjE5x/HvTC/2jr++zyeJiQuFTv2MLErcGwsROyBM8IOhqgxfmyHEHH5Pg9fo0mCGAMa2eXmCCX05bTpvs7DrzF49fUy7SS4REcSjDppdjeSNaKp+AWUVm3iQ9jUUbC4cyBZkF2MF890mC60rKdtpR95AZadWA6ewoEE16Neb7LAWDgMm7yhmr5NxhAtPc1xcNpdkREFIAKr7+1k5cYoFlbFqRnfm9HxaOLaieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KymzHyF0sYV1bpccjRYtSiMvhK76KC21Yhf9X9PE1jU=;
 b=lQen4IqnjsKKiQ/w4gzvjuZcWReM+p9Iks9v/hxAlqKM/4xKTdjLV9Q36Gh4QQKiybopV7F4kuJuuQ8rR8JedM3NKmy0GHzHJZEV1GqFO9VM4c2VPEKRa7oNj2HMtSSvTuFXpnYTjJjS5eJZIG3Jy5UbJNGjDAQHy0WYnv18xQI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/3] x86/ucode: load microcode earlier on boot CPU
Thread-Topic: [PATCH v2 3/3] x86/ucode: load microcode earlier on boot CPU
Thread-Index: AQHZE7iZ8bzRRxQprkqqSa5cEoE/Mq523XSA
Date: Tue, 20 Dec 2022 14:50:49 +0000
Message-ID: <43cbf750-d682-af37-ac2e-60229a77bf98@citrix.com>
References: <20221219144533.19836-1-sergey.dyasli@citrix.com>
 <20221219144533.19836-4-sergey.dyasli@citrix.com>
In-Reply-To: <20221219144533.19836-4-sergey.dyasli@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW5PR03MB6959:EE_
x-ms-office365-filtering-correlation-id: e1369cdf-2cd9-4f5d-098d-08dae29995f2
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MLutFzhfuCzJEVoCjUvGE5cSvMtd+6yz6EursrlhzhLbfRVA8PUBAZ8+RXWyuslCPP+BbxkktFofmtakuu4YIS3n40AaSSr4GmAoIxJeHPNgMmmqr3/U19KBTS6Rq9aLuhDv5tukPE+HoS4jnSkoQXkwcugvmXG41r2jSzgjxKN87pyIlKWy8VSPXO2uVPL2zOTk6ceSUA+1wXKfE0OOgmM+HEvnq88M4pOrJEe+TLOYeSzAWFPnfjJhz2xu8Wfavzc2uvPAdMFEQPTBvIojEYURVgUGRnFYdOeD4kpaFFE/nP+cp/neMSZY63J86aFVDHes+geKAxhGnzebYDsTTfwgZxNZG9ec0WlVDAElbQBKPK6/oAMu2pwr9V/D22btWwMOPDzEgqNW/SLXgYSVXQ2SjCn7cwsHp3v7t31VMQd5TNlxwZ7qzvf/6gHeDYD+bZuWSfhTMNOMDGT0qd9PDk/s8i/ChPK327Vq04buVd8tcnHm4HJscp8CCZno8z8FPOOj0NANJyROvy6LQ4onkF6DqBRFJZzsQFGQDiJNNp9R8+vEWOIX66LvMu1hWeltg3wi87vJMyPEMu6i8T5V4A5zM0c/zJE8W8KXLOWyUQwxfwaMguMEO+7fkdooNj40UmRJ2khnMgxh7bV4dBNw9QGkpg493KhKvKweKqFApr3l5NRfMtD2B3CcCeGDVXg4uQjifmD8B/hgLE3wIT0GRr5/HHP6EBz3W1RMkWbbayVSw1+P8qsmn+W78V20OiyMUCH0q9bfTf2CWGcSlX6TUA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199015)(66476007)(91956017)(76116006)(86362001)(66946007)(66446008)(8676002)(4326008)(316002)(64756008)(31696002)(8936002)(5660300002)(36756003)(2616005)(66556008)(6512007)(53546011)(6506007)(41300700001)(71200400001)(26005)(186003)(38070700005)(122000001)(54906003)(38100700002)(4744005)(82960400001)(6486002)(110136005)(478600001)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UllRZTc4ekpIRWw1UjFZbjk4eUxxNDd3VVNKMndpcjlhV3BqaXM1cnE0TXph?=
 =?utf-8?B?ZmhzaVpFeVplNmF6NGVGbSs4SUZuN3ArZitVRTd3Um9xaHEzOGZwcy90S1FP?=
 =?utf-8?B?ZmI3VERFdjFpbWNCazg4WENmb1QvaU9VWDg0U0JZTllXeG1vVTNzQ2ZTd3JR?=
 =?utf-8?B?ZXdzYTluQ3VsN1ViQlZselNka1lXU1NMRmIrVS9lOWtoOWU3NlA3bkVneXZB?=
 =?utf-8?B?Q3QvQm9yMEVmQ01Hc1BFbXRBNXpaelNIVGxaSXMwN01RZEJLdFMreWowNWo3?=
 =?utf-8?B?RnBNdWRpVkJwSExkNlhjaUFXYzVVRU82VFg4NHFEbzRFcEJBVG10aThMNVRa?=
 =?utf-8?B?YW9Tek5ub3JaaXp1MWhESDRwT0RScGNpNFNxcmJrNGhnVi9RNHk1RFR1YjU1?=
 =?utf-8?B?RHNxdE5hNW9Lc3BmVEY3QTFucjdha2o2MUk2OG92VXIrRmU2Vm5obWc2QXlN?=
 =?utf-8?B?RjFnQ2tYWlpFU3pUMTNSUWhVU2JwQ1VubUxXZW1BYkZuZHV0NmVsdjNEYVg3?=
 =?utf-8?B?SzlkMStvTDNjT0pYaHdGdGk4UWhyU1FtNFAzdU5WOHJkN2MxOFhwOU81NG5k?=
 =?utf-8?B?amp1MVgyZEUyRjhkYkxxckNRWEdSS3pMSVRoMUFSMnhTb1UydjFqNzlVMTFS?=
 =?utf-8?B?cTFIRWZYbWRLV2wyeXFNU3J4RE9HazZkQmZMSnVtVVMrYUdaeU9lcFdJaFdt?=
 =?utf-8?B?N1kvbGRmdW5WbzV4OHpRT0p3TGsvNzU0YTZDdGlQb2tYMnhxaWZWckRhRDNo?=
 =?utf-8?B?MnZ4OEtJc1ZQZnVrS0pRV2FwdGozU0lSb0Y2WmU2U1YxUUZtQStwTnVOb0RI?=
 =?utf-8?B?RG1QaHpUMmhqQUxjRkZqZW9XNTVJRElQaUxpZjY1RDBpOUNDVmhmSFF3T05l?=
 =?utf-8?B?NFFJUjRVRWZHUkttVmRxeEZiNlZHUjBxSXl5OTVtdVo2TERvYlUwQUZNbmlY?=
 =?utf-8?B?YnUwQ1ZwT3NNOUhFVDQwR0t1cllDbkdoTGlHZmE5Wko0RVVVNzE5cU1PaEVB?=
 =?utf-8?B?MDFlZzhzVG9ORWZBOHQwaUIwbHlQSjZzRmlRcGZQblh5SnRyVk5qRWdRdFFo?=
 =?utf-8?B?TlU3QVgrZC9lb1BSYmZlcEg2UHpScVFFODVGdytMdWtCLzE2bnByR1hPY1RD?=
 =?utf-8?B?cmxvenU2N3Q0VG1zTE9UN3JSekpEL2pLNFJrQjAyOEhQWW9WZUdzL09hbTNL?=
 =?utf-8?B?OFRLbEs4UmVuRDZvdlZDcXlkdU9kbjdSbHJFVjNJbzV6TVJRclFDb08yL2F2?=
 =?utf-8?B?c1ZZT3dZOC93ZDk3S3I1RkM0TzV0SWtIQjFKbFJBNXo2bElveW1zT29VN0NT?=
 =?utf-8?B?aVJsRkkwZDZ5M1k4RmZneUZ6UGIwWG5TMnZqTTduRi9FTGxMKzA2d2pUMWdH?=
 =?utf-8?B?Nmk1bzhvaDVIV3pMU29xd3hIZVlheVpNd2N5VWhtMUhUMTBSQXBydkl0SXdX?=
 =?utf-8?B?ZXo0WmJoeWFZWXJQS0l2R0svS3ZXQjVYVlRQK2ZHcFl4UHBWUDZUVlRNVWQx?=
 =?utf-8?B?T0VldjV0cHhvSjBIVXhOWEQ3NDQ5WWdLMHlveGZZUXI2WGVaTWNlNHRMUU9j?=
 =?utf-8?B?RzVNdVM1clUwY2g4dENUK2hMMFNQQ0w1aHV0aUZsa0VWK3c1ck5wcU5KdFN5?=
 =?utf-8?B?OS9QUkdkcWFWSnZCcmZqTlpocWszNUVUSHA5Z0lObWc3Z0VTdHZxSFZ5SnEv?=
 =?utf-8?B?bEw0TExkMVBud3J3ZE15VkloYTNEMWwyck1oNDZIN2FRYkROK0oxc3QxbDU1?=
 =?utf-8?B?UGdLRUIxMER3MFNPbmxhVnk4ZnFrWHNHcnU1VkUwREx6Z2xxb3VIbEozcEVX?=
 =?utf-8?B?eEJMSUxaRVZqcFpoellVdlVHQmE1MTBURFo5bDZXN3B3ZHNnTW9pK3FzdGt1?=
 =?utf-8?B?WnBnR2JzcXlVajVrcDBvZ3hWdXJHaGs5akNiWnkwU2xXdWlUV2g1QlB5R1pU?=
 =?utf-8?B?VmVSN1VsWUcwWkVhM2h3WGZZaUpHcWtNNTN6Q2FRWkxPQnJuQkxuZWZrdytE?=
 =?utf-8?B?eEZtTDBId29wU0M0ZFBmWkZLUkFNNlU2MmlVb0Vtamt6bG9tSG85S1UyZ0Vn?=
 =?utf-8?B?RkYyWkxjVEFyRGJJMmRzbDhiRURQdUlOUDVHcy85ZmxCZXM3YnE2aFJERUhH?=
 =?utf-8?Q?lVoGfXrCFvG0XS9Dx2z0tAygr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6D6D319C90822428A2E71E068FA9B01@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1369cdf-2cd9-4f5d-098d-08dae29995f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 14:50:49.9575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f0VrPVCxFJoAFSZoKhYMIpTNvOUhRaF1ExDjF+V1+G4UqFcGCPdr/Tk93FDXUdKM1vMqFj/XRQt2blpbtTo/xpN5KyUTiCOCj+VDZBSyoAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6959

T24gMTkvMTIvMjAyMiAyOjQ1IHBtLCBTZXJnZXkgRHlhc2xpIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiBpbmRleCA2
YmI1YmM3Yzg0Li4yZDdjODE1ZTBhIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAu
Yw0KPiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiAgICAgICAgICByZWxvY2F0ZWQgPSB0
cnVlOw0KPiBAQCAtMTc2MiwxMSArMTc2OCw5IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3Rh
cnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApDQo+ICANCj4gICAgICBpbml0X0lSUSgpOw0KPiAg
DQo+IC0gICAgbWljcm9jb2RlX2dyYWJfbW9kdWxlKG1vZHVsZV9tYXAsIG1iaSk7DQo+IC0NCj4g
ICAgICB0aW1lcl9pbml0KCk7DQo+ICANCj4gLSAgICBlYXJseV9taWNyb2NvZGVfaW5pdCgpOw0K
PiArICAgIGVhcmx5X21pY3JvY29kZV9pbml0X2NhY2hlKG1vZHVsZV9tYXAsIG1iaSk7DQoNCm1p
Y3JvY29kZV9pbml0X2NhY2hlKG1vZHVsZV9tYXAsIG1iaSk7IC8qIE5lZWRzIHhtYWxsb2MoKSAq
Lw0KDQpDYW4gZml4IG9uIGNvbW1pdC4NCg0KfkFuZHJldw0K

