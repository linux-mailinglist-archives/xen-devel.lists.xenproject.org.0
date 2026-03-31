Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IGmFusoy2n/EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86DA3632D0
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268293.1557703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHS-0005ca-AJ; Tue, 31 Mar 2026 01:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268293.1557703; Tue, 31 Mar 2026 01:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHQ-0005I2-St; Tue, 31 Mar 2026 01:52:32 +0000
Received: by outflank-mailman (input) for mailman id 1268293;
 Tue, 31 Mar 2026 01:52:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OHJ-0003xy-Mx
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OHJ-00HCwd-1g
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb2873-e002-0a2a0a5209dd-0a2a450ba5e2-44
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:25 +0200
Received: from [52.101.69.102]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28d8-ef63-0a2a450b0019-34654566fbfa-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:24 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:22 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:22 +0000
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
 b=ws6PUbXKGGRlZaBlFrjlff9zr+s1xpZE3U1hxDkbttsanRnjfGJNqKrRcByRQXfu7b8D4yseUYC4Hfv/KSf0hIPpOLwh4Hbu0uz7etIx4CfTbTohYCgJaVPeAZq8+k5oWGZvkWFaRscx+xH+cK4MSPbrW2bL5Eza5e5bEWHDWBq+Vrk7pKbMsJEH1QiN5pbhK/ilEyU55v0O8htI521g/j6FHuDCgNx9Yf4KZLnqnFuxtLudKr+mM5i+6J4iRe4TPsWcmEtnOfSHd9fD1Vaxw5h4dqvgpn4hYkF+J3Rbg2+Bw2NCrcHvB8NRhLRHUPK2EWLhrJczD/WdZCITfo40mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nj6Z81N01vY3XvfYQy+xhGlOvhCvIFvRcD16AMxsTXg=;
 b=s+gd5PSO457PO0gfIW5IqoLPqF+NCfNs1bIgvYExrrWPtDYywjb18YB4QuqEyHPWW2FaE577DgeEACEgQ+b5I6cjIXmi4igItU078aHvLQ9GCvmmda76QQMNdxSU4oq/wKbQafEoZ1YLJbUHP8zEW5L2X99WGuBVB0hcttxIj212mMSH6TAZJ3jO1tz6kP/UlpJaesWPW4LSSAPgWy8XB1lNS9EJE2zNiAYQ9mCImYdE2j0xwLKe+OtmdT07+0QmMdpNAes04da8TEtnj3spJFVAsOrEH6yQlDMpTIG3xKxElu73u1753q6t+rGpTYMuBMS2SwFKE+9IAo9l15i55Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nj6Z81N01vY3XvfYQy+xhGlOvhCvIFvRcD16AMxsTXg=;
 b=s6/KERyy3wuzd+j0K0XyC8g71kVxwQGCJxtd/ekw3weR8Iet5bovlLq0rGf4W2l+OjTYV85iBIa3SCVKx70lNJPD+RJCtjpbF1qK4uy3j05ahujvDAS9ETTnXdxiMYTqeeVMpgug6YP93q5jESBaqMRS0a0NlDb2tE3jI/JUuo/LudkmumPNa/TQfa2GjH6K8HFULdfCXjBhpHkNinHKOvTZZwQV+nh04A4QgKnz7g5WeAd5iz1vWeOpqmNpRMiigi+Ue3lH6eMvNhydWn73oxrQgQq84zryw++9CojXtGHyOwWtvPujbxjr1wV/QCjjooNk8iWn/hm9fP8jaoiqww==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v3 22/23] libxl/arm: Introduce domctl command for IOMMU
 vSID/vRID mapping
Thread-Topic: [PATCH v3 22/23] libxl/arm: Introduce domctl command for IOMMU
 vSID/vRID mapping
Thread-Index: AQHcwLEEe+7BrcQh2EWF8RsNhJr7LQ==
Date: Tue, 31 Mar 2026 01:52:22 +0000
Message-ID:
 <9db4c7b985de8cafacf778c41c35699f2ef07fe2.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|GVXPR03MB11035:EE_
