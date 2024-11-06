Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380F79BE8C0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:27:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830870.1245962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8f7o-0003Ov-4x; Wed, 06 Nov 2024 12:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830870.1245962; Wed, 06 Nov 2024 12:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8f7o-0003Mk-1e; Wed, 06 Nov 2024 12:27:04 +0000
Received: by outflank-mailman (input) for mailman id 830870;
 Wed, 06 Nov 2024 12:27:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lQG8=SB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1t8f7m-0003Mc-D4
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:27:02 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20620.outbound.protection.outlook.com
 [2a01:111:f403:2608::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b0dc656-9c3a-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 13:26:59 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9787.eurprd03.prod.outlook.com
 (2603:10a6:102:2e0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 12:26:55 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 12:26:55 +0000
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
X-Inumbo-ID: 6b0dc656-9c3a-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwODo6NjIwIiwiaGVsbyI6IkVVUjAyLURCNS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjZiMGRjNjU2LTljM2EtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk2MDE5LjUwMjE0Mywic2VuZGVyIjoibXlreXRhX3BvdHVyYWlAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgWdCKOZUYQeciKGMhAP9sh043Y4sUzzXD2sUTUDcjJN01kS/K8R5xrC2WsbMktWSGwnveO3sIu10NHPi/T/z3I0dwQ6F4VfwQajSd91DqUuzGQuoX1u2wmqJoT72kNRmhxGCqW0LBfOXGqanvSU+mijBZGcKaaVJ/e4UnCADaD1KQGPzl+kH2IJCUQ3zNhRO1LEOZoPv2nOd3vB5zaX/aIpX3gyWhNwkxLULtvZgbAS0hOC0BsSWJuTl5/TVyXKaPiuM7Le0+bJ8QrAIFPDIqPw+fS4xB0ptjwf3u3p6N99fKBz6IL2BNDZCI+K0DFiUNFiu+JO/SfRNntSEaUp3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqGMfKXQm0rTh++zwIjh7vpRxxaU+KD1aOJ3YCb+cc8=;
 b=BmO8R9W0DWPLR/uWwXDIKG6KlpQnj75T7HDUWIksiRWyH/W0WX26xtUkDAdfn9IdwxF9vJAKjOi1g0EGHQtku8ZQ/jcEKv7WbHjNzgmi82GkkwyCFOYhFH4WFqwTk7BHlgYyo6MQHoVXeZvIT3pZgIqncar+eBjzkgV8spgsH4t0vuSLULMtlN//5AMpTP789QoqhJxEGdhU+/afQvqkZHhyiTh+JXu7NOIbEKQ4oHhLMqt+kXM35AmGyYScXC6yVJWfIhPaHLjgZtxEC5vX11rqtqyHwb/89H4HDIyCsGO58i9e0oepQupB3TMlSdD5Acp2Jqlc1k68mJ4KVXsY7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqGMfKXQm0rTh++zwIjh7vpRxxaU+KD1aOJ3YCb+cc8=;
 b=qPfXSDK94WXjakfsy1cFdBKePE+OaCYkh+0OF8JRytvpiFzayJQyoMD6CmlLLr2olULt27iPCJEuB0Uuwt32AA4Yv/RBPtxUi/up/0TDTdrIaiNbX9gXgNN0FfZKWSPha2VIcwNK6Sv0ma1XzIhDAlfRu2SR9VYbdYYcYPVun7hOfm3fKtoYCZVZate+T4RPtFmbBmp+18CSCiYq0MfdkpOyaXJtylHNgFSbWAzyWTBtQABbEJAnMJ88yf6dCf33JvVUDmto1Ug4HANdB/pxLPU6czXQ/nyyyS4wVeJaldtiKumAmLiZQ0b//ZtquIo+zmYgFtETBr/rd9Dh/KYgCg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
Thread-Topic: [XEN PATCH] xen/vpci: Fix UB in mask_write
Thread-Index: AQHbMCKf4QVge+H9k02dX4ZlwzpGqLKp9EiAgAACIoCAAChLAIAAD1kA
Date: Wed, 6 Nov 2024 12:26:55 +0000
Message-ID: <65d2043f-5e6f-4d84-8241-eb28dd94fc45@epam.com>
References:
 <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
 <ZyswF4grJSNcVqY_@macbook> <Zysx4ZwCUv62uTBw@macbook>
 <6d3f322f-7047-4033-95b5-86751a58cc70@suse.com>
In-Reply-To: <6d3f322f-7047-4033-95b5-86751a58cc70@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9787:EE_
x-ms-office365-filtering-correlation-id: b90f2e59-6421-4d58-a61e-08dcfe5e4d16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eE14TUplZ1g1UHBWaVRPY3hJRTNudVhSeXltWXFsbW93QUJhSkdlLzZlUGZw?=
 =?utf-8?B?T0hFUGhyNUJNSEc1ZVNTbzRwVVc2Z24zVjFIUlM1NXo2bkdIM0x0d2p0QU10?=
 =?utf-8?B?Zm1CblhkMndyb3lUQ0NGMXFaZWpJZWM0Q2kybXVhTStXWm1pV0NwdXM0UTN4?=
 =?utf-8?B?T0JyMStnQ2I4M3NLM0pzOTk2azIvSTlwazVwMkQ1UE5mK1FCcUtMb0R1bXFn?=
 =?utf-8?B?QzR1cmtaZjJCakFlRXJuZVFEQTFQNUJpRGk1a0I1dWhzODZibytRWnd0TG1Z?=
 =?utf-8?B?SDVtZUcxVnlHRm0xdFlZZlptS3FQVUNBNWlYSmZLdWRTeWQvczF0SHloa2Yr?=
 =?utf-8?B?aGVzcVFZbGhmS1pMeXlKejB4Sm9lOWdrdE9oTEJGNGo4L2FiMHJqQ3c5bEVR?=
 =?utf-8?B?Ym14c2dZQmFZcmJpQUtKUDVCY0ZTditFOThrUUFrWXZpRTZSRzlsaENqSTZY?=
 =?utf-8?B?U1RRcUMydGFiMVF4V0NUNGJZdmdwOG5XbjRlSWRwL1pMMytsNHZ5UXRvQzBX?=
 =?utf-8?B?QUV4NEdMWXJoZDhuRVdadHAycTVsaU1yVitmV0dGSmhRWXdVNGhub3FtS3Vq?=
 =?utf-8?B?MzUzTG5rQlZYaWxwRldFWUNnOGdLcXZELzlOdkg3UFcwZTVtWW5Yc2RyZk04?=
 =?utf-8?B?NjNkV0p1eml4MEhhWHh4T0pCa0RySENCand1ZkpNZWpvRVZmcVRTcmRoUzd6?=
 =?utf-8?B?SUtFSmxCcDZta0pyK1VnK3pCZ0hOS2VwZTljdVZlcnd5bTBCR0ltNkFNOE1v?=
 =?utf-8?B?aXhFVzZSb0dScFNSQmZXNkMveDZteVlvbG9mNnk1ZExaWVk2Nlp0ZzJQWWVj?=
 =?utf-8?B?MExiam0rN1cxTDFUcTZDd2RUbjJVd2FER1dYTzFyczdhWk8vb0NMNzl3Ri9F?=
 =?utf-8?B?eEQ2TGhoYjhHb2t5M2xQMEJHdzBFb1BPWGJwM3dWNmlFZUxuV1diaUV4RTY3?=
 =?utf-8?B?a3dEWXpqZGt6dWZxYXJGb2JvU2FNOVVNUng3bXdxM2lobjEwYU1KNjV5ekQy?=
 =?utf-8?B?YjdIbElXMlk3RFNaSGYrRGZrTUhqTmZ5NzM0L2Q5R0tDbWdlVnNmaXdUVnFs?=
 =?utf-8?B?cW1DQlB1L2l6S1ZBQnlGS1lIcVdiT0Y4NGxBL1dpd1hRZ29Hc2trZ2FiQ0hn?=
 =?utf-8?B?eTBCZDNoUk9FTHczcDlhMldiWjNlbERTbDJwbWxsUTBqVDBJNnR5R0FHQWM4?=
 =?utf-8?B?QUVkQ21mZlJNTVVmT3ZXc1ExcU1zdERob2FnS3hkcmVSbjBnSkF4WklZM1Np?=
 =?utf-8?B?bWxpZHVIcXRreHhOc2VadTVDQ2lBNzZCZUUwK3lVWkhVQklvOFNHVURQQ0JK?=
 =?utf-8?B?M3h1ZDVYbUo3eGhhV1RpdC8yL3FCSnpZY0t4dzY3RGFRWXBYQ2VLUHJSaXRR?=
 =?utf-8?B?d011SFlyZEtwQzhoOEUxWWhDNnNxSFdxSmlpL3ZUSU5EemJyQ2ZFdzNHRVla?=
 =?utf-8?B?OCtWQUZ1Qnp6T04xMHdPTnZxeUZtczQwNGVLVE1hUXhkR0FSOUlRQkhlYU1I?=
 =?utf-8?B?NGJCbFBtSHRXQXNJaTdKbW5Bc25IY29KbDQrZnBzcGxudCtHalV0QzhlbFFR?=
 =?utf-8?B?aHYxeVk4aGFtR1hiZ1hzck04NEs5RE44TjUzZ3BJbW1mMlJ1cjJnbHJIYWpC?=
 =?utf-8?B?MERsOFh3TXc1WjZ1OS9RYU5XOVhZWG1hSzYra05CaTBnUU9GNG4yZVg2cU1k?=
 =?utf-8?B?T1hqVkNYQnpHMzlQYVY5YnkrYll2N1J2elNWV2lQYmlzamtMZGVVVERZVWhS?=
 =?utf-8?B?TnkrV3F5aGYyN0JPbWdnbktTeFdCNkFDbXhGT3BJU3lCODNLdGwyOTZCSXBl?=
 =?utf-8?Q?WOjr5yeP3KrCEQ9gmrh/3gnP7T/yN1o0Nwcuo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVg0QWgxQjRhMHF0ZWU3UHJ0Nkdsa1VXUlFybVpRWU5aVWJ4c1FFak8xQ3ZO?=
 =?utf-8?B?enUxbFU0UDhEOXlEVUFiVkFnTTNZOVJnK1Bpd1hhTFA0Qi9TaGxsSVJvQzJM?=
 =?utf-8?B?SGplN2N2bHRnbHF2Y1NsSmo3OUZjaUQ5YnJaSzVxZll2dzZsZGRkNEF4Z1NM?=
 =?utf-8?B?Yk84M1ZXVVNnaVRQV3BqVlpnNWlGbWNWY092bmlGc1hhZHlqeUdMRFd3Z0h6?=
 =?utf-8?B?RndHU3pqV0MvK1lFOVFrTGZ6ZitXNWxwZmxXY1JGZnpUdk96ZW5GYjhDRy82?=
 =?utf-8?B?TDlUVXJtWEwzdUxLM3c1a2syZm93RG0vR1I3Ylk1elYrNThzWFl2RHZGeStY?=
 =?utf-8?B?cnhvaUVIazFSNnYvTTZkdlMwVlpiQnE5SGVuOVdRakZOdk5wN2hrK1BQSW5S?=
 =?utf-8?B?ME54UXRORFpuSUVRUHdBenp6V2QrdDJYc09WQk1VeGw2a0k4aTdtaW1WSmUw?=
 =?utf-8?B?TjNLb283M1BBMm1XUXRJcGJvZkIvbEZ2OWhDaDIvRHYyY3dIbzZ3SXU3cFJk?=
 =?utf-8?B?RWIzSnFFVWRIOVNEODdUcmxnbzdHRkYxdFhaZEQ2WWZPYjlVdkR3bFJ1cGZw?=
 =?utf-8?B?cE9CWlJweGo1bHJSR29ycndvYzMySFRRMUxacmFqbFhQZ0lDUmNTVkpzcEFX?=
 =?utf-8?B?R1Q4RThxd3pXUHNrM1hQaGp1VzZyd2IxTFFyaDZML2ZGbDc0Q1JQa1BjY0Q3?=
 =?utf-8?B?dEZGRUFCMDBNMzk0V3J3TDNZL2I0WVRCN0x5N2sxMEY0WWwxeExQNVZ3VTlH?=
 =?utf-8?B?TkFrNHBEemltNXptaXhCTkVtVXZQVjV3S3kxaGUwTitnTWszdDRKb2o3VzNK?=
 =?utf-8?B?Q0xSRk9ySDdWdFoxZ0V1alo1SmpuaThCeU5kUjRSYUZDR3BXTzY2b2NRWE4z?=
 =?utf-8?B?ZWhSc1U4cElEL0U3S28yL2tJRjBuQ3M5UnlMckZha1N2cnBlcG5UdHRLTXFr?=
 =?utf-8?B?N0g5cXBCTnZwNG51VzBSOFBnVm1xd0NGQUFORUx0d0J0TGV5aURmcmFYSktk?=
 =?utf-8?B?NE5qUUk5L3E3UVcvTUdBRnBmcFFhWHU2UVlyaU5WZk5Oc043TzVyeGo5ZGpQ?=
 =?utf-8?B?MzFmTTFvNlRBSEpwRk5rb0xTZ2JacFZHUkw3bVpvcG9kYWwvMDgyUHJ0QjJE?=
 =?utf-8?B?d1dZWFpRYXpRUFFtejQvSWtiSkQ4Q2h1SGFkRjlUcU5KSGlNUEpmalJxYWsy?=
 =?utf-8?B?YWE4ZkpVeHcxSGtMdlFHcnBIc245UWhrdHArdENVWk1IcEhaV3g4K3grR2Vp?=
 =?utf-8?B?d0VaUXhtZ21IRHlDRktNMGxFdlJnb1pXS3BvcmkxK3pUWU1ndERGOE1SS2Ra?=
 =?utf-8?B?QUlrL0lTWXV2dU5DRlZNTmg4cTgrYjVXZEtOU1gvOGFScXhUbEhrSVpDblpo?=
 =?utf-8?B?L2VaLzhoVEZKY0ZPUXJ5NkgyaVB4ellVY1BxZGgyOWRxWWZyK05EMkVoZit5?=
 =?utf-8?B?NlBXbnYzdm94dUpOUDBjZmNiUktGSXkzMXBicCs1cXJnL0tXQ0JLdGZsRjhp?=
 =?utf-8?B?aXZaRGVDRndlSXlPUVFvQ0p4b0ZjTkFXSXVVY1NsTmhlSnVyK2w4eW9VMEx4?=
 =?utf-8?B?YkZiOWY4Nm14Q2xSZGxSWHNXbVU5NThjMDQwYXEwS3RtNFhjVnc0YzZDOFJz?=
 =?utf-8?B?REJnQzlLUGJsYlFuS2JNS0ZLR0doNFdEYzE3YnZJdGExVEVwTjMwY2VaWms3?=
 =?utf-8?B?N1gvbkt1RXNBRW03dlk3QlE4eGRHdlVRcnVmaEJHVXF0ZTBjNkVjbUhJdmd1?=
 =?utf-8?B?aklMaENITnRGcytVZDgwMWZqOTFVSmNJRkM2aDY4Z2JqUnMvTVJ0ak05ZkNW?=
 =?utf-8?B?YkJxSHdrN3FjQ2hpcFBUNkZUcE1lMjdNRE5UVXEza25UZ3IzejZPc08weG1B?=
 =?utf-8?B?dGNJdzVIZGhXelhCRXA5eHVEUDRhVzFTbVhtdnFTNyttNThjaHNsV2R6OHM1?=
 =?utf-8?B?Wnh1WTFGd3RLRFdIYmRTY3JrL2NnU3dtakhkaE5PclMzaFFib3BjdDU4U21r?=
 =?utf-8?B?TVpyck5sK2k3bXhxUWEzblBpT1l5Z3FXa0JVMm54dklXZ0srcmc2NU5Pb1Q4?=
 =?utf-8?B?SjR5c05rUUlvdS9LelMwK1JVQ2d0OThKQ3BhUDVrTVJ0eU9KekNoODBZOGJx?=
 =?utf-8?B?UGxTUENjQVBYRC9ja2JpN0I1TkNYNWdBOEJsQUVEZDNRRkhnREQycTZ2bUJh?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F4281A3DDDCBA4BB38A1846411C576A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90f2e59-6421-4d58-a61e-08dcfe5e4d16
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 12:26:55.3382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XLeIy5EqudFfZOTsnrmmaHemdVARyT2+CPDwPjMWp11K79G9Met5qQ0U/nWDDtSGFYzQDeu0lmNj43nZdJFz2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9787

T24gMDYuMTEuMjAyNCAxMDowNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZTo+DQo+IFdhaXQgLSBo
b3cgY2FuIG1zaS0+dmVjdG9ycyBldmVyIGJlIDA/ICBBRkFJQ1QgdGhlcmUncyBubyB3YXkgaW4g
dGhlDQo+IE1TSSBsb2dpYyB0byBjb25maWd1cmUgMCB2ZWN0b3JzLCB0aGVyZSB3aWxsIGFsd2F5
cyBiZSBhdCBsZWFzdCAxIHZlY3Rvcg0KPiBlbmFibGVkLg0KPg0KPiBNYXliZSB3aGF0IHlvdSB3
YW50LCBpZiB0aGlzIGZpeCBpcyBmb3IgY29tcGxpYW5jZSByZWFzb25zLCBpcyBhbg0KPiBhc3Nl
cnQgdW5yZWFjaGFibGUgdGhhdCBtc2ktPnZlY3RvcnMgPiAwPw0KDQpJIGRpZCBzb21lIGludmVz
dGlnYXRpb24gYW5kIGZpZ3VyZWQgb3V0IHRoYXQgdGhlIHZhbHVlIG9mIDAgaXMgYmVpbmcNCnNl
dCBieSBndWVzdCB3cml0aW5nIHRvIG1zaV9jb250cm9sX3JlZy4gQXMgZmFyIGFzIEkgdW5kZXJz
dGFuZCwgdGhlDQpjb250cm9sX3dyaXRlKCkgZnVuY3Rpb24gb25seSBjaGVja3MgdGhhdCB2ZWN0
b3JzIGFyZSBub3QgZ3JlYXRlciB0aGFuDQp0aGUgbWF4aW11bSBhbGxvd2VkIHZhbHVlLCBidXQg
ZG9lcyBub3QgY2hlY2sgZm9yIDAuDQpTbyBJIGFtIG5vdCBzdXJlIGlmIHRoaXMgaXMgYSB2YWxp
ZCBzY2VuYXJpbyBvciBub3QuIElzIHRoaXMgaW5jb3JyZWN0DQpndWVzdCBiZWhhdmlvciBhbmQg
aXQgc2hvdWxkIGJlIGZvcmJpZGRlbiBmcm9tIHNldHRpbmcgdmVjdG9ycyB0byAwDQphbmQgZW5h
YmxlIHRvIDEgYXQgdGhlIHNhbWUgdGltZT8NCg0KT24gMDYuMTEuMjQgMTM6MzEsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPiANCj4gV2hpY2ggcmFpc2VzIGEgcXVlc3Rpb24gYXMgdG8gKGxhY2sgb2Yp
IGNvbnRleHQ6IFdhcyB0aGlzIHNwb3R0ZWQgYnkNCj4gbWVyZSBjb2RlIGluc3BlY3Rpb24/IE9y
IGJ5IGEgc3RhdGljIGFuYWx5emVyPyBJZiBzbywgd2hpY2ggb25lPyBUaGF0DQo+IG1heSBoZWxw
IGZpZ3VyZSB3aGV0aGVyIHNvbWUgd29ya2Fyb3VuZCBsaWtlIHRoZSBvbmUgc3VnZ2VzdGVkIGlz
DQo+IG5lY2Vzc2FyeSwgb3Igd2hldGhlciBpdCBjYW4gc2ltcGx5IGJlIGxlZnQgYWxvbmUuDQo+
IA0KPiBKYW4NCg0KSSBoYXZlIGZvdW5kIHRoaXMgd2hpbGUgcG9ydGluZyB0aGUgUENJIHBhc3N0
aHJvdWdoIHBhdGNoZXMgdG8gWGVuIDQuMjAuDQpBZnRlciBjaGVja2luZyB0aGUgcHJldmlvdXMg
dmVyc2lvbiB3aGljaCB3YXMgb24gNC4xOCBpdCBzZWVtcyB0aGF0DQpvbiBpdCBtc2ktPnZlY3Rv
cnMgYXJlIGFsc28gc2V0IHRvIDAgYnV0IG5vdGhpbmcgYnJlYWtzIGR1ZSB0byBpdCBiZWluZw0K
dGhlIGV4cGxpY2l0IGVuZCBvZiB0aGUgbG9vcC4gU28gSSBoYXZlIGFzc3VtZWQgdGhhdCBzZXR0
aW5nIGl0IHRvIDAgaXMNCmEgdmFsaWQgc2NlbmFyaW8uDQoNCkkgYW0gdGVzdGluZyBhbGwgb2Yg
dGhpcyBvbiBSY2FyIEdlbjQgYm9hcmRzLg0KDQpNeWt5dGE=

