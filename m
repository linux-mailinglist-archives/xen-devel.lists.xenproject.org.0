Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yXm6ILpv/GmkQAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:55:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B914E7169
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302572.1576451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwO4-0003Z5-Bi; Thu, 07 May 2026 10:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302572.1576451; Thu, 07 May 2026 10:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwO4-0003Wh-92; Thu, 07 May 2026 10:55:24 +0000
Received: by outflank-mailman (input) for mailman id 1302572;
 Thu, 07 May 2026 10:55:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wKwO1-0003Wa-S5
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:55:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKwO1-003OgN-8p
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 12:55:21 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69fc6f90-5cb7-0a2a0a5109dd-0a2a4504df22-34
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:55:21 +0200
Received: from [52.101.61.51]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69fc6f97-1dec-0a2a45040019-34653d333068-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:55:21 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS3PR03MB989145.namprd03.prod.outlook.com (2603:10b6:8:39b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 10:55:18 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9891.017; Thu, 7 May 2026
 10:55:18 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iv3nZ1oVzA72GVMmptz47rL9woYuV79KO1mYw78RYusbiQrWyZLurrV/rpX+OW3pS3qRN0XxFJqPhj697dylPyusMOz5wlwnWJgkLivNNplTBG9z4xxkApEi+McBlR8ofIE8cFcsm3zKtO2DIdVP8pvHSwkerHM5i3D1m4P3msmGBFw4KF5c7Ayni1AeEKrwwhVEewAOlTdRTv3dgPXMaitHVc/6mtogg4VHldETKcn8o/IY28P16l6a0cZDx6G0XzXJTNCq3PgSWB0VMH1V8H/o//E/eCVJq8grUaJ+RGB8If641TPyEpTs1sslGRZjH6c3uFEU9cm9ByQvnEoYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRzMcfc83jdoIIB7XvQLPSDm7GDBAb3wY9DvLDk3nqw=;
 b=c26HGZpjyvKSnC8DkD+6GwqYqy1fNNG7qlx9nwLwwHOxsjuhLHl7nUi7qs9QsRKvUeMxBL6J5gURWkolznu/k6mrGMnGJ/td8wiVw+AZcUKif0HUCy2wBRKIm7qoHLA0p0TbNlKn9E0RbnQHxnQ1I2ZNmh19RF1qTJeR9ZdljXP1D5thRkGBGnA0D55wtQ6qKClkrxCEnGGE6V94G6OO6Pd0GlJeX6tTwamCgshyKgcH6au9xnFrkN8GloafRZflXC/IXM1WwvOnWqAQmo+rHEP7UhnOdaN2A2HDPMKRELDfoFKQJ0zyXgXM2dTLliFjygBzIibyHK7z+8SHhrvwPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRzMcfc83jdoIIB7XvQLPSDm7GDBAb3wY9DvLDk3nqw=;
 b=B5xKnu/XSCvIikK6WanQP9ERtLr8+ScZWa8coO8H4mkbLbbdnuKz4sECLUsXB0BWAJbR2XCLLcpM45plgNqCiMJW29nzom2wEWTt3iB4UVbXnkbjpsl82zMz/ypkHHwzJiurw/Fhi033FLUD10eHxYXJsOkDTcLsLwzh4oPuhB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 0/2] nestedsvm: GIF cleanup and fix