x-ms-office365-filtering-correlation-id: 804f03c1-f56b-4395-cb4d-08de8ec8268f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Yz/X4i7nCApIpbIywaDfpjPLI+BPnPTmMhB5enAXvhMGoEFE7hx8DaVqg0di986D2holyvsUy5uVp32c90PFTwvUQLeFbkzQeCROe0Dv+GUYbNjDKyZk4uM87HiEjbYJSx950XH1Kd4OggZIHxmNN5IYBX5vDTf8fCgDuy575u5DvIx35Oxzr/uo3yEmpOz2CzWrd8ZwjgEmmafPoKF78SjejlQmjtlz4ef8e6zbD1iXgUzmMHmsW6qL8G9Z4K2C0k+PksV7dDmHYq1IXYp/PiRkx8mTij/JjiH6nd4nmFwmgSFZtOOu7CohTok5BNy7puoQKcMoaDNZuBNM846YEJ+E9uQ3ke3FLfxX5LDnlxHhzzV/kDpMblJmMDe6zVljvE0hxs80dk7xgvThErJSCJhbChWBsmanpSsG9gyaLrtSKJXoPkBXCVGxhgHgC/wEGdSb0rov3lg6QTnwbwM24usHSa6/3ZrfMr6IjSHzmaBCxhtd+YYuHbxQ67wMtp1JcPJx/C2bCqUKJAsiAvuEIaY1nAz1y3VczC4RVXWF+N0uAXmprjzrO0v4T8Nd8Ip2Dvpoze0c3+fT374LfM7/BFRg23uZcOVzPxcZfi295Q/9p8pciVuOt11XvygMgUGs8ZiDuh6sg0I9tKfwu1UmzeVoZPd7qBXOiLM6ICe3P+Wc0B5mmyIO25Fm7KEIu3fnyqSQV1KXFuvxUhLVGh4b2Tu5ZNOgUVdFBFL8xe7f6K7Mj9ZOuDOXgUKzo7mSS/oRQm1nsnyrLLwbwAr3rrutZK/QEWC7q+fNI/Gk1V9mTto=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yisMQU7nZE43+sOI4RfpQRzMulELgvCfGseOWpQKnfq3AWTqcgjc+3Kojc?=
 =?iso-8859-1?Q?9Sz0o1S6t9QUQe4IF4DMqsO9qhJbyp8dzPQuWZ6JswK/6zKYODSm1TJVS/?=
 =?iso-8859-1?Q?dMd//sKl8lNapBZt7XxBMhJ/XzzBsfdvGIgb2PAoY1TQZWACUeGVzaNyC1?=
 =?iso-8859-1?Q?FLl3zaI1tKBIosvg8DtJYBmIq92WgHzwMIqRM11uvJb5QF+AXBcIlVFYHW?=
 =?iso-8859-1?Q?2M4HzWeZIAWgTKFff240O83IlMegqWRTJ62lbl59NZ7o9DG+f8R1LIiZeL?=
 =?iso-8859-1?Q?YC9qd/Ywfs0mzOmKkD9L0UN9cb9P8aG19U6CyI1357AsEjfOHPUzEMRB+K?=
 =?iso-8859-1?Q?o1rKoxmroy3ePpuJQ/yZUWbmqEn6qgVTVQTD/ID0QpfYiZCd0rJW+Bu+s0?=
 =?iso-8859-1?Q?k7PpAUxksq7jm4+tlJvD6iGv7yeqyXOT9gWttU2RcEhj3PITDhlVMbQKg7?=
 =?iso-8859-1?Q?fHUIgm2CalL5PPbtQQib7OqMoJiDd4qULEFyVwGB2UhRlicpy3G88TT12V?=
 =?iso-8859-1?Q?+n78Q4lvYR/JQaTIbbqXUG4Qn7CQDYc2GkvcAzlY45L0RYQPEXR6ZH25xP?=
 =?iso-8859-1?Q?33251rh1Ao2MnmuxpQPRU4OqGx+BNFHVFcONke3tiEj+VwO+xYqIWsc0D+?=
 =?iso-8859-1?Q?0yE7AC2b7Urr0zb2eziZlAP1vq2jWa0N6FT8Lic3st2ao8cR0U/q7ztoQc?=
 =?iso-8859-1?Q?B7eT8k5aMp9tKcuaOkeQyDxwkGdduk7E5+6+eNvPJvW35fq6YGzNuTsCga?=
 =?iso-8859-1?Q?pXovEfurt0kiwpfkHn1k6hchVljRcEl6BGJ7ljpd891zR+7Zob4O7aZuHI?=
 =?iso-8859-1?Q?nFYqdJbxcFuaka4jNl2b05htkanLDoWp4NWQw2nL1UYddzvzj7jMzhJ35+?=
 =?iso-8859-1?Q?ejiAJYwCMDQS9fXqPJAgiPWt3rr64X6ILLsXTsWLipDWiXqfmRGipQq4Z2?=
 =?iso-8859-1?Q?KW8gsusU1uArOVXzLuBw2WSmFQ0j0rG1ODSyRdAd9oPSgZX3qaS9ftqxvC?=
 =?iso-8859-1?Q?gdRI4SaJ8Norp/XhI1KbDEB2/YTzoaWDF9HiA+fCgJsu8MtcwQw4OVJ8/0?=
 =?iso-8859-1?Q?SIoC0uvnMTAPt7kNw/wPiG5l7A2oyfe0w3ybYdIqezDJIGNaOAXYSAelZq?=
 =?iso-8859-1?Q?OMMjhldckYJcncl7fTK41YU5MEylvvz50xSfm6Nvhrzx3xilkxO5V3ZS9I?=
 =?iso-8859-1?Q?4ybDhdxZxyuhgU8gfHDa4dF0gF5Gbd9sBn8TpeMZuHWybzEMBZQN4SGiNS?=
 =?iso-8859-1?Q?WaAXp1I/K8UA0zmO7+7k0XOTktXfTi9WHVaOdMQkw6AmSzUIdwg6UD7Ht2?=
 =?iso-8859-1?Q?L51VmsZy52mNVvmyBBeq+eIQA2LOZ0OhYJNYbQ8rp11sdcKdbfNY+OWM3y?=
 =?iso-8859-1?Q?jLoXed/DO9Xfr4jKV2XCAvEfUP6WuNm9omHQP6P32E4JjkqU2IGNZVWYmI?=
 =?iso-8859-1?Q?AZiN1gLkaCDVM6C709o86FMlh0hBHC9jjekC6FEGIQwmL+GP/JDjAoY6n7?=
 =?iso-8859-1?Q?Dk0THu8UVylr0DgYWJ9O6ToXSzGRe7I4kOSALWy+rIyyU/cRHpFWh8rt8S?=
 =?iso-8859-1?Q?qZXwow5ppxQr5FGSVcdsl8wR07Pps+WcWc/NcBdSYS5XggwuZicl8JKrFC?=
 =?iso-8859-1?Q?dFCaixpB0VKn3JsQSjs7PhOWu6s9+xaDfcMnZ31VLVIfP5pUTOmjZxf2jE?=
 =?iso-8859-1?Q?Ft8u82SFqbLEPdNjBpOB9C8d/C//Mn9+dN+RVL5bhevjcWZpfMFzF1OW7H?=
 =?iso-8859-1?Q?xo+I7cxZzrvjsDqDn4xr7OHfceUy9uHD7wlz9kQBsUDPle22njqP56eLdY?=
 =?iso-8859-1?Q?3UPjzHrymwjyXgwdbRpsCuNYiKVguHw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804f03c1-f56b-4395-cb4d-08de8ec8268f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:22.4564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GHnZjfP09eRHyRfFUO5922MsEUCGb7kImApF59E8PQOi73qe32K6qHPVku1phlUxwps0HXA2J82Zl4NaC8nXmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-42698a/1774921945-A0C05112-B9E7E765/0/0
