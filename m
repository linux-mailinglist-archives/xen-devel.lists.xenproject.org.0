Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2926441F5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454688.712220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VxO-0006X5-Hb; Tue, 06 Dec 2022 11:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454688.712220; Tue, 06 Dec 2022 11:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VxO-0006UW-EU; Tue, 06 Dec 2022 11:17:50 +0000
Received: by outflank-mailman (input) for mailman id 454688;
 Tue, 06 Dec 2022 11:17:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkKw=4E=citrix.com=prvs=332b12f58=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p2VxN-0006UK-3I
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:17:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b5bb8d8-7557-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 12:17:46 +0100 (CET)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2022 06:17:23 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6771.namprd03.prod.outlook.com (2603:10b6:510:122::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 11:17:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:17:21 +0000
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
X-Inumbo-ID: 9b5bb8d8-7557-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670325467;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cgZ3Dj8B35qbojfRKqT1U/D6T4YNMa0xnYNA9hGyJB8=;
  b=iY2j10zw++tPuHrUOeOv3Wgh7XDIgdKopkwiqEokHAYwbwiXAOsxZHG2
   50Jx3w8vc87QbV5IAov64Fg8mCghTH8zde5+EbDulYIsU2Ol5cgkuoBqu
   dcL+azFyqOn1zNONtBYRcBGHxL8XTQz1xDLGCY48Wxe/heoAx133APcNO
   I=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 87208391
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ecaauK3wO1nz3dyEH/bD5SVwkn2cJEfYwER7XKvMYLTBsI5bpzwOm
 mQeUGGFb/uOMTT2eot1bty39B4CvcfVzNA1SQY5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZmO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGXtM7
 qIgOTkxTDehlc6f+72ecNVSmZF2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFUZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOkAtpCT+zhnhJsqEC8l003UENRaVCYjem0lEyffPsOD
 2VBr0LCqoB3riRHVOLVUxC9oVaFuAAdQNtaF+Am6ACLxbHQ6gzfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaES0cN2oLfyIHZQoD/dj4oYs3gw7PT9BsC6q8hJv+HjSY6
 zKAoTU6hr4TpdUWzKj99lfC6xqzorDZQwhz4R/YNkq57wZRdIOjIYuy5jDmAe1oKY+YShyLu
 icCks3HtOQWV8jVzWqKXfkHG6yv67CdKjrAjFVzHp4nsTOw53qkeoMW6zZ7TKt0Dvs5lfbSS
 Be7kWtsCFV7YCPCgXNfC25pN/kX8A==
IronPort-HdrOrdr: A9a23:oFEzxKrDd4l7Ti/qZbyjagEaV5sFLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcYtKLzOWwldAS7sSorcKogeQVhEWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZe6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD69jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xig7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twriCknqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdI99WPBmcQa+d
 tVfYfhDcVtAAqnhrfizzFSKemXLzMO99G9MxM/U4KuomJrdTtCvjYlLYQk7ws9HdQGOtp5Dq
 3/Q9pVfPsldL5oUYttQOgGWse5EWrLXFbFN3+TO03uEOUdN2vKsIOf2sR82AgEQu178HIeou
 W2bLpjjx96R2v+TcmVmJFb+BHER2uwGTzr18FF/pB8/rnxXqDiPyGPQE0n15LImYRUPuTLH/
 KofJ5GCf7qKmXjXY5Pwg3lQpFXbX0TStcctNo3U0+H5sjLNorpvOrGd+u7HsunLR80HmfkRn
 cTVjn6I8tNqkitR3/jmRDUH2jgf0TulKgAZ5QyP9JjvLTlGrc8wTT9027Jl/1jAQcywpAebQ
 95PK7tlL+9qC2/4XvIhl8ZTyZgMg==
X-IronPort-AV: E=Sophos;i="5.96,222,1665460800"; 
   d="scan'208";a="87208391"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIWbDNH12tvw+LmhaRxFaXRVO8HyyGDbr/aT/re/QXZ1ccDIVmA67NV6GI93f9/TrIlHAD143spBKUmHT/xXpBBPtyvwT6xN9GfZnDQaxqHDCc1urrRk7ChVxUPndQZSng0mNVHeEonahBy34dvQHCdpO9QqJe3KYCXbr/Yec1GoqTpqj/kINmOeqrZ5sO4naAr1KNvSSr0LD53/ON7180mVExre4kXCuXuwXAWcE+cF0oEMCBmc3KNssi87Gc1jutNSZvxg2cuqGH3HO6uYt48WN1xTGEHkRLS32LEOoKD1kivEo8ILDV39BKMo0X05ITNBJc5GAkZJ0m0Yj0bjbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgZ3Dj8B35qbojfRKqT1U/D6T4YNMa0xnYNA9hGyJB8=;
 b=XzvYSPSmfKsyKpnqB3wD0mPG31LIQVWopxPTDCxAtX3bKOek/alYBYuZTByTSAkjsYwVJ6gKf+Ilnw++sfTTeMUQtzu0ImgJK7OtcNOVzyQyfpt5eFG3kVZWNLdgCwu+yqbPfFWs9dLATu4r/XmwC15nv377q1ttIxyHOpGYB1w+yQHh4Ne7XHhSBCOaPKjZNgtxmTuOuXTIfMyJa3UKKfAaheyfxZcefSXn56vwHpG0DIVCR5VsmVCbIWiBA+OpBbexpNC4IW98vuv5WUABhnGzmfQcYmkWzd61PrwrmnNixvRcOult/AvYyvW6Ox3ckTE1Ppp3/A7uF931GNpGdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgZ3Dj8B35qbojfRKqT1U/D6T4YNMa0xnYNA9hGyJB8=;
 b=ZeBfiPUvXyvIey+1CBYmNMveBCuOCPNjhsL0P5O71FEehiS9mjNignV1L6ezOVjw7IkUmhwBl/Hm2b+jzKEeEdqSLwFIbgj8C2k1OwEGty7kRSfQesEawX0x5hThPFQCbjtuH1Ouuv5E0zZxAU53Qd4zposGt7Px0NxSU3wklI0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 4/8] efi: Avoid hard-coding the various PAT constants
