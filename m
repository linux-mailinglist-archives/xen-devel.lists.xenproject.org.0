Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJeMD934/GmxVwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 22:41:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FBB4EEC6C
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 22:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303058.1576617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL5WN-0003Zb-QT; Thu, 07 May 2026 20:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303058.1576617; Thu, 07 May 2026 20:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL5WN-0003Y9-NC; Thu, 07 May 2026 20:40:35 +0000
Received: by outflank-mailman (input) for mailman id 1303058;
 Thu, 07 May 2026 20:40:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wL5WM-0003Y3-1a
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 20:40:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wL5WL-00AU4t-8P
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 22:40:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69fcf879-5cb7-0a2a0a5109dd-0a2a4505cd94-46
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 22:40:33 +0200
Received: from [52.101.70.105]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69fcf8c0-aaa8-0a2a45050019-346546692efb-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 22:40:33 +0200
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI0PR03MB10807.eurprd03.prod.outlook.com
 (2603:10a6:800:26a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 20:40:29 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 20:40:29 +0000
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
 b=L0hyduc2oRicQiatt5OVz+e9U7RJflbFrvhK4JjwkjX6wqhgv2t9AY0l81T9euTqi077mkFGHfWrQBJceknwluItGS3RM4PY55Rv86JNQxV5oiaBAI+iFYE0WpeE6S7P/jJJ8oAjn/s/aj/5MTFVPFYslzDizvGEm2TX0E4nsZt4fSN7NSEX0Ubyvr5CYvf2K2HARg5xwELi2hmeToZvvuLtbmHSABBzeia+r1UouF5E+eeUdFwXyYqbjNwfZ9MUWCB1oHq3Z0JbIkPc+2mVOp+u3K/RhsHNKQDo2iB/Qqlb3mzpvcQ7OANdmRU8dgnHiLgIyys53ygU0xnfxrm9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cViCImyXyLim00MJOYYhPmGCgCFM35PRp520/M5ZsYg=;
 b=M+AWX77HyKHwxZOWcpO6TbHtPUMN8zSivUDGfuyg8N/kpU9u7KrWSwLCm2U3aQm+rRKf6QSbJ3WZKBrI+86FRk1fXWZLIKRNGVEjdOlF1CAGiljOrSeztsFMtBbcbXdzGi1GImexeiSXQa9YFufFdNTKnclW3R03j3N/UJ0Tm5iMgXJgN7Cc2YEeAeIWYdi70hBpvhd46MHtz7a1MauT5IGv31HjaG1mXzEtETvnkUl5nY3gcmz8RMkRQK7S9AY2f0/pz5jKpUM8e/sFP5EUiyh9wSvfRiHy907QBtW1ngA9NNluccMBLCP+ySSrIo35LufAtzWBBcAQG5sN+puinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cViCImyXyLim00MJOYYhPmGCgCFM35PRp520/M5ZsYg=;
 b=XOYAv4sadGCfnrAPYuVVNqF8e989yaRl5afPk77q7J1BfPa/ZXkU7rQGLTynIb2nWliOqqh0pFpOLNOwjn2Umc0kl+6TnbITTbCZycGWbzqclcFe9oZZXnJf4nOKbCaGY7ceKAP43G8DrjW9tKnlR5VuedDQn2OVkLxYELSluDjks8x3c04z1QXJ1v2pc7RagdCMbNZ70oxC1FK4Q6d+eD6iPoIF5x3dU/YScSIuzzDyQDkv3zRbX/lxrLgICb8+rzwDlGjOFHmor5fIVV6ZBlNfFL/voT2M5r8V6USehQqhvlC6kUWVEvYAWMppyWC61Co/xKSaBibXHlDI7EfzWw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHcyClfuk/Yqk/9/E2oGahG1JP+sg==
Date: Thu, 7 May 2026 20:40:29 +0000
Message-ID: <878q9vt0lg.fsf@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
	<a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
	<5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
	<5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
	<efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
	<d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
	<e5844c28-aa68-4bf6-8287-a4ceeda3a1d2@suse.com>
In-Reply-To: <e5844c28-aa68-4bf6-8287-a4ceeda3a1d2@suse.com> (Jan Beulich's
	message of "Wed, 6 May 2026 13:54:09 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI0PR03MB10807:EE_
x-ms-office365-filtering-correlation-id: d13e1864-94a6-4abd-4157-08deac78e044
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|42112799006|1800799024|56012099003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 eE/ko7LKfOWtWr4cpZnlgV5aybKSupWRA2/M4vJ8ymv1mNXm0w5ZCWlwXWj1YNzIMlnYn5hddDAkjpV6pAbFsQOe+58sYk/28fFkXwcymsvXzXmT+XzHyROlhIFevhTtgiYXgfmGmE5nRMuVDgzlVevwrYtZUl22U+k51MZvg75OvhWgqebty9WXABMcyMDvcGmmLrkdXYC14VgVf31+f4e3G5HDMY22Y6mUCDUYUkXiNl+g2mcVCHzsfpDm7Wl1STrs8XD4YtMamVwKb3OMqzAGgxZYZK5MB37K2O2qpMk5TwmTo5nOQCGNQLh+CuYM7tWX6dzYn8O5a+OA8Ls4ekUSlbiLwFljiPS8UORrezvus566IGlTCUMq5hnLs/IHpzRtp5WSwiUYREXIK4SW01VINu/YHBYuH0HnB/RKQdBVi+pl3jOFFynF30P8REkm0kawjGd0FLy5mVcYZdtPlq+25ddTOBmm/FuArlZs7VkT8SUXXdCODrHLeYdTNBYqaJiXVf+XyVLHZzE8/S81nVOvodb9DKGoZbZwE+g6Q8IEZ11Jnxv3n3doFZouQHbFRIKUHbBrcdXaQojTLobUFgIIQvf9xgTeM+h54R+nRA/keQ0zYK8L4aenj8su9aCkS0Hm5KHmbufC7Ia0PqNz32Y2N4sqAZdwRGZ3qoG09JT0wx3+qfwUe3W80vbJ35+JfAbD3kwvpuaRKFZTTPkEsD1B01HlwpkVdvIgNVWKb17KBp3O7Pz3DpCLiQfUgiB9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(56012099003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KxH4W8pUK0syBCJqvBXxagmFnMDfsok9dgWVsFj7mSveGkxnqKmDGjRDCf?=
 =?iso-8859-1?Q?6mtLcCjBdBVWKFQF8jdBwKoPz1Ps7X5Hz2Slhyz49/BIdu4z85BhrbsSeq?=
 =?iso-8859-1?Q?1DHen9HoUF7Nd0h8IJT9B1LlnFMNrpbCFGd/x1KBuM8IiP0ZQfhMi6bceR?=
 =?iso-8859-1?Q?ozrVyTWonsTdMczXyfqGnK8SJR4DBcWhUvGZFSVr4NnSuqOK1T5WOF37Yk?=
 =?iso-8859-1?Q?ZQRgNhVlpPWpGoioLDTeXcxSdmJ2fDJSO4FhkTH7X/axr9pNIcrQyuU+Rp?=
 =?iso-8859-1?Q?/RJh6y6RXEpgogVwAenna3f5FIGFNixvjTAWB4zWvgf08rkEs7wzU3GSEH?=
 =?iso-8859-1?Q?1+3dFaN4AnEBt4ElO/uM/O0UADLQ1BNHR8F+uTPZJJKY465ekJk+l2Y4dp?=
 =?iso-8859-1?Q?7nUnkqDetwUtrQqxw8ZZuiS2GX7mFLhQ/RfZRdTC46hvW1wXGrHC/NBgcY?=
 =?iso-8859-1?Q?oAzv/KWrcxaTZE/o7G1+aDg2SY75pbJ4rAmQdJBHdHNQ4N6VhfXXSJ6Iy0?=
 =?iso-8859-1?Q?59BMezNzVZBu4z3dZ8y+ZtrsutNLrQvhFIr5+G4GLtQq/eZcoxDQwFk3Yo?=
 =?iso-8859-1?Q?oMRKaJg/VNO0r77jdhXiLWI1CsdBHxvfZ12uBe+6ayJ4Vh1BdV1/+lP+OP?=
 =?iso-8859-1?Q?pPTYViJ+ZKzWuIeMGfyRVdxJRkB8EHKfEPQy8WdsJjL1RqKcWHxL1neWQ+?=
 =?iso-8859-1?Q?3Cx1/FMeyTEMGn9M3g9G+vxwlS/Zz/eU0OVE9wGRcLlTtwDRnoBiMU8r31?=
 =?iso-8859-1?Q?lQiHqeQrYlgWXVhfxsGZxVlxyJmNxn/bWzII32eNgaXBpxMy7FW7f42cOa?=
 =?iso-8859-1?Q?Xb7u3dda6RDyeJ56aqNoBqL3DHebwwTUS5DQweop+TB+IsJHNK/ZimrJsj?=
 =?iso-8859-1?Q?4uARXQ2BywafhjIwxWGmPNg7iUQo4pYGu0+8T6VfRERkw1UN/4UilGaRmZ?=
 =?iso-8859-1?Q?1F6pPx8RZGURaE7jV3tVhqBL7kjCSdOOpL4cCauFyrKgrgv0zcM9KjyeJd?=
 =?iso-8859-1?Q?fKuA9/eajVRD/lk9q9zgKW3Se363hGt8na8C6q6gPrwE5ps/5cBJhAl633?=
 =?iso-8859-1?Q?v2WfC8vRWhqTnuE3FwSgjT5J0jXBZrhawwp9WQUQaFETbvBYeES7kh/dpZ?=
 =?iso-8859-1?Q?4aBChfAaUAGSCIVmA5hIHIFnLlU4TaQW0IeFfLN1gqTXtrMJALC/6q41vE?=
 =?iso-8859-1?Q?G+s+NfAItWgCO2QQHGszUAtpPPXCS4PAknmNNabF8ia0U5C3ZfsQT5bb9J?=
 =?iso-8859-1?Q?GLeKaMefvXkbXgDg1XXc6lZKH8yeyCI8B+HfXXHJUgyHvYy8qbJOM17FMX?=
 =?iso-8859-1?Q?2sqGfalpmo/HtKWJod5F1VUwjdTLQfN+/EgzyDKksIqxOsvojuOQ2SUHZ2?=
 =?iso-8859-1?Q?9/MTXLJhtEbkEKiXdTeO890SCnZkJJBi22bN6HxSvRU2uK1DZB7kZ4DGtv?=
 =?iso-8859-1?Q?5GsNiydKzvzD5miz2yw15ioQBd5S99LWjt4tTpswN9FDS2r2dk8ULRoEVe?=
 =?iso-8859-1?Q?W1j1RsTi6UuuxpbLjwy3+MYY3FdpPqhrEJaJ8yqyzJOOJTUyw7jYwbauxP?=
 =?iso-8859-1?Q?f0xb3CkjCTjUP0smgBHFSVbrhT/O2sFsAWmY/28d/ZndEicV7LArfxsdok?=
 =?iso-8859-1?Q?vMQKDFZtspGG2LIvsGcRD0v/CUOJttsLs+vOeMpWZxDusavVlVEJuHRCK0?=
 =?iso-8859-1?Q?LcVR2axVX9kg07R17E05tjLtMCwAD9queTbZ4ghX3pQriNZofiHrBjN/7K?=
 =?iso-8859-1?Q?vBqkHOJN+EnWrr+dJMPAHXK4UVWH+CEMnNI7GkHGnItb4KIO2eohIlIXld?=
 =?iso-8859-1?Q?iJcrGrBlg+E+CRQSssjUCWYfzhJKAMQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13e1864-94a6-4abd-4157-08deac78e044
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 20:40:29.1444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfgaUE+5LNbvPjiPcaOhKm1hTtnwtGT7MPe0HcxPPHo8qlKUynDC4d7O8oCCIGOq5ZU/bp6AYFaWjnG/v1g/RVsQ/Cks9w26O47YrhiMRgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10807
X-purgate-ID: tlsNG-c201ff/1778186433-DA56B443-AF38747C/0/0
X-purgate-type: clean
X-purgate-size: 3500
X-Rspamd-Queue-Id: A1FBB4EEC6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Mykyta_Poturai@epam.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 06.05.2026 11:39, Mykyta Poturai wrote:
>> On 5/4/26 08:37, Jan Beulich wrote:
>>> On 23.04.2026 12:12, Mykyta Poturai wrote:
>>>> On 4/21/26 17:43, Jan Beulich wrote:
>>>>> On 09.04.2026 16:01, Mykyta Poturai wrote:
>>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>>
>>>>>> This code is expected to only be used by privileged domains,
>>>>>> unprivileged domains should not get access to the SR-IOV capability.
>>>>>>
>>>>>> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
>>>>>> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to accou=
nt
>>>>>> for possible changes in the system page size register. Also force VF=
s to
>>>>>> always use emulated reads for command register, this is needed to
>>>>>> prevent some drivers accidentally unmapping BARs.
>>>>>
>>>>> This apparently refers to the change to vpci_init_header(). Writes ar=
e
>>>>> already intercepted. How would a read lead to accidental BAR unmap? E=
ven
>>>>> for writes I don't see how a VF driver could accidentally unmap BARs,=
 as
>>>>> the memory decode bit there is hardwired to 0.
>>>>>
>>>>>> Discovery of VFs is
>>>>>> done by Dom0, which must register them with Xen.
>>>>>
>>>>> If we intercept control register writes, why would we still require
>>>>> Dom0 to report the VFs that appear?
>>>>>
>>>>
>>>> Sorry, I don't understand this question. You specifically requested th=
is
>>>> to be done this way in V2. Quoting your reply from V2 below.
>>>>
>>>>   > Aren't you effectively busy-waiting for these 100ms, by simply
>>>> returning "true"
>>>>   > from vpci_process_pending() until the time has passed? This imo is=
 a
>>>> no-go. You
>>>>   > want to set a timer and put the vCPU to sleep, to wake it up again
>>>> when the
>>>>   > timer has expired. That'll then eliminate the need for the
>>>> not-so-nice patch 4.
>>>>
>>>>   > Question is whether we need to actually go this far (right away). =
I
>>>> expect you
>>>>   > don't mean to hand PFs to DomU-s. As long as we keep them in the h=
ardware
>>>>   > domain, can't we trust it to set things up correctly, just like we
>>>> trust it in
>>>>   > a number of other aspects?
>>>
>>> How's any of this related to the question I raised here, or your reply
>>> thereto? If we intercept PCI_SRIOV_CTRL, we know when VFs are created.
>>> Why still demand Dom0 to report them then?
>>>
>>=20
>> The spec states that VFs can take up to 100ms after the VF_ENABLE bit is=
=20
>> set to become alive. We discussed in the V2 that it is not acceptable to=
=20
>> do a required 100ms wait in Xen while blocking a domain. And not doing=20
>> that blocking would require some mechanism to only allow a domain to run=
=20
>> for precisely 99(or more?)ms. You yourself suggested that we can trust=20
>> the hardware domain with registering VFs if we already trust it with=20
>> other PCI-related stuff. Did you change your mind, or am I completely=20
>> misunderstanding this question?
>
> No, I still think that we can trust hwdom enough. Nevertheless we should
> aim at being independent of it where possible. And I seem to recall that
> I had also outlined an approach how to avoid spin-waiting for 100ms in
> the hypervisor.

I want to clarify: you are telling that Xen should not wait for hwdom to
report VFs and instead create them by itself. Is this correct?

--=20
WBR, Volodymyr=