X-purgate-type: clean
X-purgate-size: 14731
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:milan_djokic@epam.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E86DA3632D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For guests created via control domain (xl, zephyr xenlib), partial device
tree is parsed and loaded on control domain side.
SIDs in guests device tree have to be replaced with
virtual SIDs which are mapped to physical SIDs. In order
to do that, control domain has to request from Xen to create
a new vSID and map it to original pSID for every guest device IOMMU
stream ID. For this purpose, new domctl command (XEN_DOMCTL_viommu_allocate=
_vid)
is introduced which control domain can use to request a new vSID mapping an=
d
insert a new vSID into guest device tree once mapped.
Requested vSID allocation using this interface for vPCI/DT devices.

Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/include/xenctrl.h             |  12 +++
 tools/libs/ctrl/xc_domain.c         |  23 +++++
 tools/libs/light/libxl_arm.c        | 127 +++++++++++++++++++++++++---
 xen/arch/arm/domctl.c               |  34 ++++++++
 xen/include/public/domctl.h         |  20 +++++
 xen/xsm/flask/hooks.c               |   4 +
 xen/xsm/flask/policy/access_vectors |   2 +
 7 files changed, 212 insertions(+), 10 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index d5dbf69c89..61be892cc8 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2659,6 +2659,18 @@ int xc_domain_set_llc_colors(xc_interface *xch, uint=
32_t domid,
                              const uint32_t *llc_colors,
                              uint32_t num_llc_colors);
