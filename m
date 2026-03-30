Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMymHNNlymmK8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70B35AB86
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267448.1556935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHf-0000Hs-B4; Mon, 30 Mar 2026 11:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267448.1556935; Mon, 30 Mar 2026 11:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHf-0000FH-5W; Mon, 30 Mar 2026 11:59:55 +0000
Received: by outflank-mailman (input) for mailman id 1267448;
 Mon, 30 Mar 2026 11:59:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w7BHc-0000F3-TR
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:59:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BHb-003QIn-Ua
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:59:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65a8-2eae-0a2a0a5409dd-0a2a4509bac8-38
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:51 +0200
Received: from [52.101.66.84]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65b7-e484-0a2a45090019-34654254c0bd-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:51 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6847.eurprd03.prod.outlook.com
 (2603:10a6:102:eb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:59:49 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:59:49 +0000
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
 b=BwPh2pPLeNyySPkiQaNd8fxmzTf+vZuT/R8mdzKu8rbDFXkDGdSvjUuBQ2dFGdI8koRQDXFKwhOuS96JYkUVrd/ylrQ15YmQkmanUaAK15OGSl1sLxYgeRBZojrutNd6wp/H5w1c/fad9ZnAgNGOme1lN5Jr0E8caqnAqXPHkIdEyF2j9cgk0ldHmbw8DddHJ9eF6qoU5Js/xSm9HXzXdTqrLd8z4B3KDbcDFF5k3VJ8lokoObkV2sfJHA9YO7CJEBrTJBW9+kbqdgaS9beFGEWtDx9y7RZ0ypeYizbbiCh5d1tqfzXawbXFEsjhTrtZKbtlCLDUzEjRWiYUy9w3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQjhq1ZOYxXuFsg+35Krc2rMKNWMSZXODxY3onBl7+c=;
 b=ZgHtO57SnnMmKHTMUVIlZEwUxbzQUBdixYANRkJnw10twlMP6mTs1xhuxlfsQejwHPCuoSYeRirHHIPNxKJRZK9q4eNM/Jb4UJjNnOu5kA6XnXtj47NC46n2sWaOAzHtPgwtmU+ms2i2JExfmr7/adsC73NMhND/yNsz3hZ6oZw0vSgkjAl3Qk9KLxr+3QdJ+lL3YDpauZDlb4TUf+qktYfRCihdJjovP4E4pbs/DTI/JbCvioPlA9lyFFWupcIDu6iPWdvqvfbSbf1DarpPMyfvCu/CJ2SV4tSxWVbWhbCdboDGZijVdilSX5voLdSVlN3/iwU/j/UClwQAVNxlNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQjhq1ZOYxXuFsg+35Krc2rMKNWMSZXODxY3onBl7+c=;
 b=t5zJc7fgDX9LbJ8D/2ZpK8HrQKs7r+uHtQbt8bOKSUmirply/3dC+QrDaamcrozoKn0bPmFbnyUJHchtMC5NhEqZE0ykqMcwj8jk5LJ1KgVSUP/owpYpnmT8Hp/IDE+TstXAw+e/x5+J4TK+oWoOm9ETOcaL0+hmCS/txm8lek95nOK3HUALNDXKB93ibuivE6uv5DtBcxEXgOpRKAK6Qwd/gJIO9SanEwl3/wgzRctk9dQ3XsrTjl4UY4UhDAclosc2B/ZUC0YAa60fbQNNUpTxOp5IJFv+m8Qbp269WxrzC3RnTPo5isijCfSpOW9OQo1X10acxD7L5E306fALqw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Timothy
 Pearson <tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 0/6] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v7 0/6] Implement CPU hotplug on Arm
