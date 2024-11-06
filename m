Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B7E9BF06A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 15:33:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831123.1246288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8h58-0003P9-S2; Wed, 06 Nov 2024 14:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831123.1246288; Wed, 06 Nov 2024 14:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8h58-0003Ml-PF; Wed, 06 Nov 2024 14:32:26 +0000
Received: by outflank-mailman (input) for mailman id 831123;
 Wed, 06 Nov 2024 14:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lQG8=SB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1t8h57-0003Mf-24
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 14:32:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2614::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecddf8db-9c4b-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 15:32:18 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA1PR03MB10697.eurprd03.prod.outlook.com
 (2603:10a6:102:48c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 14:32:13 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 14:32:13 +0000
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
X-Inumbo-ID: ecddf8db-9c4b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjJmIiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImVjZGRmOGRiLTljNGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTAzNTM4LjY3MjkzOCwic2VuZGVyIjoibXlreXRhX3BvdHVyYWlAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alHGsTpE191ZOnGsr+zMB9DQvlA7eUIlDB46DJA55jAxAjLCAJW1EJfs6ieqYGCtYt2Od4wbzQ9BSRru6F1uTg5qYRAhGsBa8OR8IqgciUbPUvJSPHH/q7TX/iC5hDg8RH4hPehtuQ1cnV7B7RmrL8mIfHaALz3r9G1X7870786GYtsb9gG005OSEvpmgNw4To9OgJbqfzzlwKlcUIO90Z4eaamSlIDaPeLyItSbMCwScssLQ+6gRQhPhEOykl2a22J4Vxc0oHPu7b1tnPdOdOETDYaXyDmorKSN+2DCpdTPBZrmjcXiZ5lxtMqcQwhkJrMnvfwDtVI+4vISY2XhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2jS3YFSDVwMR4MCij1kqd9LS89we+Pb26VysOxdMS4=;
 b=guggDLDn35e8i5wus8pz58Kc8V16A6CEd5tXZdb03IRsOkc3gC464pxxqCJdhhUvAf0G0hscZRKNVWrRpAB6BftPDhm1Ev3K2XutdeZ9y4W9Y9Y7ocILQl5ZMDOcTnj43poPsTOyIYe0cBLol/DkiDy+zIn6UrYF98VMhvcPYaoX7KYqQjoO5pB4f8COyc/nBY/5FhhQr6fdsJ+Z1kf0R7RluGWlHRqXNzaIQNcUcOFrKcMXphObX27FfpPJkRRJb6+UfPD8BVCpLqX/EAN+49L2LnjC/0UzU0KXAFyfpJl0PveSukAAkkyik5n8Sp6aerJNBu6+d7pRDOxzNlZTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2jS3YFSDVwMR4MCij1kqd9LS89we+Pb26VysOxdMS4=;
 b=Si+cc0C/aIeXo1Rmn0eM2E+e9gJkrMzdxPa495IaAii1Y/IL/tA13G+JCHjw7die/8ml51K4C0WmmlaNVgxCn7hjCvlJRl6vVSr6+0GRRvgqn4rkK5bsbXjdJb0C/eGJYOjinVzUshJ3IF7Aghy64nmVj0CCp8WQBZ2OHkCbv+ZbziJNJCOdXXsJIVBqpxUVZsw01ibdcHhSaxtfdz4ljxxiNroWu6pBhGehGhy8d/vUBsanEhtZTYRCrVzLw++e8a6IR1ab5BCT7ioIMa3jJ18ynPotXY3OdUCV6vKRGIi+uWERQhuAZyRuO4AS0hBwXUY/FuzF0gJk6p0h8ZwjSA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
Thread-Topic: [XEN PATCH] xen/vpci: Fix UB in mask_write
Thread-Index:
 AQHbMCKf4QVge+H9k02dX4ZlwzpGqLKp9EiAgAACIoCAAChLAIAAD1kAgAAEXgCAAB6ggA==
Date: Wed, 6 Nov 2024 14:32:13 +0000
Message-ID: <7c57371b-803a-418b-97cb-55e79516eed4@epam.com>
References:
 <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
 <ZyswF4grJSNcVqY_@macbook> <Zysx4ZwCUv62uTBw@macbook>
 <6d3f322f-7047-4033-95b5-86751a58cc70@suse.com>
 <65d2043f-5e6f-4d84-8241-eb28dd94fc45@epam.com> <ZytkOP_7nmeSVEYH@macbook>
In-Reply-To: <ZytkOP_7nmeSVEYH@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA1PR03MB10697:EE_
x-ms-office365-filtering-correlation-id: 97860458-4953-4ce4-854a-08dcfe6fce65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bkI1L3ArWjVaTTlLblhLek1hV2ZHR3hVcURsakN6aDkxZHpMMlZVdERlUEZP?=
 =?utf-8?B?RXVZcWxnQndQeU9uN05LWk01dEhkc3Y0R0s5QUpZVmVRLy9Hc1BySEJrcDlj?=
 =?utf-8?B?V3hOZ1dxL0Foc0pUOGg0K1JpeG9BcE1UaW5ERmlaKytjT1JkdTNzaEJzQloz?=
 =?utf-8?B?QUdHN1ArWEpXMzR0VjFvYk9qd0pITWFhc2pwKzRjdEtsMExCNWcvY0cxdVNj?=
 =?utf-8?B?MHRKK2dKL21xWFY3T3o3N3NGWlJUT0NpL3hhM2FocFlOTWpObGJ4aHMwd2cw?=
 =?utf-8?B?R0wzTlRuektYNjljcGw1VHV4UmJrbDVuVXMzdVJ1RW5yMTAveVh4Y1N5dGlh?=
 =?utf-8?B?anRkbDhpYm9kL3Z3SUJNdUNiTWFueURqRzVNTENlZHVHK3hIWjBtYml2OWZz?=
 =?utf-8?B?U2o5ZFpYR1l4Sml6Q05HWGtZbnVQY04xdzlXeVpXSWIvRWVkYnFpdGtxNStm?=
 =?utf-8?B?UHhQdDNiQzdJVzJvdUs5d0tjZDlHbkpKbzNpTmlvcW9vdGNmUVpCVjQreEEz?=
 =?utf-8?B?VzJ0YVNnRDFDUnhsUVhHaU5sbHl5aXNjcmdndXpxaXZyaTBUMSs0YkE3VU1a?=
 =?utf-8?B?M0ZqZjVIK0JvaHdwckJPM3JlcXJyL1RZTXJON0Rzc0hTUk5WUTRINVhHSEJv?=
 =?utf-8?B?ZDJEYnNDZXVSeWI3VmdWQmszTVFyQm9NWFh1czBrQjJEaXJOWnM3ZUt5akM3?=
 =?utf-8?B?RmIrZjFXK08zcmNmRExabU5hMFlEQmNJOUNZZjZqbjhlc0d1QjdJS00ya2tq?=
 =?utf-8?B?MWxZQjNnelZHNFdnTWNNSlBpK0RkK3FaeUxOY1kwUXFpVGc4QStjRENIby9G?=
 =?utf-8?B?bHc1K3hFK2pRSnlUMGplZDVCQlRScG5ocjl1Q25Ed2tmaGRBd3RoSTlRcHlu?=
 =?utf-8?B?TjlkOFlybC9lVGNPRi9XK0Z5WnZxRmwxd3RCSXZxK1RLZUNhbWFFWVVrYTk4?=
 =?utf-8?B?Z21XVXdDV2tWNGdXVkZOWjhOQ2lDMDQzaUg4WXBFWEJBbkpoMkE2NUpPckpx?=
 =?utf-8?B?ZEI3Rm9xNXdvNG1meTdiM2kvcnYxa3gwZUpCTlArMzFxeU8rdmJzUUN0UHJB?=
 =?utf-8?B?K01tZTBqdU00cmt4eGhtbFhyTW9UdUdqbC9vTWdHa0FTUnUwUVdKQzlPdHBM?=
 =?utf-8?B?WmR4QnBXS0dMQVp0SjgwMTV5cnRHNFM2R3RqbXd5Tys4a3UxTEh1UVhMQ1FP?=
 =?utf-8?B?VmRPemdXWjhtQnpUazRDZGdMNytLU0M3dGV3eURKQjdMTkRDR1c3K3hKaDJS?=
 =?utf-8?B?bVF5UjIrVW1GeUUxY21SSHRHU0tlcytDUnVpc2YxZ3gxK2VVUlM4Z0ZDODJM?=
 =?utf-8?B?b3o0aTVkbnR1aGhqL2JROUlWZU1WdDM0djNaSTUxKzN6NE92d3NXb1ppMC9t?=
 =?utf-8?B?QnNlY1NJYUVMMnJaeXZEemtQcGRCKzlTWkpEaTZVcDZKamVFRmltR3ZPQncz?=
 =?utf-8?B?c3BpOWxhTXI3V3dJNWNqdXhCUDN0RkxUenlFeTA0Z2JYdE5BZjA5dERzSTdM?=
 =?utf-8?B?aytCbXRsbVBydFJBNXdmaWZxcjhqM2ZpNlVObFZxQTljRVA4WU1pOGt2bm1J?=
 =?utf-8?B?VEo0ZS9hQ21WcDRDQXRvajV2WlhOV0h0ZHdzTC9la0lrMEpCQUlNcmNZbkFo?=
 =?utf-8?B?d0dEMlhUMC9vWVpsZ3lLd0oyNkxQNElxUnN6YWJTeGhQcWJrcVE1MklMWEVP?=
 =?utf-8?B?RTlQaTRwcFk3YnUwRDhHdEVvNUtReUcxODN6VUJGR0N2SFdVMHFvdHA5U1Rv?=
 =?utf-8?B?eVRoM0x0QWlHQXp2dlFaZXRpclVFZU83Y3EyaStQNlRYMlpFbEJQK2VoQ1pH?=
 =?utf-8?Q?skHgKY1kdTgfOy0qTjZZdi/EkMAODkK+bTJG0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVlTRGhVdDVwbjhGWUxyNG5TOHJwclVVMmt6WlBYL3lDU1M1aWtKdjVwUFdD?=
 =?utf-8?B?S2h0M3JPemhjTnFMbnNoU0FJY0NCUFdEWkJqMis5NCtMNmd6SUc4QTA5Yktp?=
 =?utf-8?B?T0R2VHM2RkdHWWp2SXBXaEIxdStwTmxJeDJtU25VV2hiK2c1RE84ZmRadGNL?=
 =?utf-8?B?dTQ4VEJMWFo3K0wwUUpoL2xQYlI1UWlwUkVidk9oc2FzbDgxUW9LUVQvRk9S?=
 =?utf-8?B?ZjVZMDlSQW5PV0tUWkNsekNZYjdiWjBJcjhuaFQxUHRmaEMzTDVLSVN6NFBY?=
 =?utf-8?B?NkhjdHlucHhhd0ErM1hnM0FXSzJQazlDdDAzbGNNdFVSeUhlcmZkSWpnYWpM?=
 =?utf-8?B?MGtIVDhuSlNHYUlkRnlDd1FvS2ppdkhwY0lVVVplMWFGc3NkN1JmZi9Ha2Q5?=
 =?utf-8?B?MXNoWm1hTXpWcDlqcW5IdmpKU081QzZiUFkrSTJCRVR3eU9yYS9jUnRNN2pH?=
 =?utf-8?B?OVNJcjIwTC9Pc1dQMHpFdlJzZHBXc3U1R2pFclJCWmVod0FjajJ2M3Q0ZTVT?=
 =?utf-8?B?LzkxZm5iRVV0c2JMYUtEMmlqUXBRcVQvekZWSGFRSUxYWDNpa0FuMUxuREJ6?=
 =?utf-8?B?VFVHM1V4SWdiVWpkWXB2Q243QU1VdWJuM2RKTHlvc1RGQlpPNkZHOU5zdi9N?=
 =?utf-8?B?QVYzTVVsN2tXb1VxUDcyajVpN05vMFpaQm53OTQzTHErVnFNWlo0akYyZ3VL?=
 =?utf-8?B?MlNoZXU5UExPUDdaRGhEK2U1UlJPWWxidlpHRzJxRjZjMHZIdFBmR2hkdTdu?=
 =?utf-8?B?cjRNK3k3V0VjTUxYa1I2b1RqeWVwVTZrM0h1ODlFK3ZuMXkzd1ltZ1ovMzd0?=
 =?utf-8?B?czZONkNvKzQvTUtGWDBaREdWZ3FHeE9qamV2NUxleWtGUGJvWGxvVFI0eTFW?=
 =?utf-8?B?c0NFY0JWdTluajI1VXRhdXlKNnVuOEZzYnN2NjcyTGxhS1FMNFV0UzArYjNV?=
 =?utf-8?B?Q2ZuN0FTYytKSVBkanFWSlBuWFlKVWFvOUNySGw3VVFOMzdpbWppS2o3aUo5?=
 =?utf-8?B?djhOcWkrWHpvblgzeTdhYTREM1FqVXVVbGw4bFBPTkViajFvZitTSXVYRzN3?=
 =?utf-8?B?QkdkTGlHZW5NMi9pUGhYL1cwVFc0NWg4ODNVOXFXbHNXTERaVDdMa29NNFNK?=
 =?utf-8?B?TWV5YldNYzVrMzlqU256eUV0QkxxZVZaWEcvSlo3OEdXY1BnbHYzQ1ltd25t?=
 =?utf-8?B?Q0FQM2dJM28rMzVEVS94K3BJRVFkTmRBL09VVjh5Y2ltUHNmSldVeGppcllU?=
 =?utf-8?B?cldQVG9zV0ZNQWZrcjArbWs1azFtM0tjeTBWY05TUWthVWw0bnhVaS9DaUhi?=
 =?utf-8?B?V2RqVWNiV1VQcmJnM2w5TFNucWVXUUFJVno2RFhIYk5ya1JBbzU1MC9BSWhS?=
 =?utf-8?B?akpBek9pMFJSSlM0THg2M3NQY29qNTB0dk85dkhnTmQrbENHb0hnRFNSWkdV?=
 =?utf-8?B?VC9kREt1d1AvN0lTV0Z4blBPNEl1OGJjUmVYSXJVNUovekZEd2lUSVp1UGQ4?=
 =?utf-8?B?Zy9YdXRtTm5IczU2KzNycDJkWVFJVTF4MVRHSE94SlJjVHB2ektlWE9UM09I?=
 =?utf-8?B?SVhXM3NFaGJSKytLUHJxTmk5RUorYXdmdmdFd0k0eDFZcUsvZmZLS3dOQ2ZG?=
 =?utf-8?B?b3N5d2dRdUVMenA0U2k0NUtqUGhjdG5uejNwdmFjSldOMGhaNGFRRlZmdEdm?=
 =?utf-8?B?a0ZKR0Z4VDV1dkZwd0FBZjJQQ3ppYnNneE55M3hrc1JML1piT1hTYm1qSVhF?=
 =?utf-8?B?R0o4OGlBbVV2ZjJmL082NWlWcERuU1UzbWJTVkw1cWQ2WjBtNWJGN2xMTUNG?=
 =?utf-8?B?ZnE4dHh5RlJ2dXJ6RzNWdXBhcktxMTRMVEZxdVYwbzllUEdXTVorN1dObTJj?=
 =?utf-8?B?VXhsN1JNUVp1SWFFbWtzRG9kVkl0RlpFV0ltS1IvZE9uRllMeTZBRWpRdUxF?=
 =?utf-8?B?bDB3MXV0Z29IaG9zNVE3emtIVlF1YTVxZmtadEtnSHliTmZtdXpZZnJ6RnNj?=
 =?utf-8?B?WmkzUmQwd0VEU2FTWEpmd3dtMVYxZlV0SHBGT0h0L1ZETU12N05HMVVJRytn?=
 =?utf-8?B?YzFDby9OWVBZMm94cmYrK3pUSjc4R2RYV3JOdnU4WGJUbXd2a3pzY21JRFMz?=
 =?utf-8?B?Z2hXSGpxdUQwZEtyVDJYVTZTN0pPYWhSRXlMOEJPUkRSa1ovZVNGWjNaN3NN?=
 =?utf-8?B?R1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA3A06A342CE4342AB276A0AF4059F86@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97860458-4953-4ce4-854a-08dcfe6fce65
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 14:32:13.7296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /LB0DNEFnNW4QP2VQy5+LzNmgVLDcS6mSmQQWuXyR4IxEQeatAwDbNYO0kize1Zv6jlwpqQYBYrg8LrbAD5H5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10697

T24gMDYuMTEuMjQgMTQ6NDIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDA2LCAyMDI0IGF0IDEyOjI2OjU1UE0gKzAwMDAsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4g
T24gMDYuMTEuMjAyNCAxMDowNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBXYWl0IC0g
aG93IGNhbiBtc2ktPnZlY3RvcnMgZXZlciBiZSAwPyAgQUZBSUNUIHRoZXJlJ3Mgbm8gd2F5IGlu
IHRoZQ0KPj4+IE1TSSBsb2dpYyB0byBjb25maWd1cmUgMCB2ZWN0b3JzLCB0aGVyZSB3aWxsIGFs
d2F5cyBiZSBhdCBsZWFzdCAxIHZlY3Rvcg0KPj4+IGVuYWJsZWQuDQo+Pj4NCj4+PiBNYXliZSB3
aGF0IHlvdSB3YW50LCBpZiB0aGlzIGZpeCBpcyBmb3IgY29tcGxpYW5jZSByZWFzb25zLCBpcyBh
bg0KPj4+IGFzc2VydCB1bnJlYWNoYWJsZSB0aGF0IG1zaS0+dmVjdG9ycyA+IDA/DQo+Pg0KPj4g
SSBkaWQgc29tZSBpbnZlc3RpZ2F0aW9uIGFuZCBmaWd1cmVkIG91dCB0aGF0IHRoZSB2YWx1ZSBv
ZiAwIGlzIGJlaW5nDQo+PiBzZXQgYnkgZ3Vlc3Qgd3JpdGluZyB0byBtc2lfY29udHJvbF9yZWcu
IEFzIGZhciBhcyBJIHVuZGVyc3RhbmQsIHRoZQ0KPj4gY29udHJvbF93cml0ZSgpIGZ1bmN0aW9u
IG9ubHkgY2hlY2tzIHRoYXQgdmVjdG9ycyBhcmUgbm90IGdyZWF0ZXIgdGhhbg0KPj4gdGhlIG1h
eGltdW0gYWxsb3dlZCB2YWx1ZSwgYnV0IGRvZXMgbm90IGNoZWNrIGZvciAwLg0KPiANCj4gY29u
dHJvbF93cml0ZSgpIHdpbGwgc2V0IHZlY3RvcnMgdG8gKDFVTCA8PCB2YWwpLCBzbyBldmVuIGlm
IHVzZXINCj4gcHJvdmlkZXMgdmFsID09IDAsIHZlY3RvcnMgd2lsbCBiZSAxLg0KPiANCj4gQ2Fu
IHlvdSBwcm92aWRlIGFuIGV4YW1wbGUgaW5wdXQgdmFsdWUgb2YgY29udHJvbF93cml0ZSgpIHRo
YXQgd2lsbA0KPiBsZWFkIHRvIG1zaS0+dmVjdG9ycyA9PSAwPw0KPiANCj4gSXMgbWF5YmUgbXNp
X21heHZlYyBub3Qgc2V0IGNvcnJlY3RseSBpbiB5b3VyIHVzZSBjYXNlIGlmIHlvdSBpbmRlZWQN
Cj4gc2VlIHZlY3RvcnMgPT0gMD8NCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCkluZGVlZCwgSSBo
YXZlIGNoZWNrZWQgYW5kIG1zaV9tYXh2ZWMgaXMgc2V0IHRvIDAuIFRoYW5rcyBmb3IgcG9pbnRp
bmcNCnRoaXMgb3V0LiBJIHdpbGwgaW52ZXN0aWdhdGUgZnVydGhlciB3aHkgdGhpcyBpcyBoYXBw
ZW5pbmcuIEl0IGlzIHF1aXRlDQpzdHJhbmdlIHRoYXQgaXQgc29tZWhvdyB3b3JrZWQgb24gNC4x
OCB3aXRoIHRoZSBzYW1lIHByb2JsZW0uDQoNCkkgd2lsbCBjaGFuZ2UgdGhlIGNoZWNrIHRvIGFu
IGFzc2VydCB0aGVuLCBzbyBpZiBzb21ldGhpbmcgc2ltaWxhcg0KaGFwcGVucyBhZ2FpbiBpdCBj
YW4gYmUgY2F1Z2h0IGVhcmxpZXIuDQoNCk15a3l0YQ==