=20
+/*
+ * Allocate guest IOMMU vSID and establish its mapping to pSID.
+ * It can only be used on domain DT creation.
+ * Currently used for ARM only, possibly for RISC-V in the
+ * future. Function has no effect for x86.
+ */
+int xc_domain_viommu_allocate_vsid_range(xc_interface *xch,
+                                         uint32_t domid,
+                                         uint16_t nr_sids,
+                                         uint32_t first_psid,
+                                         uint32_t *first_vsid);
+
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 01c0669c88..39ffe80e6d 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -2222,6 +2222,29 @@ out:
=20
     return ret;
 }
+
+int xc_domain_viommu_allocate_vsid_range(xc_interface *xch,
+                                         uint32_t domid,
+                                         uint16_t nr_sids,
+                                         uint32_t first_psid,
+                                         uint32_t *first_vsid)
+{
+    int err;
+    struct xen_domctl domctl =3D {};
+
+    domctl.cmd =3D XEN_DOMCTL_viommu_alloc_vsid_range;
+    domctl.domain =3D domid;
+    domctl.u.viommu_alloc_vsid_range.first_psid =3D first_psid;
+    domctl.u.viommu_alloc_vsid_range.nr_sids =3D nr_sids;
+
+    if ( (err =3D do_domctl(xch, &domctl)) !=3D 0 )
+        return err;
+
+    *first_vsid =3D domctl.u.viommu_alloc_vsid_range.first_vsid;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 7b887898bb..79904b746c 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -955,6 +955,13 @@ static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
     return 0;
 }
=20
+/*
+ * Stores starting vSID of vPCI IOMMU SID range
+ * Used as a lookup value to avoid repeated
+ * vSID range allocation on every fdt resize.
+ */
+static int vpci_first_vsid =3D -1;
+
 static int make_vpci_node(libxl__gc *gc, void *fdt,
                           const struct arch_info *ainfo,
                           struct xc_dom_image *dom)
@@ -963,6 +970,9 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
     const uint64_t vpci_ecam_base =3D GUEST_VPCI_ECAM_BASE;
     const uint64_t vpci_ecam_size =3D GUEST_VPCI_ECAM_SIZE;
     const char *name =3D GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
+    uint16_t iommu_range_size =3D 0x1000;
+    uint32_t first_vsid;
+    uint32_t first_psid =3D 0;
=20
     res =3D fdt_begin_node(fdt, name);
     if (res) return res;
@@ -996,8 +1006,20 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
         GUEST_VPCI_PREFETCH_MEM_SIZE);
     if (res) return res;
=20
+    /* request vSID range allocation if not already allocated */
+    if (vpci_first_vsid < 0) {
+        res =3D xc_domain_viommu_allocate_vsid_range(CTX->xch, dom->guest_=
domid,
+            iommu_range_size, first_psid, &first_vsid);
+        if (res)
+            return res;
+        vpci_first_vsid =3D first_vsid;
+    }
+    else {
+        first_vsid =3D vpci_first_vsid;
+    }
+
     res =3D fdt_property_values(gc, fdt, "iommu-map", 4, 0,
-                              GUEST_PHANDLE_VSMMUV3, 0, 0x10000);
+                             GUEST_PHANDLE_VSMMUV3, first_vsid, iommu_rang=
e_size);
     if (res) return res;
=20
     res =3D fdt_end_node(fdt);
@@ -1326,11 +1348,92 @@ static int copy_partial_fdt(libxl__gc *gc, void *fd=
t, void *pfdt)
     return 0;
 }