Thread-Index: AQHcwDy1/SbobzFSYEOfZMP9koGeVg==
Date: Mon, 30 Mar 2026 11:59:49 +0000
Message-ID: <cover.1774871881.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6847:EE_
x-ms-office365-filtering-correlation-id: 03c07f55-5c41-4716-eaef-08de8e53d85b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 eTBr1rJYGVd3Z4KuyC2C6YBMzSGcjqAE+V0LLqkinW+ccxrQf6uze2psO+1+teB2Oga3vxZHo4paGjewbxRcyaaRA5k1lhdXu+Y/r6lMeQubfX0pWujR8jXjr5nWY2SSU1Eb1YDUdOO5TlyU0XCOXMqQpQvZcNkRkbTtpHyRgYhys+IsJyF8qwgiJnV7xoQgmxVv52wNq/pZzw+p2IQkJHUbK8Cy94c2z3doEAMSxgAqZdFcvZ0OmqUmRI9uI0jGYPHzbgSJ8otpHm1lMDMGd8beBXv8eciXOeM3hbg96AYCQlOzkLZ1ZGQIx21u49JPzNDUMQMo2TjotoK2GsL+W3kunCotkjeorcIfSWg/kCj9YwltGejmenogP+Aw7XGXw1cgzGQtkPy5fozkeeMs0d7/VG0b5B9ydNKo+HhmzCPnthMVeXeWVmzdSURH6ZK1cvOB4ajcvMahZoBSvKVzKY1Jg9vgFOrh2+84hzmETrhcG9TXcsaWgPDUovRfjTio4g/ZzOGbEIbmR7wHIRfG//SyOdKOtNu5OWQvc/ag4viZwC3PFKzfAxFKJEQW2OtZYn9WviW4o/g+RZsr74Y1xDua6aaNNJujk3GFpXXYpYw+O5g1UfXLXbCaG9LLKB9BEjaDx3QSKqOhkSsoc86bLcvNuDLicZyIhs4OPXCtepz8SCbKk2uPyU8IbRqunf+4vNsuNkE5qkxqXAO8VZ/caMZIaa3WFZZtTYfsHCz0tZoIyuwoPTdqlmApct1bjJK/rs4+v6aVwFfqWsrexk9ySJGw4lcUkCCf3kom+wc3GDQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?boUnFz6qCNMN3/p7sFeL29fAdlaNQFq99qzjZbwyZhOlCwH6HFqBvvnj9Y?=
 =?iso-8859-1?Q?HHBTqP/7CuljramSpxuqubk1C65yJUDjrPi3+RwnbJgkk1poeSiHjUMEPr?=
 =?iso-8859-1?Q?WocvDoxlS2/D8Sb5iPWYTTDInkOC979LYWOkVFxZ4H6eiiPfZDrzm8LfTW?=
 =?iso-8859-1?Q?P/a7cZZkF6UnwAvWuigUaBDAwOKJmCaRs0cei5KemaSTmKUas7TXxmV1zS?=
 =?iso-8859-1?Q?KKRabBqFUBcnmJkaeyDVWRZnFd67d7Q+AY7lWY/bSkh9jh5a35QZvIzpIM?=
 =?iso-8859-1?Q?VEq6QvVmjwAK5A9uIdiaSU65G1I+94PW9UjQSXS58DAKmkyuR6NWpYtpQc?=
 =?iso-8859-1?Q?ih6QSEii0Eiw4f48ez9B/30eUeU3mT3EvsClMa+DGYiFhDZNy1y1p9K3Xs?=
 =?iso-8859-1?Q?aRhBQLxvj75aTWMeXjwOGn4Cnku8h+4XnJGFQEK70VmnS0nQQmThiMg6bp?=
 =?iso-8859-1?Q?fHqftAD4lXEY+d6p4uIJZr1PcKtt+DjgNXhxRIBBkHsm5ZRXAIvP5xhoic?=
 =?iso-8859-1?Q?ib50tHWu+vZBz636fGsi+jlOnuebZBxfRC6xyAevUhWoJB6iN8DZjFGsx7?=
 =?iso-8859-1?Q?BAhQ75TOnLBLh9/OCti4bLNB9fYK62JyUGmMeRyhK02XlPl+3T7pFfIiE+?=
 =?iso-8859-1?Q?oa+vWOF9H4vYJGuN1MUJDabCw0NXMQn6uyL5aUT5VLhl8j1KvmfDB6Aipx?=
 =?iso-8859-1?Q?r2jqSh//6Q+3mDuh0NMgOEJVvY/v/Np6ZPiidDDq680S2sTfW7iOjuOVlM?=
 =?iso-8859-1?Q?Cw7Hr4AqUT+fziN5HtdmaMvSFUnpwnNHyzEX6JJJppVq14+4+g7ApJ9YbM?=
 =?iso-8859-1?Q?mHZd+5BIZd5PaTXrxGZMQ7uXKi05B64G3LTi6Sj+xC30XjahueKLJtYpbU?=
 =?iso-8859-1?Q?kjTJ1lMIoc9/Mvla8N/YBWAuYZGOJ7zuOg612DPychtWbj2r1uZ1+Bryg8?=
 =?iso-8859-1?Q?EPXnwN0vWE8nbBoQYuCBzWzhvM6f3uAMQtP2TYBNeVmmtCFXZJydvWxhsI?=
 =?iso-8859-1?Q?+Pm1DFPz9fncdd2L5cDrRO0lEN/Myxg9DddwBhs7GqnmyhzUZF1mQuPi9z?=
 =?iso-8859-1?Q?lcdX6ZNY9c2wBZkWvXE6pmFgdBc7OM+SNj/DELlDI4DOWyyCUbd1KAjeWa?=
 =?iso-8859-1?Q?8r0Z1p0Hd6FbBXZFx2jHrB06d4T+VN9fZeTlLQujyFLE2HH0UwbJSW4zzC?=
 =?iso-8859-1?Q?N2mTIGcUJrW9kQLS7Oxma6O+LuibAjKAkOiuBt66fjBAUmY4OYfPTLgpRm?=
 =?iso-8859-1?Q?Gs0plGDVL/hFTLwT+xBesi9b2jAfvpTuSBFhzLGVv+OSwIr7edgh/yofIu?=
 =?iso-8859-1?Q?yX8im7aFzgKb4OLXGT7VRhRouoZbgFUz94b1eX6euKVX93jJFddhqABXPT?=
 =?iso-8859-1?Q?9BgfPa2Aytr+CbsBFnxnfW2B5/xH/wO5Ko/pIJlEyqxC97A4Kx3Ab7o8gs?=
 =?iso-8859-1?Q?QhVZhuYs9imtzQu9tji0aHhdB2/2fYdX05YLkib+S54FvQZQvzdWK9mcQ2?=
 =?iso-8859-1?Q?E5ugt0b7qRt1SZEDhFsK+9A88Imhk4RkV+qj7VisbvsePNVafjM9KglRZf?=
 =?iso-8859-1?Q?G+OlRePoulRRSuhSXMyQZU+1hAEkMQwe6YxTOtKG/DO9WSqRu/tlrNtmx3?=
 =?iso-8859-1?Q?sBMrKli5kPTZqsG7vbowYs5pNNs+PAncZqyTP3+7cOkYIgH+7WFSuOxuAB?=
 =?iso-8859-1?Q?8vVNisQCFDDIulTob4dxjCJXuDOcXQeub4RkUArS6B+f70b93O0jpOSX9U?=
 =?iso-8859-1?Q?YWbLgzpTt9uCzFVmyntkaF1YDlm6UucxacensU/HiGc9SHxXum+0kPR2mo?=
 =?iso-8859-1?Q?FeSulVYBvUavkXf0bKbdZxZEWjAsY60=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c07f55-5c41-4716-eaef-08de8e53d85b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 11:59:49.5871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4pyTL2G3DQ5ij9MSVkfVkJ0EDMoTiqBCFppu4CHK2R/Df1RCoKxrMH8sZBhWSBqcqroktOFPz0dyWA8uAb8o6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6847