Date: Thu,  7 May 2026 11:55:05 +0100
Message-ID: <20260507105507.2078971-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0581.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::11) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DS3PR03MB989145:EE_
X-MS-Office365-Filtering-Correlation-Id: a2934a4d-fc7f-4134-fb74-08deac272074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jt7lkL0HFXAU3BQUKuqa6TVemIm3qzVAz+IBvJmL+siS8DgIGNlRj2+b/uIvSECUpLc+Ljh6JodSGmUzGAa4ztgaJvBo07+MdI86/hPTc6thIH5yKBz9GOw4yG3IJuCIdff1Q1negVfMpshmaLORlBt2H76e54Yd9YrK2uJA27oD+u1aFv807lhSSBei6ZWQ8H8bLxTVdF18hOps35Qg3dbm4cl2MWa9hIZGO29mnlU/RfQ7DQx3FtAgAxN91zb1/oUUPmGZGIKLc4ANb4LPlK5WjBTOyAZTCOMg3rYxmomsn5qQmnfTAXG3kZ9z08b4nnMcXQHsgLcea2Kd7CoFyliPKhYLQSb3A/A338dxhmWSZw5oy4j5nxoe6nFhLpnshyukLvJ1ET89iedlvjdj8CAZKDHrdL7ouI7gV3g+LKgs0tz4Z3l1NifJOmWm93dDLHsydAWtUUOYvn99lwUCLPAK/uhjmXwwxK/JXMA8G4hltoLC9YT08iqvnLXYp2zd1K5qJLoD2I79Pwl0GFxu7GsqICEAzqaAgWyDlYHe3hBX2d3H6IsHYv4yit4aL4XF7FpeO8UYlCp+e4jQQquER1jhNh4bpN4+PHQpoIEpLPou4faXWLkQ8A6naW3/B6p6VJT8QADgKbt+tAm787VWDNdrn+/zwnGyUNzm/cTH8qKFsuvAp/IpOsmq0mUvKSRD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WGs6hhyY4pW9u81jXhwOKmZM10CgRYP+KEIm0pPP6CIOSMo6xYEjlyAqYALO?=
 =?us-ascii?Q?JDpZwpit64A4IaZIPa1LXSfoM2YtUX+6F3PpFT6wV5mK+9FinsklNiLgIgAr?=
 =?us-ascii?Q?9fZOe9f/RVqHjpzBarZGbU+TfEXGW+fNU7u2U8detj7mXirPcg7IaL877wcx?=
 =?us-ascii?Q?ri4k+Mmbef6XJW/EF8+3LT+IFyMNVRCnUJBjiJ2TA1Coa9ck+vhDKytcRhRe?=
 =?us-ascii?Q?fs4FDkCQ83hrPcPvXUnrUWIr9gh/Dp5pX5HmmuaouILexHV4LhcnmWKSalxS?=
 =?us-ascii?Q?+Oakw6pfVc3dQAeqfeP3N3QzNNENVrpkJfi9+SHxbW3Efu/p8OGv28FKulO4?=
 =?us-ascii?Q?9FvCxeWscZFQ/yrdhYNMR0AaU7hW478Uhpco6DaNEySnTKoT5K1BeMUPEnlt?=
 =?us-ascii?Q?iHhLud/VXlnXZpxIZLJdBqmWGDtcUSWVDa02p0ZgXfIT2S6qcNW9XbIRx2iJ?=
 =?us-ascii?Q?5Y27oXa26qM394EKIhzsOZscjNbmXnz0JuHGy/+a1NtZWg07iVnjcEShT7QD?=
 =?us-ascii?Q?5XFTyUn9TDOyrdTfhh4ux+Rg63miT1BCMfuDYNEQTqtBKJMuFKBhHwlIguFp?=
 =?us-ascii?Q?KbseZenAVxKrw1GlTCohfdgsAnDBFHBaCC2g7rAjd7GxPZ4NOLYx1o3MpIDd?=
 =?us-ascii?Q?xrUYO02igB3O8qywxfzw3OcWE755+bvXjqN6M5xNRKFeuXfx4FeBmgGg0oYT?=
 =?us-ascii?Q?qeIYjkc4/8PjagwnVwOy7eIiFg0DGfRiFnhh8fUhnNY1vu+L9FAOzgFEXM20?=
 =?us-ascii?Q?zlGqU1O4nkTpAny8xwyhtqvxoxozcIpzrjUlVj4q1Z4s45J5tVBhu+c3iOKY?=
 =?us-ascii?Q?ED5ECoJRSkjw4TNobXsvidnE+uwdflUlTV/XwGywRtWCgxIfF/oneZNYRNjr?=
 =?us-ascii?Q?+u0aGrUGfKoELrXxUpO9bFf39qD5gaYAhC5Oqg2pUDwawnB21eVa3nqt1pgz?=
 =?us-ascii?Q?GxTl9CRPVKz8kuChZu6184PJNuO2kYR+hcKTvmwWOMRXMOYMp7VMkuN8+IpD?=
 =?us-ascii?Q?xoAH2QZBkZCVBmX5QKQlyFxfeKQJoC+sLUQF8C0efzC05bgV6VpypzSMgtOF?=
 =?us-ascii?Q?Bfj4bWvI2/3AKKKL3+QArUmX8tA/pTPj6YHcmYgLxCTc1VShw9HkEJ1hvbjO?=
 =?us-ascii?Q?bVNzoz36GOTFPbtTcD+5lcA93nFhw3IQ90yrA8DBaQ62S3IKVgnPYlN+erBm?=
 =?us-ascii?Q?UiByLjpoTh7yTes1SChKox8Sslcr8KcW2PF4lZ/gyAvdpZAclGdlpub1BURf?=
 =?us-ascii?Q?j4gRCOFyvbdc/6+hFMqaTxmGv6Tgw+NbuDcAVfZf8wEIvZ3nd0a9vFtZlSsV?=
 =?us-ascii?Q?azGdn9viss1Og82sF1WP1PF5yIcHYASOH97nReqXJmCytWI8rdtoGymdMIXA?=
 =?us-ascii?Q?nhCWI9E26ZOiqELiVtrmC1BsYAUflQnp3GSW5vdOrdZkIm7Ja6Sgot11CejU?=
 =?us-ascii?Q?z2Go14scLS4yyE7LDQNBoUV83M8jo8Vcf/jBfc52EiD+Zw8R26UsyojFGTUW?=
 =?us-ascii?Q?tnRL4ajhSbe4FHKCL54h98bX+T7qbcU1WCyew0a8rkSiLtfk5vNNj/ML62Lb?=
 =?us-ascii?Q?P7jtJMluke/DTnHo4OKotEbUj0o59vq5xKITyDoW/aPnqyK9tMCtXxYMZ7mo?=
 =?us-ascii?Q?4cBosj0tet3ObpMwsLy+UaDqXxBTcHZP0nqHL3Shz9riZjxn4rLSjO9SqHVL?=
 =?us-ascii?Q?fTKwakzyQvEUPbbkGCq0wEP6gHREuXNlJT1SjyqmEYTnSJZsML/sMrOmw/sL?=
 =?us-ascii?Q?VWzkkkYG2as90W71MPGEc99mhH9nhFI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2934a4d-fc7f-4134-fb74-08deac272074
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:55:18.2309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ps0y0R401GwRau30weFDsvICkZOBSgI440GmiLGeNQhgnClscefzjWq7zTtihxYbyr4ZvX0ktmhFXs0Aj3c20fSCT06kT6fXTBHLzEuvjDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB989145
X-purgate-ID: tlsNG-ebf023/1778151321-297793FF-518269E6/0/0
X-purgate-type: clean
X-purgate-size: 686
X-Rspamd-Queue-Id: D4B914E7169
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi,

The first patch is code cleanup and shouldn't result in a visible
behaviour change. I confirmed this by writing an XTF test that checks
interrupt and event delivery behaviour with various combinations of IF
and GIF set.

The second patch fixes L1 hitting an assertion error in Xen. I confirmed
the fix by writing an XTF test that calls VMRUN on a VMCB without the
VMRUN intercept set.

Thanks,
Ross

Ross Lagerwall (2):
  x86/svm: Don't toggle local event delivery on stgi/clgi
  nestedsvm: Clear GIF when injecting VMEXIT

 xen/arch/x86/hvm/svm/nestedsvm.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

-- 
2.53.0


