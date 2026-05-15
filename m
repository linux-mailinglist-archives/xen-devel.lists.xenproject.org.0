Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ84GJ0JB2oLrAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C581954EDC1
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309890.1580908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr89-00054e-3z; Fri, 15 May 2026 11:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309890.1580908; Fri, 15 May 2026 11:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr88-0004y3-Qf; Fri, 15 May 2026 11:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1309890;
 Fri, 15 May 2026 11:54:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wNr87-0004sA-8z
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:54:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNr86-00Abbl-LH
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:54:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070990-e002-0a2a0a5209dd-0a2a450aa776-10
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:58 +0200
Received: from [52.101.70.125]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070991-56b3-0a2a450a0019-3465467d29db-5
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:58 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6926.eurprd03.prod.outlook.com
 (2603:10a6:102:e4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 11:54:56 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:54:56 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0sdlf2k7EEgPgGHPWIKysCLwGGj1bCZ01w2610jFEQ5rpH3cw71aIzedrv1v2997FDEGS2I0fLeYgLWd+/0QdD4p9oT2Ex8qXzm0YypPTL3HVBhpj/sYLgv7am9i2KAW7SzA16YqultnG16i1vVwJksyfYmu0LhV6rucvT68sNIqPt/HSnORb+iw1oTGI3FXBOqCCo9t5SIWMWnXDoQCs5z9sYjqzKw8RcVg1tvh+P2tyP3XeY/S7kFrJEFhVPq9NxOfromcrSxr6bZ6QWrglHK2/gePgNBzfj8YMLHFG8zIvKv2kJkv4FR8pWSTY1Yp9F6v3HlJWpVFvdP7LZPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oG5XKTSkzbWG/PAgGQ2ErPf7DrbFZ0GcEQryjbdyVwI=;
 b=N3d6PlePDNlwp+VP1EPjfLLpCL5ydoKbkf1wr0CdOH9RORzu1iq0crF/dcWknnlkrVkyf9MGxEwIE1iB/7kDDXyVjUETp6+ARKhc1i5D5+T7MUsEe715R9BZIF8E2JXRrcXegilgrwmnbETRQV+JoiszjZD3RmqdOhJPeZRctK+14qmVDcQYIT9dbARzM71y+TsfP35R+LQozRK+IbfJrkTx7YkhfoK86cRzqylCCQn8wLmn+odl8fcYzvI32EiIimnVpl6EuGg1SGTeeqDykAhk3uvr1NDEIoV3o+gBsfCqR9gvek46FRmkle6gr69kvTESoSGAw+WcmCZrJTHLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oG5XKTSkzbWG/PAgGQ2ErPf7DrbFZ0GcEQryjbdyVwI=;
 b=ogQHrI0t0C+4Pzkr508gXqPpaZVHFssvZ27UiQtMREmwKYDd1nYzmwobL96Vk/V0ThBUF/ZECHrHrTb/8gG7G0leWYxX2tbYfaV92Su1PU8c4lO1zNl7dNz1Dn55IMESzLJwT9hnKjdNBIdUKlecl+4fI3CV7kz5aOf28smt9GlfIUxoDX5eB8aFqaeeR6Jv7C+HvwGwI58AqgbwVLcw+urrFC2qsA55wDQZSuBenIMtcQIEexaulMSnG3l0z2qsVm11/RHuxpzvnYhXs3CmdWgobAHpZ5szq9E/UmvYQlDx/2iZiZW4rKJo932lwRGZw8ELowlq8dkJGDbXSRV6ig==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 2/6] arm/irq: Migrate IRQs during CPU up/down operations
