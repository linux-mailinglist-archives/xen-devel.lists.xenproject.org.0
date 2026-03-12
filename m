Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO8yCe+Jsml4NQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:39:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE026FBB9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251872.1548740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW3-0003V6-Me; Thu, 12 Mar 2026 09:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251872.1548740; Thu, 12 Mar 2026 09:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW3-0003TB-Hs; Thu, 12 Mar 2026 09:39:39 +0000
Received: by outflank-mailman (input) for mailman id 1251872;
 Thu, 12 Mar 2026 09:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOdu=BM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1w0cW1-0002bV-MY
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 09:39:37 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61514148-1df7-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 10:39:35 +0100 (CET)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI0PR03MB11417.eurprd03.prod.outlook.com
 (2603:10a6:800:33f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Thu, 12 Mar
 2026 09:39:30 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::4d2f:ff40:d0ba:e581]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::4d2f:ff40:d0ba:e581%5]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 09:39:30 +0000
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
X-Inumbo-ID: 61514148-1df7-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+WkMYT1KM5f22+Jj0FFAvVtWVhZBMxi+u58C+43PXRFDafpfEGN2g69GmP+XZYMLQvNoDyNJHd6u3/N+1V58yGd1ID8TEAdFa0irOVk13lZ4uYdSt9qDeNbNIjURkYsopPXyToaj50JLw+z6OdxdAn0P0PF6rH37lVRKFveHoEIcHmv01mCwCMQ8+OGOJqYtMEqwlSIITLT/6oq/Q6CR7twr1gl5EiQb+5s5o/WC3DIGXg1aRd7ABTMsPC2lEolp0CjVp62G2OlUXAcoijGeSTSldp3oTMw07QAWGNvLCOwkeMzHxzTiS6lkcqOM3b+C34qybBnoyq7py+9BeEtUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXjlnWS1d2mnX92S2FXocUpfckS3YB00I5AeDXjGcFo=;
 b=bVmcWLeFVWppsDqse1QKkNMrjvqwUKJ7r3QnQU37Hg+9Uwx06lg40hQRcSBWqn4tthGUKV0LuWUNYTbd/pl5160ZO69a8kDivOhBUt6nQ4waGO3ps8gPrQkkTco3AWYm7unJYrQKOO02raVdbA6RGZybSZlf6mt5Z4FMmHaL3eY6ngqSxo5X1IrRM33kdaILCD5RRFQ113WnbyuU4jgMIpis6EqIvqvPjOgYZWfQAI+rMmzsMicxsJEzJg/AxO5RhHYPPUu5nS9YDAUSZsH1iWgbNc/30HwvpfspCmxR6pqeRxnywlaztdKef/YaYJNPbdlN1zlFJg7LWzHcAXiZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXjlnWS1d2mnX92S2FXocUpfckS3YB00I5AeDXjGcFo=;
 b=f7o+TjIF/G/jD0V5Ss0mVtWEpXWn7KECdKt3CNSzAkOxydDB2LZGuw9hq39WWeBiqUcUzShWc4GHZCE+0W4ULyc0GCuz6qyBCUaMQHvuiijmvJh2wngU9MsYRzXF+TuFA57zaVuNKHi/p5+oYb9LIgxptQDgG3MP/VffgjPDYGqA23Hb6mbCpmvj/iTM4DfpUyavj3a7rnLJfC0cVa/oZElGsb2rvaY6uKB7xSMVzgJTjLT2Kj6Njt6FgodsjlxmCTm/MPpFvGOU5vYnyJHnLlbzjh6FiDpYGFFistj8+YbJs1cJdk5iDYNunNayfdfXujvAegSCIeDg5hwh51F+tA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v6 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHcsgQgazJGD0vsMEiWnzOogqs2jA==
Date: Thu, 12 Mar 2026 09:39:30 +0000
Message-ID:
 <206261ba0b60ebcff25e083c22d9e9b885645199.1773307749.git.mykyta_poturai@epam.com>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1773307749.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI0PR03MB11417:EE_