=20
-static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+/*
+ * Store virtualized 'iommus' properties for every node attached to IOMMU
+ * and passthroughed to guest.
+ * Used as a lookup table for mapping <phandle pSID> -> <vhandle vSID>
+ */
+struct viommu_stream {
+    XEN_LIST_ENTRY(struct viommu_stream) entry;
+    char path[128];          /* DT path, stable across resizes */
+    fdt32_t *iommus;         /* fully virtualized iommus property */
+};
+
+static XEN_LIST_HEAD(, struct viommu_stream) viommu_stream_list;
+
+/*
+ * Helper function which creates mapping of dt node to
+ * to virtualized 'iommus' property
+ * Mappings stored in a global 'viommu_stream_list' to
+ * make it reusable for every fdt resize
+ */
+static int viommu_get_stream(libxl__gc *gc,
+                             uint32_t domid,
+                             const fdt32_t *prop,
+                             int proplen,
+                             const char* path, fdt32_t **iommus)
+{
+    int i, r;
+    uint32_t vsid, psid;
+    struct viommu_stream *viommu_stream;
+
+    /* Lookup if stream for target device is already allocated */
+    XEN_LIST_FOREACH(viommu_stream, &viommu_stream_list, entry)
+    {
+        if (!strcmp(viommu_stream->path, path)) {
+            *iommus =3D viommu_stream->iommus;
+            return 0;
+        }
+    }
+
+    /* Allocate new viommu stream */
+    viommu_stream =3D malloc(sizeof(struct viommu_stream));
+    if (!viommu_stream)
+        return ERROR_NOMEM;
+    memset(viommu_stream, 0, sizeof(struct viommu_stream));
+    viommu_stream->iommus =3D malloc(proplen);
+    if (!viommu_stream->iommus)
+        return ERROR_NOMEM;
+    memset(viommu_stream->iommus, 0, proplen);
+
+    LOG(DEBUG, "Creating vIOMMU stream for device %s",
+        path);
+
+    /*
+     * Virtualize device "iommus" property
+     * (replace pIOMMU with vIOMMU phandle and pSIDs with mapped vSIDs)
+     */
+    for (i =3D 0; i < proplen / 8; ++i) {
+        viommu_stream->iommus[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV=
3);
+        /* Allocate new vSID mapped to pSID */
+        psid =3D fdt32_to_cpu(prop[i * 2 + 1]);
+        r =3D xc_domain_viommu_allocate_vsid_range(CTX->xch, domid, 1, psi=
d, &vsid);
+        if (r) {
+            LOG(ERROR, "Can't allocate new vSID/vRID for guest IOMMU devic=
e");
+            return r;
+        }
+        viommu_stream->iommus[i * 2 + 1] =3D cpu_to_fdt32(vsid);
+        LOG(DEBUG, "Mapped vSID: %u to pSID: %u", vsid, psid);
+    }
+
+    strcpy(viommu_stream->path, path);
+    *iommus =3D  viommu_stream->iommus;
+
+    XEN_LIST_INSERT_HEAD(&viommu_stream_list, viommu_stream, entry);
+
+    return 0;
+}
+
+/*
+ * Used to update partial fdt when vIOMMU is enabled
+ * Maps dt properties of IOMMU devices to virtual IOMMU
+ */
+static int viommu_modify_partial_fdt(libxl__gc *gc, void *pfdt, uint32_t d=
omid)
 {
-    int nodeoff, proplen, i, r;
+    int nodeoff, proplen, r;
     const fdt32_t *prop;
     fdt32_t *prop_c;
+    char path[128];
=20
     nodeoff =3D fdt_path_offset(pfdt, "/passthrough");
     if (nodeoff < 0)
@@ -1344,11 +1447,16 @@ static int modify_partial_fdt(libxl__gc *gc, void *=
pfdt)
         if (!prop)
             continue;
=20
-        prop_c =3D libxl__zalloc(gc, proplen);
+        r =3D fdt_get_path(pfdt, nodeoff, path, sizeof(path));
+        if ( r < 0 ) {
+            LOG(ERROR, "Can't get passthrough node path");
+            return r;
+        }
=20
-        for (i =3D 0; i < proplen / 8; ++i) {
-            prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
-            prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+        r =3D viommu_get_stream(gc, domid, prop, proplen, path, &prop_c);
+        if (r) {
+            LOG(ERROR, "Can't get viommu stream");
+            return r;
         }
=20
         r =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
@@ -1360,7 +1468,6 @@ static int modify_partial_fdt(libxl__gc *gc, void *pf=
dt)
=20
     return 0;
 }
-
 #else
=20
 static int check_partial_fdt(libxl__gc *gc, void *fdt, size_t size)
@@ -1379,7 +1486,7 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt,=
 void *pfdt)
     return -FDT_ERR_INTERNAL;
 }