Thread-Topic: [PATCH v8 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHc5GGlK0DQjFAl6k27RpjLW7wtUQ==
Date: Fri, 15 May 2026 11:54:56 +0000
Message-ID:
 <664ea82ceb9890d421b201c8963dd164aa1d81c7.1778845596.git.mykyta_poturai@epam.com>
References: <cover.1778845596.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1778845596.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6926:EE_
x-ms-office365-filtering-correlation-id: 5c592cc3-aa6c-4f8c-f0dc-08deb278c870
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|38070700021|11063799003;
x-microsoft-antispam-message-info:
 OV0lZE0k/kHKQKvehW/X45iJ5nisY478EGCSP1ULw6ZKREaXaqxUvs14cwZXf+kcUrgEMHap3W8ar63j82QWX4gah9KIH8qX4DJaa7vD4nbBhQfBWIaNzZzgvmW7EkezcSNA2yqpf4Tq2j41hRy/tyncIluEAYiQiTJlLsi3cw2qJ15U5gUbpVMmGP1CUCwH5lOTiTFRbJ60wUVeZHahujVQpc/n2sqI0qYZbHcIj/ojMHKWMmDXZ+PDBoZpSxzf37KVXS47RHLnYuRDkxf3bEA16vqobFsl0hFmKpRR8DC1+ywqNw5eJCrI3gL0owE1ISk7Bww6MmmSNv9ymgHQJ6i5/0PJAeBEgB8u5BeMzLQ5Wk5YKaKukDARnTOk2SJOBwB+EmGmeQ6L97DbUqpoLYGd/zuPs8ZeBF+KUISMqVKIYvXxDNaNYkeTj+OcWKV++kPsgtHBtnDkMz6UIfj//CFvXWRGUdiBa6nge9PFqstN7+1JmHbNJHOn/Nv9A5l/nY8gATfU99DjxmY7d57KiD54DGodw66vfh7gSG7hjNYeqdFm/YfLqJBTaat1Tn/0z3PhhdHvfPxZ0oH7veK5KnrcQCLEsBb5tK+kE5KRa8D9hzYEUT2pHWCVdOW0glbGUzo3lv8Z/2YENbttxejNwQLRZz3NiEv5EeVvxc+QoEHZdHHGgRaRle9VAjIju3OYBwiiDYKzG3GAa/wgDiWbuw6D4nd2HlvRMVbE1QuiPBi5sz2/y0mbk7XP20aDvNkT
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(38070700021)(11063799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JeSCkT2C9dIz4UImk2gKklxma6puQIMis/D+zsnLHGYIE6NSCsm0eU1gQy?=
 =?iso-8859-1?Q?42z+t40QVyQSdCmrDDdudorb+8BidJz2RTr6X05epqCF5S+wTFtEo8ktEW?=
 =?iso-8859-1?Q?X4KTpdrD91q8vQhRRBa7JtdDPEuecXUZrnqE4ZDQLGV2ZUPSmpO6Z6q0Q2?=
 =?iso-8859-1?Q?RYp433dK2HZFhGlVc7hl1WiLwAIEzqR+zAlNmMDfaeRcFiwrZKIj3C5It5?=
 =?iso-8859-1?Q?GGj4hNxv3IKXGAiN05mO0U8IU4xCXZEIH1+yDRx3KnqhjBqVgcGnvphPr2?=
 =?iso-8859-1?Q?FqHYuWSa7lpQp7W6G9K6PG24GiNXd6VwJ4nkKDWB5m7u4//F6+879ghk77?=
 =?iso-8859-1?Q?A7aKHm3k0aCNtOrV+bpJ4xAdovPr9ZTV+OI4NbCrzp065XMPNv62O6u7Bq?=
 =?iso-8859-1?Q?8yzH3RIoVjDtzi8taDT0QhW0vvaMEs0IRLU/MReQwlmK1i0NV4coJaXsie?=
 =?iso-8859-1?Q?9QdR/ZSeAr7s7ya2giYs3aZvcCMGPJW3Y8JSouhh9EOyATDVU7CZLpZHb7?=
 =?iso-8859-1?Q?iEDJIyWX5ekQ5lhVYoPb0T+ZPC5Czj0S/WGbmtzrTuaWNpQiLcGgBk0Q5n?=
 =?iso-8859-1?Q?3vaBvSs5Jma4pA4520pS3s2gmqzkavC/7SQL/r5JJ2DLzAvKAI+kCyXUhm?=
 =?iso-8859-1?Q?3o4Nj08fNT1Nw6Pg7kAwHrTp9spdYnDoK/9ccJmuk3TdrgRrVr36Hv9qaH?=
 =?iso-8859-1?Q?qAjNq5IY4D/yWMbdxn3DZx7mi5fTZyzvXdktVt7BJPsDRf5JgZmDs0GcIy?=
 =?iso-8859-1?Q?2GdHsu2rKKATtJ8dMhgjCcRDdzMSeJTDlTAmxP6G4B+tpRgJCnVo9zT+Z/?=
 =?iso-8859-1?Q?GT+DqZ7jBes18P+f/oTFJ+8U7fa9Nl7s2XsgVbNf5tp5PkcyYH232kwOaB?=
 =?iso-8859-1?Q?hAhNQXfnQdpySFiyHt/5Xo2eGPXwexnhYLgdf2rSH6mUUXepYsUFYYj+vQ?=
 =?iso-8859-1?Q?4yqSxM95aEazgQPnJpfG1TDDTvGpeaTH115JiCeKFLXyjE+6DC5GGuNZ9b?=
 =?iso-8859-1?Q?lC5IfpsEaCBresHKbT2p+qbs5FEAjDJCjYyDdzMdevnYLf2kUlRWDbE917?=
 =?iso-8859-1?Q?wqSdcFlLGDknYL0UraFgB15irB+OwbHspfk0aw2OX0TB+83u+3hdG5s9Nz?=
 =?iso-8859-1?Q?WwllD4g8S/vqmgLFtPHcMaZrsoEtN1tFKL5361SM4XwmQ3plNQxgrzVmRc?=
 =?iso-8859-1?Q?2I7nKF9843mXI8D20AgiWx2SLp1+2vP8nVxWu3uwfTpZRI+C80rRReXqgG?=
 =?iso-8859-1?Q?6wuFjN6wZN2s6x+q/F3buGdvvZuFqAk9SHoSwGATDr/gxP5da3Oenm6hIK?=
 =?iso-8859-1?Q?IH0LzvnYTWl5rqv6dFa9XO3kl9+QGjK3nC/ctYWJOp+zwTQQIFxcnyuNsT?=
 =?iso-8859-1?Q?XS1+dYhMq8fhmTFVhjzr5TSWUPS8fULLVbN5WCBcGGqTKKDkTrTJ/cMyOG?=
 =?iso-8859-1?Q?HvHHRdYB9POcSIySD9ty7j0diiv4q7t4LCPMRi+SJ5eHW3qBw2vDfy4V3A?=
 =?iso-8859-1?Q?rZL3pDT7ADSbUWwmQKs0iVF/nnxFUUKQGQSnSU2weO3fpWnk/I8q34qEYA?=
 =?iso-8859-1?Q?7KCsKppNDxrfUeneQxbmooNng5DCebA5Qc6yQ+cXSjrKjsNyRPp5f07eL0?=
 =?iso-8859-1?Q?2s59h0a1H181zzjcafMpSSA6XJcQSoruhHMWD0ZvQwnXZiLELpKczNf57P?=
 =?iso-8859-1?Q?9YFFOx1evHPf+mOLP8SaImtpQRo6xi7X1MOqzOAvS8VtBc2I8Yasm26WIm?=
 =?iso-8859-1?Q?t5CX+V4AUvu4n9NwKlzNqb4C/urltG3iBJPItsuzDTsZlmNK7BR72gLVBI?=
 =?iso-8859-1?Q?ioC3rCOd+vYxVpZJcswxfjK2e5ymQNk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c592cc3-aa6c-4f8c-f0dc-08deb278c870
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 11:54:56.1661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSGkombaLSxW5NLWBxNQYfpLtYHi/eE5Tqem/zfcHp2Bw2EQQRq0hvnQxEhZuEG5tmjC/RNJ8rakvNONEIsbkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6926
X-purgate-ID: tlsNG-4011c0/1778846098-7F1948B7-B4EECD98/0/0
X-purgate-type: clean
X-purgate-size: 4850
X-Rspamd-Queue-Id: C581954EDC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Move IRQs from dying CPU to the online ones when a CPU is getting
offlined. When onlining, rebalance all IRQs in a round-robin fashion.
Guest-bound IRQs are already handled by scheduler in the process of
moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
itself.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v7->v8:
* check only existings ESPIs

v6->v7:
* replace ifdef with IS_ENABLED

v5->v6:
* don't do any balancing on boot
* only do balancing when cpu hotplug is enabled

v4->v5:
* handle CPU onlining as well
* more comments
* fix crash when ESPI is disabled
* don't assume CPU 0 is a boot CPU
* use insigned int for irq number
* remove assumption that all irqs a bound to CPU 0 by default from the
  commit message

v3->v4:
* patch introduced
---
 xen/arch/arm/include/asm/irq.h |  6 ++++
 xen/arch/arm/irq.c             | 60 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/smpboot.c         |  7 ++++
 3 files changed, 73 insertions(+)

diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 09788dbfeb..3ed55e02c3 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -126,6 +126,12 @@ bool irq_type_set_by_domain(const struct domain *d);
 void irq_end_none(struct irq_desc *irq);
 #define irq_end_none irq_end_none
=20
+#ifdef CONFIG_CPU_HOTPLUG
+void rebalance_irqs(unsigned int from, bool up);
+#else
+static inline void rebalance_irqs(unsigned int from, bool up) {}
+#endif
+
 #endif /* _ASM_HW_IRQ_H */
 /*
  * Local variables:
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 7204bc2b68..44df7efd6b 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -158,6 +158,61 @@ static int init_local_irq_data(unsigned int cpu)
     return 0;
 }
=20
+#ifdef CONFIG_CPU_HOTPLUG
+static int cpu_next;
+
+static void balance_irq(int irq, unsigned int from, bool up)
+{
+    struct irq_desc *desc =3D irq_to_desc(irq);
+    unsigned long flags;
+
+    ASSERT(!cpumask_empty(&cpu_online_map));
+
+    spin_lock_irqsave(&desc->lock, flags);
+    if ( likely(!desc->action) )
+        goto out;
+
+    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
+                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
+        goto out;
+
+    /*
+     * Setting affinity to a mask of multiple CPUs causes the GIC drivers =
to
+     * select one CPU from that mask. If the dying CPU was included in the=
 IRQ's
+     * affinity mask, we cannot determine exactly which CPU the interrupt =
is
+     * currently routed to, as GIC drivers lack a concrete get_affinity AP=
I. So
+     * to be safe we must reroute it to a new, definitely online, CPU. In =
the
+     * case of CPU going down, we move only the interrupt that could resid=
e on
+     * it. Otherwise, we rearrange all interrupts in a round-robin fashion=
.
+     */
+    if ( !up && !cpumask_test_cpu(from, desc->affinity) )
+        goto out;
+
+    cpu_next =3D cpumask_cycle(cpu_next, &cpu_online_map);
+    irq_set_affinity(desc, cpumask_of(cpu_next));
+
+out:
+    spin_unlock_irqrestore(&desc->lock, flags);
+}
+
+void rebalance_irqs(unsigned int from, bool up)
+{
+    int irq;
+
+    if ( cpumask_empty(&cpu_online_map) )
+        return;
+
+    for ( irq =3D NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
+        balance_irq(irq, from, up);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( irq =3D ESPI_BASE_INTID; irq < ESPI_BASE_INTID + gic_number_espi=
s();
+          irq++ )
+        balance_irq(irq, from, up);
+#endif
+}
+#endif /* CONFIG_CPU_HOTPLUG */
+
 static int cpu_callback(struct notifier_block *nfb, unsigned long action,
                         void *hcpu)
 {
@@ -172,6 +227,11 @@ static int cpu_callback(struct notifier_block *nfb, un=
signed long action,
             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
                    cpu);
         break;
+    case CPU_ONLINE:
+        if ( IS_ENABLED(CONFIG_CPU_HOTPLUG) &&
+             system_state >=3D SYS_STATE_active )
+            rebalance_irqs(cpu, true);
+        break;
     }
=20
     return notifier_from_errno(rc);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..7d877179c0 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -425,6 +425,13 @@ void __cpu_disable(void)
=20
     smp_mb();
=20
+    /*
+     * Now that the interrupts are cleared and the CPU marked as offline,
+     * move interrupts out of it
+     */
+    if ( IS_ENABLED(CONFIG_CPU_HOTPLUG) )
+        rebalance_irqs(cpu, false);
+
     /* Return to caller; eventually the IPI mechanism will unwind and the=
=20
      * scheduler will drop to the idle loop, which will call stop_cpu(). *=
/
 }
--=20
2.51.2