Thread-Topic: [PATCH 4/8] efi: Avoid hard-coding the various PAT constants
Thread-Index: AQHZCSwMd4skGdRrykKG8ZrCNpXFUa5gtkQA
Date: Tue, 6 Dec 2022 11:17:20 +0000
Message-ID: <4f34f039-b0b9-1761-b5d0-936f25e8a50a@citrix.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <ea32e526153a40837484ba9c64a7d157804b6c27.1670300446.git.demi@invisiblethingslab.com>
In-Reply-To:
 <ea32e526153a40837484ba9c64a7d157804b6c27.1670300446.git.demi@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6771:EE_
x-ms-office365-filtering-correlation-id: 39298e3f-ccb2-4d87-3f51-08dad77b7171
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 knadLWwBexsgJFLOprre/bWOL7Gbm+ggCYw4UcPxTo2jtgJcX8QAkG0Y5bscNVq8VrukqKrMkRVuGKn7kprdyOgyn3ipTAcbQMnbjNKClUNAnbZkhYw8EfxpzsB+9wyQtHrleS9aVCMtfbZkCvoiptroK8YBYOEZoU7wwOth3cnXa+3pWgSfPvQyJhLa4WZRF6YwkHBexLBR8Sic9gTQPGJAsrig2Et2n3fpXS71PQtoTjF1eWJOFagiKoO760jNNDsI1gnbd5G+qDuduQH/vlt6AmgfB4gFAvMFiZhgvl/UQTrVtcTpEc58u5jvQ4cR2X3UxVfxTZfnoJoCGL4Pq5QivZdTw9x7+fxkarZLEwLJL+ePZtCjhmSA3xYgUQbPAiaNwTSmAa8pKc9ewpbXLSk4Swb/SGF122ieSsvrP452G7CUU4cqeqA0mnB+YJ5Kdglf9qg7r9jMgxW+4T/ht/7ydq/IK5MrorNg3dZ2kEnzZMjUq1crrrSqumgaQ6tpTYAPMVuYRg+pcyATL1xRFmlaQUsXllWNXiraz1YYtkH1C0XPKCs2SYf8JTcxSsZoHS7z9dy/YfsdgvzqcLdy4+N0McFzKeiEvJs/2t+A2a3MUqw7nKTLvsXHA05IR4yXvO8BzNjtaxwnxvUBQFe1OTv/jrZ0uz+6xAHfuCAj7/Wi5KXzpt9az9cldYnrnEkkPE1TiHgRSwG0KI5kyTL8ByAjhBAHmdqcw2QrqhM4K3IToTmhLCBeV1gY9JmMqTL4zvUzBqdCyy+gOtLDNCPYRA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199015)(38070700005)(36756003)(26005)(31696002)(86362001)(6506007)(71200400001)(478600001)(6486002)(53546011)(66446008)(5660300002)(41300700001)(8676002)(6512007)(4326008)(8936002)(110136005)(2906002)(54906003)(64756008)(316002)(66946007)(66476007)(66556008)(76116006)(91956017)(83380400001)(38100700002)(186003)(122000001)(82960400001)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEFzVnFsOWppaVhlM0dDdHY0elV0ZlJQOWtzcjFtT3BNWmlMWW5JMFNOV1Er?=
 =?utf-8?B?V1pGblY5ZDBWOFNuY1BtZmkvN0N3eXJZbnhEbnFpakxEWXh2VjNRMmhjN0pu?=
 =?utf-8?B?SlpUbEMrQVM4Wk0yZ3c4eVFIcUNzWFZ0Wkh3TjB5WXRLU3NORG52NS9JSHRF?=
 =?utf-8?B?blZxZ1luY0dtV21HMWRobzZvK2tISmk0RWEzLzBCR3ZYZG9sdWZNQ2VwMlFT?=
 =?utf-8?B?Y0JUTXZHNjRDNmo0WVJCdlJZcHVKWFVjZXZjRHpYU0JUYStad0FLbFl6NUhM?=
 =?utf-8?B?ZW5BNXZhRm04d2laYmY2SVVYemhDRHZaYzJ4amh4Q2lpZ1dhMXhndlRFdTZQ?=
 =?utf-8?B?Wi91V09yYXNNUnBmbXdSZGxMaVBVL3p1NUVocXB3Y0kvZzlEUWR5SnlFUUVY?=
 =?utf-8?B?Z3JKOWwybzVrQmhidWM2ZDBWN2ZxNGNZejRod0VKbmZqZUtaWUxrWmViRTFC?=
 =?utf-8?B?eWU4djFNNU9ta3FNbjFES3ZFcVZRRlBIbTd5VjZqbm1DVXkrb2QwRzUvQnRR?=
 =?utf-8?B?dHg5Qm1POFhQSk9XK1l2VkpvWGhOQm9NT2hRSTlWRDBsOGtrRDBoVUF1dTA3?=
 =?utf-8?B?UDYzdlV3YzM5ZG96Njdna0xWWHNlamZydC9wVzJrcVk0ZjE1TUY4Q2ppK0VX?=
 =?utf-8?B?MnExRjlNWUcxYjRteTNEallLNGpXSlNzNTNZdzJXNWJtK1VvckUzallzSmZS?=
 =?utf-8?B?SHdIY0ZvVFU4UkNhWlgxdVVyVzgwbys1alNMTWdtNGc1azhHODJKaDNFcWRl?=
 =?utf-8?B?SnRVelpVd0U3MlJKMFl0WkZFb0xOcVJycWw0Y1lCOStKS1h4T2p4dHBYclZo?=
 =?utf-8?B?MmlYbVFxSThEbEY2ald3QzNxdzlKd2JDZDlSMDFhNlVHMTJTeXRlbElOKzJI?=
 =?utf-8?B?ZEhjUjErZG1oWjVBNG04YUZ4TEsxOGVLZUVSbmIwd3dlNk5LNlAwakt6TVk3?=
 =?utf-8?B?dS9NaE85TU90aCtTNWJyZFBtZW00U1RHK1FTZnk0RGZBNEpUQjEzWGZoTlVn?=
 =?utf-8?B?MjZvR2tHN0hicWt1anljM0pZQmp3K1VLVU5kNTNaR2FJZzYzeEtaTUROZGhV?=
 =?utf-8?B?L0lXaURrS3MvMERGSzJoa244UkNaSlBGYkZwdE4wdUozU0RIRURnQ1lGTXZ4?=
 =?utf-8?B?d1RMZGh2RnlvdmtqOHVsZ1Q2SHVYaTZLMDBtRkZLTmtKMTVMUS9JaHh1aDdv?=
 =?utf-8?B?c09lL29uMHZjbkJsRk84VXlYMVZjZXJQRmVINGZaRjBGYzlCVjUxWHUyN3pT?=
 =?utf-8?B?OXJzNEJxYmViSWI4ckxrYytCQWtJWk40ZG43bm5pdjRKUnh2ajFESnFrbnRF?=
 =?utf-8?B?MlpzeW1RenR0UkRYN3AreDFuQjJ0ZGFFWUhyTkFOZGtpa21HdHFSQnU5M05h?=
 =?utf-8?B?UzVueDc1MEo0UXpaMmtYMmlsMEJDdHFhZExRZ1R4Q1FCOWhaU0tRYW0zRlNs?=
 =?utf-8?B?bUJ5YmdUcVZvQTB3c2Fvdmhrd2NEVFRkckYvKzZGdlBMNzQ3ZXYrdmFTVFd5?=
 =?utf-8?B?d0RNR1pZYzl6TGVEQXFvcjhnU1Q5THFvSG03STlKQ291N0xoSWJpMzA1N1J4?=
 =?utf-8?B?S2N6MWMvTTBKOUFtSmVNUWplWWEydXJPcDlMaTlobEQ4VDAxTEJMYWxIMlRj?=
 =?utf-8?B?VGFGK2lrZ0xqMEZLVjZhQzB2RERBd3BnNzEvT3F3WFJlVzhPcnVmYnFIbVc0?=
 =?utf-8?B?Z1RxbUtOK1hHVHNHdHYyZVVaQld5b0dnZDZ0MGhUVFBOZkUvME1ZK2F5bytG?=
 =?utf-8?B?eThLdW1iK3lic1FsYlpMKzhGL01Ic3h1ZFNab1pzNGRKOUNQZnRLQ3JnUTZn?=
 =?utf-8?B?Q0J2UUxRUFkxNExUbXdJRVdNMmt6WjFWdXh5S05xREpaeW1hK0FIR0R2cUNq?=
 =?utf-8?B?cXVucWZVcW9iV1dwVnJ3dzFHZ1h0TDQ2NzhCOENkYndtZXFOQTFhZmcyMDBT?=
 =?utf-8?B?dWFGQVZvRUNxTU5HNDRndU5tNlhsdjA1Z1lQZ1pxRGlCTnF2V3h4ZERYRmlR?=
 =?utf-8?B?bjYrdjJrbWRaa0REVWRicDNMR1gwTUhwYTMwa0FmYjNvd3FXa295Y0JiWkkx?=
 =?utf-8?B?djI5cGU5Q0gzZUgzL2pKeWJFQ2YyaXdpbWJkWEMxRHJsQlB2cVM2WWtVcUdT?=
 =?utf-8?Q?6tD0044DkvIEZ0Wv1pkN+eEJy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BCF88AB47A5B84CAC34706378998F90@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?LzlDQUI1SlRnWVdYVGxSNkZkOVB1VExQYm1FOTFXV3BSYXgvR1F5RHcrMDcw?=
 =?utf-8?B?RXF1VlF5eUE3UlhIS1U2aGx1YzlFNzAzY0F2OHY0Mlk2TnRJWGFkRmx4NTRn?=
 =?utf-8?B?Uzl0QzArR3Q0RC9ucTUwT2JlalA2U1FhL1IrY2J5UUsxTUhBWThCSGVORFl4?=
 =?utf-8?B?L3VraGZTS0l3TWdreEZkeC9GK0VSalh6ZldGVC9QMjJNM0xNekZkU0ptZTk1?=
 =?utf-8?B?Z3l2M3I2emo0OFAzRkxTYW1peGxqRitFTGJtTUxEeHlrdWl5U0lRNFR1SkZ2?=
 =?utf-8?B?bHJocHYxQTl5Z1RqNkdPNlV3TDJBUFdKd3plY1MzVitPVy94bUpGN1FjQW5z?=
 =?utf-8?B?eVVWZ2tVM3orREY2MG8xekJFSDJQOE0xbkF6bzVteFZKc0xHM3YydzRiVWZz?=
 =?utf-8?B?aW5VTXB5NmlkQ3NGRjFJdk05RjhNclV4dzlrbXlPYjgyMmRBV0Vra1RtMW1i?=
 =?utf-8?B?NjF1MW1uOGdCNERKYS9ZRFJVc29YZFU2YVVhMmxNRy80bHUzeGVraEtvUWhU?=
 =?utf-8?B?ZDlSaGl1dlNHNi9mbDFqRjRrR2IvekNvVXdQdGhKRGtaSW9FOWRpV0E1dFdr?=
 =?utf-8?B?aXZ0U3R2UWRjMFQyK3dFRDBlamdxQnU1WS9nZVgrY0FvdzBQN3dpZEJKazly?=
 =?utf-8?B?Sk4zS2ozK2NDWWZlU243T1RycXZ0YjM1cm9DenJxRDR6YW5QMzFscXdvbWlq?=
 =?utf-8?B?T0gvWUo3TjJudkltODRTVTlWYTd2Q2VYcmMzYkZBNEU0eUw1NjJHdnYrd3RP?=
 =?utf-8?B?SjRtZ1g0V2V0bzVjek0xYjZEZEtqQk14Z1dTc1dLNmRleUlRSlBNQmxHZG8z?=
 =?utf-8?B?SGVuN0RDNEl1cXViOXRuWGErMEt1Wmc3WXJTS3puVUQ2b00vRnErMmlmZmgz?=
 =?utf-8?B?M2NrZVc2ZnU2MVNpcUJtbVNiQWxwelJrWVJmZVFTdFFPdTBOYjZySFRWMFVN?=
 =?utf-8?B?MFcyV2E4cFFVQURtVU9TNXFlbVQvRDZmOEJKQUVJK2d1dVdqMUdteUdZMFhK?=
 =?utf-8?B?TjRXTWE4d3d3dDRqZU02SmthQTdOaEdSUWdOSnhQSFBGazRMU3ZzcWNUSGFu?=
 =?utf-8?B?b0VJSHR4dk93MlJyZUYxT3V4cVR0aW05UktLSUljTCs3SXJPclJUQTNIWXo3?=
 =?utf-8?B?K0Z2dEcwWmUrSS9ONlBtU3Y4WGdINU1ROGVHeW5TYVliWmNUSEZ2T0FWeVht?=
 =?utf-8?B?Z3kvQVRHdGVtRGtlT0dtS3VKOUs4dlEvSW9xWFdZZTd0bDY2ZFNmQ0pMMVhl?=
 =?utf-8?B?MmErWi9NeW14ODhvZTV3MjhIUW5TdDFlbCtZb3hDb0hnVFZrZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39298e3f-ccb2-4d87-3f51-08dad77b7171
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 11:17:20.9917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tNFhyHnEBAPNY6/N62wS+JGmtYEJ7j6NbdwXgEQzYFLcTjgJ+x6V1De5oFoJERM3kuWiPJ6Ew8WfH7ydm2EpVg6VnJY7dvFjZcUF+kJU6ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6771