X-purgate-ID: tlsNG-bad1c0/1774871991-6894EA73-20CC0BB4/0/0
X-purgate-type: clean
X-purgate-size: 2214
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,suse.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[support.md:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.596];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1C70B35AB86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series implements support for CPU hotplug/unplug on Arm. To achieve th=
is,
several things need to be done:

1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented on Arm64.
2. Enabled building of xen-hptool.
3. Migration of irqs from dying CPUs implemented.

Tested on QEMU and R-Car Gen5 HW.

v6->v7:
* new patch "Kconfig: Make cpu hotplug configurable

v5->v6:
* see individual patches

v4->v5:
* drop merged patches
* combine "smp: Move cpu_up/down helpers to common code" with=20
  "arm/sysctl: Implement cpu hotplug ops"
* see individual patches

v3->v4:
* add irq migration patches
* see individual patches

v2->v3:
* add docs

v1->v2:
* see individual patches

Mykyta Poturai (6):
  arm/irq: Keep track of irq affinities
  arm/irq: Migrate IRQs during CPU up/down operations
  Kconfig: Make cpu hotplug configurable
  arm/sysctl: Implement cpu hotplug ops
  tools: Allow building xen-hptool without CONFIG_MIGRATE
  docs: Document CPU hotplug

 SUPPORT.md                        |  1 +
 docs/misc/cpu-hotplug.txt         | 97 +++++++++++++++++++++++++++++++
 tools/libs/guest/Makefile.common  |  2 +-
 tools/misc/Makefile               |  2 +-
 xen/arch/arm/gic-vgic.c           |  2 +
 xen/arch/arm/include/asm/irq.h    |  6 ++
 xen/arch/arm/irq.c                | 68 +++++++++++++++++++++-
 xen/arch/arm/smp.c                |  9 +++
 xen/arch/arm/smpboot.c            |  7 +++
 xen/arch/arm/vgic.c               | 14 ++++-
 xen/arch/arm/vgic/vgic-mmio-v2.c  | 11 ++--
 xen/arch/arm/vgic/vgic.c          | 21 ++++---
 xen/arch/ppc/stubs.c              |  4 ++
 xen/arch/riscv/stubs.c            |  5 ++
 xen/arch/x86/include/asm/smp.h    |  3 -
 xen/arch/x86/platform_hypercall.c | 12 ++++
 xen/arch/x86/smp.c                | 33 +----------
 xen/arch/x86/sysctl.c             | 24 +++++---
 xen/common/Kconfig                |  8 +++
 xen/common/smp.c                  | 35 +++++++++++
 xen/common/sysctl.c               | 42 +++++++++++++
 xen/include/xen/smp.h             |  4 ++
 xen/xsm/flask/hooks.c             |  2 -
 23 files changed, 348 insertions(+), 64 deletions(-)
 create mode 100644 docs/misc/cpu-hotplug.txt

--=20
2.51.2