x-ms-office365-filtering-correlation-id: 8e98426c-463e-411d-ae83-08de801b42e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 7m2PY5HDwEfsAkq/r+1MxQQdBPOmAfuHGYQPX4b1LpmwGXB23uKX+8pWndf+LXEve9DGtwBM/An0rT4D+PSIAt+TP6rNSCre0EaYBxICZD7Rq1jSt9lobnrQz4lzd0anVYquNWa6t84aCMnLkiHcz27t8aZ9ERtJrPQBGV+qqmIZ7IRJerL9KoxsFeUy+D4LqNymt79xTsBv64/3xbeSytQ0UxQZq/Mz19pBNg4w6J06b+PykOPQHWFYY3JjNQCg5bkjXnjFNHMZ+R71RdmeZSzpge0T6Afn10QBsnj5vOaC2idKS2oRTmB4fpzymuW830X6kVL0u4mjCJH/deUC+JdYUo1hfXRbauVX5SUee8he1t8wRD0C5GDummbxShGeaUzNQlwzL4SW3T8cSnRylxAz6TPOj4j+tTIxSaZpzdbdCIkGP+z7GMlttMEbTlKSii7rC2fXb4RmCi3Uqp/zkCHz1/ugw6MbTIb9P5BIsE8I+e37NGviCj6MssAX+muijV3faWpzjRL+xAoswany4BHjHdnria1DUsf8MO2da8Nrc6nQmJDl0sasKhvZs6uL5dM/NYs7pASV95AO0HsMtjItwIwFgrjzX3GlHzVPQx5pESHz3jyBiENO7ycL6bzR8cWjXh5HP9jS3FGSjDGfzdcjkDl7AFTy2ObHPeePQCVJq2fvVDpOffRS/WfINz/PAzlu90VfuKILrjqi5JglvPct9YZN46RUDlcyh0nOcqRDhr/6pb42W6MFkoHnQz9ECOdJgcj63ViSANAnsod920KWfNw5YBzz8U9Gb7YVZGI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?twY3bd6Jgq+LloP9D4mjppmA9QYOfWiumZITiGOSRqJo1TZECVUANQcamw?=
 =?iso-8859-1?Q?Z16MuZkpuaHBtpm8FlXYhIpInfBVRvzD0BR/xRhUWrisDZsVbDNKQpfoWe?=
 =?iso-8859-1?Q?0vAe22DsukABPC8Ms205wVM+ilkXQarL3/HrqkvFXBRFFA2LGEjnUzK4u6?=
 =?iso-8859-1?Q?00rUAMFqTDdBECgU35MVlIlfScMULX37uGeRufsV3bxCnw3v80icGNVBxi?=
 =?iso-8859-1?Q?srFmc0g85AStJXT0Px0LBZ2ifmjc6g12PAouwjOw56HW4p7pwIlo3m7kNJ?=
 =?iso-8859-1?Q?VhmOz59omzqMuJ5G1E6io2rtY8Th6EPFPQDeZnLu+rJU443bBO7+C3zhin?=
 =?iso-8859-1?Q?Selmm3kM2Cyqv8RrwK5vIq1Bx+NEn2bZvsaicVpybzs96WsSweEgtBjcyK?=
 =?iso-8859-1?Q?6vH2kBapLFeo5/+eThWdlSUiwWsyplVweGIyZBWrxhpeIIxBDDHu8unKTJ?=
 =?iso-8859-1?Q?KXvOVg1K+oT0MevQvK4oUr5jCInNCjWVfUIT00MBR7ZHgj9SfUxD3/n2DD?=
 =?iso-8859-1?Q?2JmTBEjVImLu3IAaePk+SBI+XXGni972/wqhZH4C177d03km4W9dS6aGYr?=
 =?iso-8859-1?Q?Uemd/zKb4JP9KVc7KqDanIRiD2JPtj1zqD1QtEK4f9tDgI1N1oNejaNd5+?=
 =?iso-8859-1?Q?GBvrkBAJjFgKcLb3tPp8Rts1lWCi5j0NJVkj4+ypGl7HUD1sowrwSF0rsY?=
 =?iso-8859-1?Q?4Bnn1hJa0/MLo0LBFTdlN18kq9qFozzK7/gVATbeCAAy4FrcQSK8e6H/t1?=
 =?iso-8859-1?Q?Rw0mvOaQA0H88FyGmg5NAmpeWDL6KYTJL3MHGlSazF+DSfUusjGGvV3H8/?=
 =?iso-8859-1?Q?lMzd3JPNmwj0/QHorfgtyOs453IeB9/+v0/1ongyh5GLFhjYAKkjxeJrBU?=
 =?iso-8859-1?Q?yvecmdiKJC9RqcPITHyo7VY6Q98YCxy1rh5yF1QFafMSwpyvbJvS2W7l9W?=
 =?iso-8859-1?Q?Pmfzl4Avm5qr2b05AF2MD8x+Ktb/yrPDl5GNeZLIUNocoRGLDvSUmjW/fY?=
 =?iso-8859-1?Q?nMAIxe2Gq6rCH6QG9qoIifJIsu0p5MAWr+b66TMEUL/uwTkW5x/VbyZoIe?=
 =?iso-8859-1?Q?g3clMtJkD9YydxlnBlL52t3T5btN/zF3RiXByc2jeerh/dLM09aupLu174?=
 =?iso-8859-1?Q?TWhd2JhzwsNB6d+HfA/es9bJnzriG1WDwuAmfmZTvKC1PwvXuJ9nxuMDjO?=
 =?iso-8859-1?Q?HuxfF7Wu9IXsLqDdsc9JzufGfNg4eE4D89O8a3wCTVHj6l9uJCV6xp6xN6?=
 =?iso-8859-1?Q?rldTi9a0c+rr9WvbvDrj6q4CvHnj7XgGuVvV8SVU+M46y3D4iGeCU8CZhE?=
 =?iso-8859-1?Q?bTCEz1kGxPOSKs0x7K1jRm4YuYR111/v1NlZvb7yXIwd8PF4kasTwceFTp?=
 =?iso-8859-1?Q?IPfFP0Uv6JF2mkoASqVQ1DXw9ltCY4U8Ohv/noqnVxIzOgsUZDr6TUlS+g?=
 =?iso-8859-1?Q?2MmyPbebH2fCPEqKO9OxrMW143jF0Tw6v1xRbgsXTonOl5lM10ydQC2POp?=
 =?iso-8859-1?Q?fh84JOFd7VHARiMS6OtmJO5ELPpoDTKG7kS+uQmkUvjsbiw9o1qwF8mec0?=
 =?iso-8859-1?Q?ITJWGGG2avK5EubRsgbnNMXrtGx/7tu+4NIKa3lMmyDziwLsFpGKkXZZ2v?=
 =?iso-8859-1?Q?cUsBAYhYhPC8fbdkhZsmbxRwZcHiHINcyTFH+AFcxmxLhnVRaeisSUocfL?=
 =?iso-8859-1?Q?44VWL1K5zXNC/JBR3hQ6CWV5zr994y3aBAzMPyTAJ2cbyD60vDjIeTljON?=
 =?iso-8859-1?Q?cV9d94P3/10nXuQ5dPKN+gG+KipgAqrzWtHBczG6Srf1KE42DPdsXAkLyn?=
 =?iso-8859-1?Q?0d6xK6EHORgkYgAOoCWZKYcyb/WegZA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e98426c-463e-411d-ae83-08de801b42e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 09:39:30.7757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OQZSllI+J1JDZQzb/V8FL/iLNU987vVQ0+btk69WRIXg4FehyWGNbpQPrugTN+M9eDbQpkH1YROPSd18Xv2vHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11417
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AECE026FBB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move XEN_SYSCTL_CPU_HOTPLUG_{ONLINE,OFFLINE} handlers to common code to
allow for enabling/disabling CPU cores in runtime on Arm64.