T24gMDYvMTIvMjAyMiAwNDozMywgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPiBUaGlzIG1h
a2VzIHRoZSBjb2RlIG11Y2ggZWFzaWVyIHRvIHVuZGVyc3RhbmQsIGFuZCBhdm9pZHMgcHJvYmxl
bXMgaWYNCj4gWGVuJ3MgUEFUIGV2ZXIgY2hhbmdlcyBpbiB0aGUgZnV0dXJlLg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBEZW1pIE1hcmllIE9iZW5vdXIgPGRlbWlAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4NCj4gLS0tDQo+ICB4ZW4vY29tbW9uL2VmaS9ib290LmMgfCAxMCArKysrKy0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9lZmkvYm9vdC5jIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jDQo+
IGluZGV4IDhlODgwZmUzMGM3NTQxYTIwMmRlYzNlNjY1MzAwZDY1NDk5NTNhYTMuLjI2MDk5N2Iy
NTFiMDlkYWU0YjQ4YzFiMWRiNjY1Nzc4ZTAyZDc2MGEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21t
b24vZWZpL2Jvb3QuYw0KPiArKysgYi94ZW4vY29tbW9uL2VmaS9ib290LmMNCj4gQEAgLTE3NDYs
MjEgKzE3NDYsMjEgQEAgdm9pZCBfX2luaXQgZWZpX2luaXRfbWVtb3J5KHZvaWQpDQo+ICAgICAg
ICAgIGlmICggZGVzYy0+QXR0cmlidXRlICYgRUZJX01FTU9SWV9XQiApDQo+ICAgICAgICAgICAg
ICAvKiBub3RoaW5nICovOw0KDQpUaGlzIGlzIGFuIGltcGxpY2l0IDAgY2FzZSB3aGljaCB3YW50
cyBjaGFuZ2luZyB0byBfUEFHRV9XQi4NCg0KPiAgICAgICAgICBlbHNlIGlmICggZGVzYy0+QXR0
cmlidXRlICYgRUZJX01FTU9SWV9XVCApDQo+IC0gICAgICAgICAgICBwcm90IHw9IF9QQUdFX1BX
VCB8IE1BUF9TTUFMTF9QQUdFUzsNCj4gKyAgICAgICAgICAgIHByb3QgfD0gX1BBR0VfV1QgfCBN
QVBfU01BTExfUEFHRVM7DQo+ICAgICAgICAgIGVsc2UgaWYgKCBkZXNjLT5BdHRyaWJ1dGUgJiBF
RklfTUVNT1JZX1dDICkNCj4gLSAgICAgICAgICAgIHByb3QgfD0gX1BBR0VfUEFUIHwgTUFQX1NN
QUxMX1BBR0VTOw0KPiArICAgICAgICAgICAgcHJvdCB8PSBfUEFHRV9XQyB8IE1BUF9TTUFMTF9Q
QUdFUzsNCj4gICAgICAgICAgZWxzZSBpZiAoIGRlc2MtPkF0dHJpYnV0ZSAmIChFRklfTUVNT1JZ
X1VDIHwgRUZJX01FTU9SWV9VQ0UpICkNCj4gLSAgICAgICAgICAgIHByb3QgfD0gX1BBR0VfUFdU
IHwgX1BBR0VfUENEIHwgTUFQX1NNQUxMX1BBR0VTOw0KPiArICAgICAgICAgICAgcHJvdCB8PSBf
UEFHRV9VQyB8IE1BUF9TTUFMTF9QQUdFUzsNCj4gICAgICAgICAgZWxzZSBpZiAoIGVmaV9ic19y
ZXZpc2lvbiA+PSBFRklfUkVWSVNJT04oMiwgNSkgJiYNCj4gICAgICAgICAgICAgICAgICAgIChk
ZXNjLT5BdHRyaWJ1dGUgJiBFRklfTUVNT1JZX1dQKSApDQo+IC0gICAgICAgICAgICBwcm90IHw9
IF9QQUdFX1BBVCB8IF9QQUdFX1BXVCB8IE1BUF9TTUFMTF9QQUdFUzsNCj4gKyAgICAgICAgICAg
IHByb3QgfD0gX1BBR0VfV1AgfCBNQVBfU01BTExfUEFHRVM7DQoNClVucmVsYXRlZCB0byB0aGUg
dHJhbnNmb3JtYXRpb24uIEknbSB1bmNvbnZpbmNlZCBhYm91dCB0aGUgY29ycmVjdG5lc3MNCm9m
IHVzaW5nIE1BUF9TTUFMTF9QQUdFUyBoZXJlLsKgIFRoZXJlJ3Mgbm90aGluZyB3cm9uZyB3aXRo
IGxhcmdlIHBhZ2VzDQpvZiByZWR1Y2VkIGNhY2hlLWFiaWxpdHksIGFuZCB0aGUgZnJhbWVidWZm
ZXIgaXMgZ29pbmcgdG8gbGl2ZSBpbiBvbmUgb2YNCnRoZXNlIHJlZ2lvbnMsIHByb2JhYmx5IGEg
V0Mgb25lLi4uDQoNCn5BbmRyZXcNCg0KPiAgICAgICAgICBlbHNlDQo+ICAgICAgICAgIHsNCj4g
ICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJVbmtub3duIGNhY2hhYmlsaXR5IGZvciBN
Rk5zICUjbHgtJSNseCVzXG4iLA0KPiAgICAgICAgICAgICAgICAgICAgIHNtZm4sIGVtZm4gLSAx
LCBlZmlfbWFwX3VjID8gIiwgYXNzdW1pbmcgVUMiIDogIiIpOw0KPiAgICAgICAgICAgICAgaWYg
KCAhZWZpX21hcF91YyApDQo+ICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+IC0gICAgICAg
ICAgICBwcm90IHw9IF9QQUdFX1BXVCB8IF9QQUdFX1BDRCB8IE1BUF9TTUFMTF9QQUdFUzsNCj4g
KyAgICAgICAgICAgIHByb3QgfD0gX1BBR0VfVUMgfCBNQVBfU01BTExfUEFHRVM7DQo+ICAgICAg
ICAgIH0NCj4gIA0KPiAgICAgICAgICBpZiAoIGRlc2MtPkF0dHJpYnV0ZSAmIChlZmlfYnNfcmV2
aXNpb24gPCBFRklfUkVWSVNJT04oMiwgNSkNCg0K

