Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD13545158
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 17:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345618.571295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzKUs-0001v4-Qf; Thu, 09 Jun 2022 15:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345618.571295; Thu, 09 Jun 2022 15:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzKUs-0001rc-Mu; Thu, 09 Jun 2022 15:54:58 +0000
Received: by outflank-mailman (input) for mailman id 345618;
 Thu, 09 Jun 2022 15:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+nUK=WQ=citrix.com=prvs=15254dc06=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nzKUr-0001rU-QH
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 15:54:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81539779-e80c-11ec-8b38-e96605d6a9a5;
 Thu, 09 Jun 2022 17:54:56 +0200 (CEST)
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 11:54:52 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5378.namprd03.prod.outlook.com (2603:10b6:208:292::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 15:54:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 15:54:51 +0000
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
X-Inumbo-ID: 81539779-e80c-11ec-8b38-e96605d6a9a5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654790096;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=s9B+x4Z6kIOoktUzU9vABSgWTXldow1jlOmtPjlQxE4=;
  b=PqBjcPrgbZnHsXVNOvTSQMLj/aqn+SwisZPnIt47BV/lIB9TekgVzbgY
   8z1unZdv80oJMXWJplhe2PVlesidshMZ9yGeDpjB8v8ZNEzvKY9QA/p3r
   sdLVdv5YssxesgfgGbDzHafybXYi+a/52iZ4ccQPtW/6LEvRKM4EKlxUq
   o=;
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 73093469
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OT0/U6lhxw8C4YUJsIZXnCjo5gzyJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfDzyOM6mINGL2L9AjO4/n8EkHvsSDyIJgHlBrqS8yFyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DnW1PV4
 rsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYRTkbJLTCk80hfhx5Gh9aMK1eyLPEPi3q2SCT5xWun3rE5dxLVB1zGLJCv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOVvpkBgmdYasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfVsuzmIkFIguFTrGOaKff60etpQpHeFp
 z7552HGHA4aEuXKnFJp9Vrp3IcjhxjTWogfCbm5/f5Cm0CIyyoYDxh+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasoRo0S9dWVeog52mwJrH85g+YAi0BUWRHYdl+6MsuH2V0h
 hmOgs/jAiFpvPuNU3WB+7yIrDS0fy8IMWsFYixCRgwAizX+nLwOYtv0Zo4LOMaIYhfdQlkcH
 xjiQPACuogu
IronPort-HdrOrdr: A9a23:eGR2caCj8fCKB67lHej1sseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuaKdkrNhR4tKOzOW91dATbsSoLcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUeF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZER4Z
 /xSiIbToFOArXqDziISFXWqlHdOX0VmgLfIBej8AfeSIrCNXMH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59as5Vza/ppVFZql/1XwKqVKuZzIAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkdoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWtKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEniefvFmHKc7hiwlbF/NLQgFkPsulqSRkoeMN4bDIGmEVE0kldemrrEWHtDbMs
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.91,287,1647316800"; 
   d="scan'208";a="73093469"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ag5R31BIzt7xuYY1b4DhteLaQuhlxVPPlW82HRH4jtw+Q/Kv5XXKrhhfAxSX+qAi6L7RzLwhduHWFQy9MWfX8cCmMuwfpg5SZja1mhKnZPSQqy4Z1itnyHtVh/aRkE3wgLPL18S0tUudkQ/l44fp86tG2xO8uAFKDxBi1Hmz1mxriAl4om+82wd0eibk3fV5clsPU2RqWssa/aiEffhzCzg8l0+CkpiH7ORfGiHF0FiQN4jaEAtiVQAEO/2NrbgOg2nVd6kWXpZbxKrWX3AtPhouTWLgdIRPEOQZwR9SsFofn4AewmjqPlAS13Wi98tUd9WbFhTnNd/nm/lmsMHgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9B+x4Z6kIOoktUzU9vABSgWTXldow1jlOmtPjlQxE4=;
 b=Q8W5fQdCJWeQ7sI0Az+DBcaCiqjcH6mBz0BuvPCjZpMYgF9NRPlyEDjh7I5zdXXXh0d0UUbuNiVgm50WQAsSXmf8MVYzvTG/+gAD/ZqIxQdQjTkpNQoFaAn401u/rzJc2ILSAxLI6VzGMYcqxpor4AVr9v9zld8LFgwQrkg5BknM2tCDa+8SCm9dKO9d1F4tBwVRoxT1ISCM48rIJDiE7IHSBwbg5Ixb6cFuwoTVQ7tOct/b7+BrpWaU9UrrLVzDDPlxWBVV2V4vs+ZkJQLJkImCKSCOX/TvGP/DjhSeWtLQ+i1h1iA5mXn6D9l0pDZwCmcLlh7TsHqVL7G+zI63Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9B+x4Z6kIOoktUzU9vABSgWTXldow1jlOmtPjlQxE4=;
 b=KIkjCSnsg4g671LHWY0kaSrw7ig8DDFk7U90mEEDCOKnVaJ9Ibt1hV8r2jG3+/s3y/MzTRqSa3oAPOJNCAozTwjNEgZitbW8vqAfAQzuXFXDJl/Sm/xDBfYoB6Gz/RBGIHP8E6B5tfGcOcSfRpXwMW335E3YL3B7OPokcDCWIX8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86emul/test: encourage compiler to use more embedded
 broadcast
Thread-Topic: [PATCH v2] x86emul/test: encourage compiler to use more embedded
 broadcast
Thread-Index: AQHYfBai5wHQ+WsWjkyECYCA9O3V9a1HOlMA
Date: Thu, 9 Jun 2022 15:54:51 +0000
Message-ID: <ff5a8ac7-95d4-be81-6434-5020a54ef727@citrix.com>
References: <e90402d6-0ea9-b977-1c1f-b3ace4e8f107@suse.com>
In-Reply-To: <e90402d6-0ea9-b977-1c1f-b3ace4e8f107@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dac800c8-acc2-4acc-9f3c-08da4a306344
x-ms-traffictypediagnostic: BLAPR03MB5378:EE_
x-microsoft-antispam-prvs:
 <BLAPR03MB5378D0ABBB5576CB51D33D83BAA79@BLAPR03MB5378.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xYYUazUL6pD4O7d5SLBKBmv4NGB04l3ZfzTqXKMFN82dXKMer3fCfe0mNYKFmxpHKXqeEM/vD/1sZe/Pmn7Ww18RsQgK1Gcye6yJ4GMK0Php1BiKkQuYAVlzFsc2cOWnJfVzfwCDeGqzNrc5Zym0gsNjgQ7jo84P+YAIk5ciJpcITk7/MzZcNSlYyEGqtZGMNVDGhYH173P6NTXI8y5Y/vafPrgDgQGVwQRuur3hgRnjHWYsxriinAN5bx5E7z58A4EqQbhTCEGksP5mvvNWp3AWdPzCs0u7P6AopcJkr+YuhhPYvvckIkt6KtyaZIhNFBazdIx/DR6x0HJkvd9tu7fvwX/X08TX/ckhRV7+LGBfq/gvQ0J8xj5PqYvsfRf0WKjkD67yKNH3iIGwaulB1wDGgLR6ImJczwUbYMEj6be3i72pg5N8uO3AtIgFAIBh88TJoUJt1XJA+tCNxwylH25Vg4UK9a80p4XEhSyLczdWRHc2zK3i8+lqJWpljaFpexDXbpK9hYOQR+atqFC+RNkMKNmYaLmVUXtiwvLP3H7P6uCyccwsEAIHE5yo1KdQea4WG/neDC18gd9lKu74SDMhGizMBLkKquM7c9rLqQGPSZby1nBvzjlxBJlfwfTgvAyGtC4SpUPVrsS2ymNeo0M/9FzU4iKsD0YTn1YFaTuSZ3F/pBGfgk3oQQd39WrqiIliSZmB3bpeH++QBxPtHxIzfduH8REGra6mYieSbTFQ5CanzQPD/rzhY6oL/QAK0jEvZ4r57qTKki2nKA1+Lw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(66946007)(2616005)(31686004)(38100700002)(26005)(6512007)(66556008)(36756003)(2906002)(53546011)(6506007)(122000001)(8936002)(66446008)(508600001)(86362001)(110136005)(4744005)(71200400001)(91956017)(82960400001)(6486002)(31696002)(316002)(54906003)(5660300002)(107886003)(8676002)(4326008)(64756008)(38070700005)(66476007)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHA4bG85SmJFVG9sQmhFZk5lOG0vRmZZaE93R2l3djZQdnZMeHRqQnBYZmNi?=
 =?utf-8?B?aXZLVHVsc25ZbFQ1L3krQld0VHkvTDZ4NkFjQ2c2dWwxWjVrUFprS0J3QzAy?=
 =?utf-8?B?bis5a1UrSHV6RHdjLy9hSU1Xd3E3RmNpWE5tSnhDNHc0bWVON3ZuNkRZS0RI?=
 =?utf-8?B?K0duM1BBVHFqODJ1Vmw5eVdSM2NzcjM5ZDlCSFdDK0M0TWIyRURkT0ZjWmNq?=
 =?utf-8?B?M2REcE1wRDEvejdaSnJ0b0UrQWFBMGRuSUdGUS9GMjcxT01rcXpMLzN4eGJp?=
 =?utf-8?B?Y293VFM2Z1o5V084bHViSnZKdGN0RVNVZnZ6NG5ab2JRTU1CenRUcmUwcG40?=
 =?utf-8?B?YWlvcTZhMVAzOXFQSmJ3ejFKWTlLSXFNelBMVnJ3SVJyTUNTTEplZ0Jiajg2?=
 =?utf-8?B?dGpYRG1Tbm1mMXNpTG95SGdDcVUyQ3BKUnZRSUJTOCtudEpMdFhJaUhJZE96?=
 =?utf-8?B?UDBvKzVRMmhaVVZYQkk4SVVmb1hTeWF1a3NWRUZqMjdOMzFrLzFvTTdWV3dT?=
 =?utf-8?B?R0hpaEZtYVFnakVFQ1V3d3FjeFFxMnplcVJhczlVcFVjRmRQaUJCTHFuSURo?=
 =?utf-8?B?SG5XRkYxY3dLK252WEJsYVpWOWNwaGJ5WU94Y21ORUNwMDNwY2VTV0lqY3F6?=
 =?utf-8?B?V1UvNWRkTktjWGRtMUFWaWIwTDZCQUJ5b2hZZVJwc3d0ZnpQeVlmZ1crQWpt?=
 =?utf-8?B?Q0paQWZ1T09lZWZxNi9kKy9XVlFWZUxaSmVaUnRhamNlcVVJYjk4K3hPeXRY?=
 =?utf-8?B?MVhKRXJvaUlvRENhc3dLT1dtT3JIaFl4WEcxYXVSeXBnKzZnbTNXaGhlMkNS?=
 =?utf-8?B?Zml4N2xHdUlFcU9jRHpUU0N6UlNqTnNnaS9Pc2RieDFUajZ4aEExZ01VSlhv?=
 =?utf-8?B?ZTFDN00rOG1iSTY5RFBJZ3FBT0c5T3dhakp0OElrY3NoTlFLUXpNOUQveGU3?=
 =?utf-8?B?ekVFRGV6a0xLRWhPWDcwZUxGN3lQWEtTMzg0RXN4b2h1Y0dNbTNLaDdQSWk4?=
 =?utf-8?B?SlZhSUhtNDRTY0VuTXozbVVFWVl2ZFB2TitYUlJMQ2ZTMzMvRG1wWXRnaHA3?=
 =?utf-8?B?V0ozSElvbUpPNStHV3ViSHpVSi9mTUJRMHNFRkVsVmNmZGRjOW1sYmFOWGl4?=
 =?utf-8?B?N2Z0NVN2MWxoa09UVXQ5dnRvQU9CTWVTbEpBOGJKa1pJZzFWTmFOT2lycTE0?=
 =?utf-8?B?eXdPVE5yRXpMSm9WeEw5Y2pkS0xnV3JvbkpPRHJEQXRGblkvb1dqeXZZTDR2?=
 =?utf-8?B?SzhXdWo1YURYeHNzd2lnajdyYUVqKzZ1bE9YSWFaaXJLeHNqcFpiQVJrRGVZ?=
 =?utf-8?B?RmxWUHZVdWZIU0xtNkdaVjk0amcrYkJWTGp0SmdJQ2l1SUVoMzFNZEF2V2RO?=
 =?utf-8?B?MzNIRS9HWVBFcUZtc2NRTGNLSURWSzNrZVBUOWtCT0hZNW9oL0krTjBPSlRO?=
 =?utf-8?B?K2l2bTBRZHRZYU9EZ0F4MEpkWHhyNDdkb0VBRVFMM0hkMXVlMkZlWHduaENa?=
 =?utf-8?B?Wkp0VVBydVZ5Tkdxb0ZiV3Zlc015VVVvVnJIL1pLOWtTQXBrWWdpM3Zna09M?=
 =?utf-8?B?a0hJcDV5R1g2cCt4bVZPZXYrOTZ2K0tEUDN6ZXdIeTR2NEZ1RXFybDk0cnFP?=
 =?utf-8?B?dkplR010dFZWeEwzMmdObXdnZGNVOWtLdFlkZnRYZjRHdjZyUWVYS0ZjOUVK?=
 =?utf-8?B?VFBScUNJVVdDeEJ4MU1hY3Boak50aTZIWG9COGs1MVhXMENiVTRSdmVjOG5I?=
 =?utf-8?B?OGhzVmZWdTJ6T3l0N3BnT050eEtwcG9kSG1jU3N2MU5qblp1TXBGdnMrUFp3?=
 =?utf-8?B?RXRMSng1T3FUN0xScXlCNklPSDNqQ1owbGwwUFFCK2tENDRMRCtOSEJKL1lV?=
 =?utf-8?B?VEFSMFRuY3ZxSVJhTlFsajE1dzRUYnNYMExUc25OaTdTeVpUYm5zeWpXckFu?=
 =?utf-8?B?NU83YW9ERmlZTlN2WEx5bW1ib1p2dlhKb0YxSW9mdGFhS0Y1YUU2UUdxdmNF?=
 =?utf-8?B?OFdkeGEreEdVY3BsV3h0VWYrOTlWdzArUUQ2RDFhYU1ORXBZWTdNNVFMVGF2?=
 =?utf-8?B?V1NFd3RQSXc2NWF2WVFmY0tlTEVjMXIxWVY4S01Pa0VBem1ZR0F3QUhUVVR5?=
 =?utf-8?B?ZnhiWld0SkVaRXVldzVsci94NVpNL1BFMkcwUVA1MXBsbW1CbFZOSnYvWkZh?=
 =?utf-8?B?VW9peEhKelhzekErallRUHR4TzhRREhRaktMcHgyb1dWRzNqbDB5aEhYMVV5?=
 =?utf-8?B?Y1BvdDJqbS9Ub3lxdTlNVXVXQzYzVk1uaVFEYU84dk9BMCtQNllUcmZIOUpN?=
 =?utf-8?B?T1RMTlpVakpBb2xsWldiTStWME9BNUEzcFBLUmhCdE1tekFkMUU1N2J2cEZP?=
 =?utf-8?Q?wWNk+07hevlM0eGQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98129FDA27D4A44997935774B0CB295C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac800c8-acc2-4acc-9f3c-08da4a306344
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 15:54:51.0517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wfx//4ndAcMIbNf5Y87eDwppHKJ0NyDsZ7KAHE6sLIjTTYEjbWfomV5YWXG74HR0F5rno+7LmabnpH/KQEx2q19Qs40KfdYkf+Eyfo+xVzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5378

T24gMDkvMDYvMjAyMiAxNjozNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEZvciBvbmUgaXQgd2Fz
IGFuIG92ZXJzaWdodCB0byBsZWF2ZSBkdXBfe2hpLGxvfSgpIHVuZGVmaW5lZCBmb3IgNTEyLWJp
dA0KPiB2ZWN0b3Igc2l6ZS4gQW5kIHRoZW4gaW4gRk1BIHRlc3Rpbmcgd2UgY2FuIGFsc28gYXJy
YW5nZSBmb3IgdGhlDQo+IGNvbXBpbGVyIHRvIChob3BlZnVsbHkpIHJlY29nbml6ZSBicm9hZGNh
c3RpbmcgcG90ZW50aWFsLiBQbHVzIHdlIGNhbg0KPiByZXBsYWNlIHRoZSBicm9hZGNhc3QoMSkg
dXNlIGluIHRoZSBhZGRzdWIoKSBzdXJyb2dhdGUgd2l0aCBpbmxpbmUNCj4gYXNzZW1ibHkgZXhw
bGljaXRseSB1c2luZyBlbWJlZGRlZCBicm9hZGNhc3QgKGV2ZW4gZ2NjMTIgc3RpbGwgZG9lc24n
dA0KPiBzdXBwb3J0IGJyb2FkY2FzdCBmb3IgYW55IG9mIHRoZSBhZGRzdWIvc3ViYWRkIGJ1aWx0
aW5zKS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4N
Cg==