=20
-static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+static int viommu_modify_partial_fdt(libxl__gc *gc, void *pfdt, uint32_t d=
omid)
 {
     LOG(ERROR, "partial device tree not supported");
=20
@@ -1511,7 +1618,7 @@ next_resize:
         if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3) {
             FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
             if (pfdt)
-                FDT( modify_partial_fdt(gc, pfdt) );
+                FDT( viommu_modify_partial_fdt(gc, pfdt, dom->guest_domid)=
 );
         }
=20
         for (i =3D 0; i < d_config->num_disks; i++) {
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad914c915f..c85853e4cb 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -16,6 +16,7 @@
 #include <xen/types.h>
 #include <xsm/xsm.h>
 #include <public/domctl.h>
+#include <asm/viommu.h>
=20
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info)
@@ -179,6 +180,39 @@ long arch_do_domctl(struct xen_domctl *domctl, struct =
domain *d,
     }
     case XEN_DOMCTL_dt_overlay:
         return dt_overlay_domctl(d, &domctl->u.dt_overlay);
+
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+    case XEN_DOMCTL_viommu_alloc_vsid_range:
+    {
+        int rc =3D 0;
+        uint16_t i;
+        uint32_t vsid;
+        struct xen_domctl_viommu_alloc_vsid_range *viommu_alloc_vsid_range=
 =3D
+            &domctl->u.viommu_alloc_vsid_range;
+
+        if ( viommu_alloc_vsid_range->pad )
+            return -EINVAL;
+
+        for ( i =3D 0; i < viommu_alloc_vsid_range->nr_sids; i++ )
+        {
+            rc =3D viommu_allocate_free_vid(d, viommu_alloc_vsid_range->fi=
rst_psid
+                                            + i, &vsid);
+            if( rc )
+                return rc;
+        }
+
+        if ( !rc )
+        {
+            /* Calculate first vSID from allocated range */
+            viommu_alloc_vsid_range->first_vsid =3D vsid -
+                viommu_alloc_vsid_range->nr_sids + 1;
+            rc =3D copy_to_guest(u_domctl, domctl, 1);
+        }
+
+        return rc;
+    }
+#endif
+
     default:
         return subarch_do_domctl(domctl, d, u_domctl);
     }
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 23124547f3..190aed1e59 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1276,6 +1276,24 @@ struct xen_domctl_get_domain_state {
     uint64_t unique_id;      /* Unique domain identifier. */
 };
=20
+/*
+ * XEN_DOMCTL_viommu_alloc_vsid_range
+ *
+ * Allocate guest vSID range and
+ * establish pSID->vSID mapping for target range.
+ * Allocated range is continous
+ */
+struct xen_domctl_viommu_alloc_vsid_range {
+    /* IN: Range first pSID  */
+    uint32_t first_psid;
+    /* IN: Number of vSIDs to allocate */
+    uint16_t nr_sids;
+    /* padding, must be 0 */
+    uint16_t pad;
+    /* OUT: Mapped range first vSID */
+    uint32_t first_vsid;
+};
+
 struct xen_domctl {
 /* Stable domctl ops: interface_version is required to be 0.  */
     uint32_t cmd;
@@ -1368,6 +1386,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_set_llc_colors                89
 #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
+#define XEN_DOMCTL_viommu_alloc_vsid_range       91
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1436,6 +1455,7 @@ struct xen_domctl {
 #endif
         struct xen_domctl_set_llc_colors    set_llc_colors;
         struct xen_domctl_get_domain_state  get_domain_state;
+        struct xen_domctl_viommu_alloc_vsid_range viommu_alloc_vsid_range;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b250b27065..91e80ea80d 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -820,6 +820,10 @@ static int cf_check flask_domctl(struct domain *d, uns=
igned int cmd,
     case XEN_DOMCTL_set_llc_colors:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SET_LLC_COLO=
RS);
=20
+    case XEN_DOMCTL_viommu_alloc_vsid_range:
+        return current_has_perm(d, SECCLASS_DOMAIN2,
+            DOMAIN2__VIOMMU_ALLOC_VSID_RANGE);
+
     default:
         return avc_unknown_permission("domctl", cmd);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/acc=
ess_vectors
index ce907d50a4..e4ffe2f5db 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -255,6 +255,8 @@ class domain2
     set_llc_colors
 # XEN_DOMCTL_get_domain_state
     get_domain_state
+# XEN_DOMCTL_viommu_alloc_vsid_range
+    viommu_alloc_vsid_range
 }
=20
 # Similar to class domain, but primarily contains domctls related to HVM d=
omains
--=20
2.43.0