SMT-disable enforcement check is moved into a separate
architecture-specific function.

For now this operations only support Arm64. For proper Arm32 support,
there needs to be a mechanism to free per-cpu page tables, allocated in
init_domheap_mappings.  Also, hotplug is not supported if ITS, FFA, or
TEE is enabled, as they use non-static IRQ actions.

Create a Kconfig option CPU_HOTPLUG that reflects this
constraints. On X86 the option is enabled unconditionally.

As cpu hotplug now has its own config option, switch flask to allow
XEN_SYSCTL_cpu_hotplug depending on CONFIG_CPU_HOTPLUG, so it can work
not only on x86.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

---

v5->v6:
* fix style issues
* rename arch_smt_cpu_disable -> arch_cpu_can_stay_online and invert the
  logic
* use IS_ENABLED istead of ifdef
* remove explicit list af arch-specific SYSCTL_CPU_HOTPLUG_* options
  from the common handler
* fix flask issue

v4->v5:
* move handling to common code
* rename config to CPU_HOTPUG
* merge with "smp: Move cpu_up/down helpers to common code"

v3->v4:
* don't reimplement cpu_up/down helpers
* add Kconfig option
* fixup formatting

v2->v3:
* no changes

v1->v2:
* remove SMT ops
* remove cpu =3D=3D 0 checks
* add XSM hooks
* only implement for 64bit Arm
---
 xen/arch/arm/smp.c                |  9 ++++++
 xen/arch/ppc/stubs.c              |  4 +++
 xen/arch/riscv/stubs.c            |  5 ++++
 xen/arch/x86/include/asm/smp.h    |  3 --
 xen/arch/x86/platform_hypercall.c | 12 ++++++++
 xen/arch/x86/smp.c                | 33 ++--------------------
 xen/arch/x86/sysctl.c             | 21 ++++++++------
 xen/common/Kconfig                |  6 ++++
 xen/common/smp.c                  | 35 +++++++++++++++++++++++
 xen/common/sysctl.c               | 46 +++++++++++++++++++++++++++++++
 xen/include/xen/smp.h             |  4 +++
 xen/xsm/flask/hooks.c             |  2 +-
 12 files changed, 137 insertions(+), 43 deletions(-)

diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index b372472188..984f863a9a 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -44,6 +44,15 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     }
 }
=20
+/*
+ * We currently don't support SMT on ARM so we don't need any special logi=
c for
+ * CPU disabling
+ */
+bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index a333f06119..8f280ba080 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -101,6 +101,10 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
     BUG_ON("unimplemented");
 }
=20
+bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index daadff0138..7c3cda7bc5 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -70,6 +70,11 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     BUG_ON("unimplemented");
 }
=20
+bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.=
h
index 3f16e62696..cb3e0fed19 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -50,9 +50,6 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t =
pxm);
=20
 void __stop_this_cpu(void);
=20
-long cf_check cpu_up_helper(void *data);
-long cf_check cpu_down_helper(void *data);
-
 long cf_check core_parking_helper(void *data);
 bool core_parking_remove(unsigned int cpu);
 uint32_t get_cur_idle_nums(void);
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hype=
rcall.c
index cd4f0ae5e5..e745151790 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -735,6 +735,12 @@ ret_t do_platform_op(
     {
         int cpu =3D op->u.cpu_ol.cpuid;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         ret =3D xsm_resource_plug_core(XSM_HOOK);
         if ( ret )
             break;
@@ -761,6 +767,12 @@ ret_t do_platform_op(
     {
         int cpu =3D op->u.cpu_ol.cpuid;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         ret =3D xsm_resource_unplug_core(XSM_HOOK);
         if ( ret )
             break;
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 7936294f5f..b781e933f2 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -418,35 +418,8 @@ void cf_check call_function_interrupt(void)
     smp_call_function_interrupt();
 }
=20
-long cf_check cpu_up_helper(void *data)
+bool arch_cpu_can_stay_online(unsigned int cpu)
 {
-    unsigned int cpu =3D (unsigned long)data;
-    int ret =3D cpu_up(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_up(cpu);
-
-    if ( !ret && !opt_smt &&
-         cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &&
-         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
-    {
-        ret =3D cpu_down_helper(data);
-        if ( ret )
-            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
-        else
-            ret =3D -EPERM;
-    }
-
-    return ret;
-}
-
-long cf_check cpu_down_helper(void *data)
-{
-    int cpu =3D (unsigned long)data;
-    int ret =3D cpu_down(cpu);
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_down(cpu);
-    return ret;
+    return opt_smt || cpu_data[cpu].compute_unit_id !=3D INVALID_CUID ||
+           cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) <=3D 1;
 }
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1b04947516..35239b73c1 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -49,6 +49,7 @@ static void cf_check l3_cache_get(void *arg)
=20
 static long cf_check smt_up_down_helper(void *data)
 {
+    #ifdef CONFIG_CPU_HOTPLUG
     bool up =3D (bool)data;
     unsigned int cpu, sibling_mask =3D boot_cpu_data.x86_num_siblings - 1;
     int ret =3D 0;
@@ -89,6 +90,8 @@ static long cf_check smt_up_down_helper(void *data)
                up ? "enabled" : "disabled", CPUMASK_PR(&cpu_online_map));
=20
     return ret;
+    #endif /* CONFIG_CPU_HOTPLUG */
+    return 0;
 }
=20
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
@@ -115,24 +118,24 @@ long arch_do_sysctl(
=20
     case XEN_SYSCTL_cpu_hotplug:
     {
-        unsigned int cpu =3D sysctl->u.cpu_hotplug.cpu;
         unsigned int op  =3D sysctl->u.cpu_hotplug.op;
         bool plug;
         long (*fn)(void *data);
         void *hcpu;
=20
-        switch ( op )
+        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
         {
-        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
-            plug =3D true;
-            fn =3D cpu_up_helper;
-            hcpu =3D _p(cpu);
+            ret =3D -EOPNOTSUPP;
             break;
+        }
=20
+        switch ( op )
+        {
+        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
         case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
-            plug =3D false;
-            fn =3D cpu_down_helper;
-            hcpu =3D _p(cpu);
+            /* Handled by common code */
+            ASSERT_UNREACHABLE();
+            ret =3D -EOPNOTSUPP;
             break;
=20
         case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d7e79e752a..bb73990355 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -637,6 +637,12 @@ config SYSTEM_SUSPEND
=20
 	  If unsure, say N.
=20
+config CPU_HOTPLUG
+	bool "Enable CPU hotplug"
+	depends on (X86 || ARM_64) && !FFA && !TEE && !HAS_ITS
+	default y
+
+
 menu "Supported hypercall interfaces"
 	visible if EXPERT
=20
diff --git a/xen/common/smp.c b/xen/common/smp.c
index a011f541f1..e2bf82856e 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
=20
+#include <xen/cpu.h>
 #include <asm/hardirq.h>
 #include <asm/processor.h>
 #include <xen/spinlock.h>
@@ -104,6 +105,40 @@ void smp_call_function_interrupt(void)
     irq_exit();
 }
=20
+#ifdef CONFIG_CPU_HOTPLUG
+long cf_check cpu_up_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_up(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_up(cpu);
+
+    if ( !ret && !arch_cpu_can_stay_online(cpu) )
+    {
+        ret =3D cpu_down_helper(data);
+        if ( ret )
+            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
+        else
+            ret =3D -EPERM;
+    }
+
+    return ret;
+}
+
+long cf_check cpu_down_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_down(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_down(cpu);
+    return ret;
+}
+#endif /* CONFIG_CPU_HOTPLUG */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..51a3dd699a 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -483,6 +483,52 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_=
sysctl)
             copyback =3D 1;
         break;
=20
+    case XEN_SYSCTL_cpu_hotplug:
+    {
+        unsigned int cpu =3D op->u.cpu_hotplug.cpu;
+        unsigned int hp_op =3D op->u.cpu_hotplug.op;
+        bool plug;
+        long (*fn)(void *data);
+        void *hcpu;
+
+        ret =3D -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
+            break;
+
+        switch ( hp_op )
+        {
+        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
+            plug =3D true;
+            fn =3D cpu_up_helper;
+            hcpu =3D _p(cpu);
+            break;
+
+        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
+            plug =3D false;
+            fn =3D cpu_down_helper;
+            hcpu =3D _p(cpu);
+            break;
+
+        default:
+            fn =3D NULL;
+            break;
+        }
+
+        if ( fn )
+        {
+            ret =3D plug ? xsm_resource_plug_core(XSM_HOOK)
+                       : xsm_resource_unplug_core(XSM_HOOK);
+
+            if ( !ret )
+                ret =3D continue_hypercall_on_cpu(0, fn, hcpu);
+
+            break;
+        }
+
+        /* Use the arch handler for cases not handled here */
+        fallthrough;
+    }
+
     default:
         ret =3D arch_do_sysctl(op, u_sysctl);
         copyback =3D 0;
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfc..04530738c9 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -76,4 +76,8 @@ extern void *stack_base[NR_CPUS];
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
=20
+bool arch_cpu_can_stay_online(unsigned int cpu);
+long cf_check cpu_up_helper(void *data);
+long cf_check cpu_down_helper(void *data);
+
 #endif /* __XEN_SMP_H__ */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b250b27065..36d357cae8 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -835,7 +835,7 @@ static int cf_check flask_sysctl(int cmd)
     case XEN_SYSCTL_getdomaininfolist:
     case XEN_SYSCTL_page_offline_op:
     case XEN_SYSCTL_scheduler_op:
-#ifdef CONFIG_X86
+#ifdef CONFIG_CPU_HOTPLUG
     case XEN_SYSCTL_cpu_hotplug:
 #endif
         return 0;
--=20
2.51.2

