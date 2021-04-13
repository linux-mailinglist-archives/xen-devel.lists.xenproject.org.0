Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D353235E0C3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109766.209497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcA-0004qQ-Bv; Tue, 13 Apr 2021 14:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109766.209497; Tue, 13 Apr 2021 14:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcA-0004q1-8R; Tue, 13 Apr 2021 14:02:02 +0000
Received: by outflank-mailman (input) for mailman id 109766;
 Tue, 13 Apr 2021 14:02:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJc8-0004pg-Jj
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:02:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b52452c-252f-4d3d-b91f-79a443dc3ae9;
 Tue, 13 Apr 2021 14:01:59 +0000 (UTC)
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
X-Inumbo-ID: 7b52452c-252f-4d3d-b91f-79a443dc3ae9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322519;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=17bFgb566j0C0p+YixRfsxwEwIatl3VHD5h5FglkB/Q=;
  b=eyHMFSieoICl6oAUw8yHyJ0cJziJ6478w65Qi47Uffbj9GhE/QRmM7GG
   lVmOUNbPmEI74p50SMR13DW9AeJIOZ8mb9X0RrGQLmlZe3r+0gbJ/CG6a
   skwKUmsM9Wv0/30lUrfaxK3Y7PfG02qwmjVabjLRaavbES2gde7qapine
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rbawLs5aBlFA+zyCybKkI4eXJEjsv/akIxLZAWhmupSCLjcvmg3m3vZ3xNM0o/U3Y5ZUz0pRi6
 HCWQKVd5nKpt9nhmon9GDN3F3wZJzW6pBsUyyD0cK4a01NKnQVsuv8JArlmWr/DrSEgNJlj4zR
 erqkKQX4voV3/w/YSKTcQC6TIjvGBtprxGzGoC9TxIeeqxr3r28gF7lgWsBcI6SHCuNTWcZts6
 QuXdY2X/iv9vGyi5OL1dqld1RDH6G4WUxA+xW9VjT71XakA1YYAMx1Y5rnhnKtly1jdIjchjB7
 Lko=
X-SBRS: 5.2
X-MesageID: 41866802
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Fq043KuUnIwt9+rISDotHjvK7skCrIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde544NMbC+GDT3oWfAFvAG0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JaDqzNkFtXgFJCd4YOf
 OnhvZvnDardXQJYsnTPBBsM9TrnNHXiIngJScPGh9P0mKzpAm14733GQXw5GZ8bxpzx94ZkF
 TtokjCyYiI99q6zRLd0GG71eUtpPLRjuFtKebJpswcKjDHghulaoJ7S9S5zU0IidDq0nkGup
 3hpAohItRS5hrqDx2IiCqo4SbM+nIP7GLv0lCRi3eLm72HeBsKT/BvqKgcVzmx0TtFgPhMlJ
 hl8kjcir9sSTTHpyj578igbWATqmOE5UAMvMRWs2ZSSuIlGdhshL1axmx5OrEaEhn37Yg2ed
 Med/301bJtfVSWY2uxhBgI/PWcGnA6HhKxSkMfoMCi0z9PgHBjz0cDrfZv50s9yA==
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41866802"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbEi3TyS79tS264An7mVnZ2Y4Nj7OLRZVi3bsFQjwoETT9c2p+uZpI0BWDn23WUnBb10LYHcyZjaN/0f0hVDd+zGMTRUdyZ83Qm07xrRcPt6Mun5I3WDU+MMVpVx8hAkhov8j0SWwLWWVIc0/PC0gRE3qi4/7lai9w5Zkzd2278nuag3pqdEZmALdosqN0BfaMTCa0wse8cacnwznZ+/fsfwtzMmYB53V71ENItXr8AAXd9niaxg/dBrx1qv2ISpebFbfaGYwA/LjpHCBoXbwhJx+BAYdMBiS+T/8pCPynBVPZPUbGukk4pGUFAqgf6ULzRYew1zhIiLYJRC3kNpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ltsHBeDJ2qJwdwl/SHwh1KG+uRV1emL1KyXCwmkrGU=;
 b=QXu0lwo9jc1kPiTynZvTYCNiQUkBnH4ayQnY3BE0kJA2+GmxOndV+bOUeYDgXriiyYIUW70V/bMtGzCmLVlkUvMarRLdA4hCpOUJ6DXKa9X0Mm4RDF5e/d6nqEupUb+ACsO2hHi2B5NG6bjYYDH6AYVsSTP9QGcF438C3BEQQrr4I81hGDbouI0ju1i6cCnMWTev3X1AOfnTJzRmY0mV6aGcDUdyl5ZnHZ5+8AUyiLKqde+T5TadTcV4B/WBYitfAK3Tep9iDn4uQe2i7iYwpbS7eCSxMaiwEBK4uFMyht0jiMeRphYgmPYbCvFZrV+5peKmsXDqt3bbeVPpnD4Fsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ltsHBeDJ2qJwdwl/SHwh1KG+uRV1emL1KyXCwmkrGU=;
 b=RVZOqcBc8MTCmaKA1Ifa51EH5lGC9K6WDFluWZWO9LZ5H0ln1+YLEo71KkKa1/WNB2dGHehZrUFx8Nb6HhBo1wCQvttUPy2necA/yOYm+4MvXN9QB3gRkxhzxgIA+vslI7GJqJO62/tybMkdc8LDIfOv8uogzSJqkYonr4lPaIs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v2 00/21] libs/guest: new CPUID/MSR interface
Date: Tue, 13 Apr 2021 16:01:18 +0200
Message-ID: <20210413140140.73690-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0133.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0db51f0e-cfdc-438c-4f96-08d8fe84b353
X-MS-TrafficTypeDiagnostic: DM4PR03MB6096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB60964C4C2B7DFAFC59C8B8208F4F9@DM4PR03MB6096.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jsUpjjuIk7CXZ3UZgokQcW+NXWx+WT4ifcHY8IwqNi5SMDw18heCjRZFcAEZCz9wQ/4gd+EBqRT7isJgrGgCl0132VDfa3v5diazi+KN2kVJJI0VKDYXXIQ6fTTZm0chLv779HnB+jZas2azpxti3TtxlANQTane64tW15nG34kYVbtB3Wj0AJExN67AoT+UaOhRqw17f26c8mqsWxK4h9sJpFnpqFjHQHwzstpSd/OJ6XnFkaRdUfw/sAttrSb67RDPfoslYmJJkjqmO6JXhLxMf4/oXpNOBHkM82aLTXDrUzlT2rXOMwfw0bZobGtp3UBFlPJxGzzplILo0OZeyJEs6KcdUgsHnhj2/SqffKF4e9f4MyJ8/jPxt72xOsLSLsuHP0S6af9GebieZAhJaBMS0GhCmZlBDlGr5MF8Hc+DGPHNqOH3kw6U7evvDvpaApbff8CeehVm4R3V20VSFW+8P8sGhJXw4sugWrDg+n18phB9URvErt+Gi4Mgl4KvcFt7kWP6vzWWzhpbMhyyB+dnNtb6F5kLtZYRecPHe/Y83jsR7J+hE3X8oPMhtf2JS014VHD07fdjjU8qghPlxitjRU2zRJTalI0QsMf27W4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39850400004)(396003)(346002)(26005)(6916009)(86362001)(36756003)(83380400001)(186003)(8676002)(6666004)(16526019)(66476007)(66556008)(54906003)(2616005)(6496006)(5660300002)(956004)(38100700002)(478600001)(1076003)(4326008)(2906002)(8936002)(6486002)(316002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmcwTkFMaUlYKzRLQ29zcmcybjlPU0d5QVR1TEx1dVdSd1dxWjhHcFFCdVFX?=
 =?utf-8?B?L2tRaGVkQ1BmWVRidTZCQW52QmFiNUlqb1c3Y0dOYzBmU1dBdzFrSlBkOU1n?=
 =?utf-8?B?dXVxMy9JV1lyelhUdlB3dkdWYnlTamdKdHcwNTFEQ0VPWTdtZnNtSit1TUty?=
 =?utf-8?B?ZjJlOWJ1bERZQ2JhM0Q0RTh1L3ZnN0xlcTFvaVJEWjY2M1BXU2tld2hwV2p1?=
 =?utf-8?B?Tng3WWllRUlJWG43NUtnekc5R3lIZnVYalVTd2hUOUNOTm9pc3dOWjlCVWJa?=
 =?utf-8?B?MDZiaFNkZjBETk4wbnJvOUV1Yk1QN2tiVXoxakVNOTB6cnZicUhGNGhQUmhG?=
 =?utf-8?B?S0YzR0dncURic3RWUGVpYjBYTTF6dXFhQS94cERQUUsraVRVdFpQeW9xRHk5?=
 =?utf-8?B?ZnhkTXZQOTRBaUtFZGFUQ1BCYW9kQ0FCQTVkZ2Flb3BDVld6emF2b0ZkSXJD?=
 =?utf-8?B?bmVTUEN6YnQ1ejNXUEEreDk3eWJGcG5Td204R1FyZ1lKSmoySjEyS1dDOEZC?=
 =?utf-8?B?NVV5Q0NFdE1XTDl4U1RFc3ZnL3hMWm01VC9TZEJ4YVNrTEZlQzllV29walpB?=
 =?utf-8?B?YkZBZ2lBQnJjaStBeWZUb2h6RkVGVk9ac0tmYjAwdnlvckZBOEdJTHo4WnIw?=
 =?utf-8?B?ZEIzaWpHbENEdFRjNnBFTDN3eFZ2MmE5YlQ1NmdiTVZ1ODRFcGhsejQrWHNY?=
 =?utf-8?B?czVUbkJUOVFvK0orcDlTOENzalhiZ25FSDVqUUdQaWtiSzdPYzlaM08zNXBC?=
 =?utf-8?B?dEJadWpNdks3djY4TmZoL2JPRGcwb2FkbStTanU1OVBNQmxJRnM4NmVJdDRx?=
 =?utf-8?B?dUMwMDd2MjhhejNGNXZGb01vZlkxLzQ5S01meCtqSEVUeHNCS085cjhINExL?=
 =?utf-8?B?ZTlsazZyYjNwWjJkRWpBMlMvT2pLTzZoNUVzUUl0RnRrTkZkd2ZoNnptWGoz?=
 =?utf-8?B?aEpra3RhcFVDSHBjV1hwM2JlOFRYUWY4Z1cxSHowQ0wxZndzZUlLUC9OeGFM?=
 =?utf-8?B?ZlRNVHpqcVQ5WUFrTUFKTHhiekc5bzFhSU43cUdVYmtvQ3NFd2x0dVhFUzU5?=
 =?utf-8?B?emJ5dGhjNnRiZysyQUNHZE5JT3puTzF2Y2lVdzExNGNYM2d1SklNRm9NeUJt?=
 =?utf-8?B?ZEZ0NElDdmorMGlUYnc5VUMyVXJVZS9sNUV3V3draFlkclJKR2FrdUhJM0E3?=
 =?utf-8?B?RjltWjc5Vm5vbVVkWWlNMTRiQkJwL29SUUhVV1hNNmdRTStXeTVRbUNZdHNv?=
 =?utf-8?B?MHF4bDEzSGp3WjFYRU0vb3lkNHNYVllKaFVCQlNDK0V6YWRQaEtvRjEwMVdE?=
 =?utf-8?B?WkQ2Y2kzQkoreXMyMytpeG9UdDdKaURKQlhHOVlVekxpZEVreGVVUWZhYXh2?=
 =?utf-8?B?OGNVeDEzQzlNQ1k2RjNoUzd5RGdHVS9Id2MvNnZlbDM3L3RQNnRub0ZtZk5k?=
 =?utf-8?B?VXo4NXBLeTZ6SDdUVUszUi8zb3czTk9rb3I0RmluTkR1eTZENDByZUZ4Z2VB?=
 =?utf-8?B?MnRFdDRlNDdNUmdnL0xlODBrWTlGUVRSZ09hVzdRYVBTTXM4OWVObWRlN2FX?=
 =?utf-8?B?c0liYTFMOS9BSzRSUUw4K0Q2WStucHhFRTZQUFNsNzRGNkxFSmdVeUZmZVdi?=
 =?utf-8?B?a092YnNZREV3YW1vaE95SGF0ZzdVZUI5Z2YxMlBxY0NXYU5pWkkzVUdPSmtR?=
 =?utf-8?B?NGRDRVZISG03RThlSnZadTZZNHkwY0lJSlRqNWlRQmhvOS9GcitxMnA0cDh0?=
 =?utf-8?Q?PnRtUpaP4cfkGTOGMGnij9U1JqgMZsZWpaj3X8o?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db51f0e-cfdc-438c-4f96-08d8fe84b353
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:01:57.1769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiKDGJWo5lBg5AzKzvOG8FZT2l5aPVS+m3QGSEjz01tk4pCPTFFtsatO2ltO/iiNgIPmcthF9CexatWEW/B38A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096
X-OriginatorOrg: citrix.com

Hello,

The following series introduces a new CPUID/MSR interface for the
xenguest library. Such interface handles both CPUID and MSRs using the
same opaque object, and provides some helpers for the user to peek or
modify such data without exposing the backing type. This is useful for
future development as CPUID and MSRs are closely related, so it makes
handling those much easier if they are inside the same object (ie: a
change to a CPUID bit might expose or hide an MSR).

In this patch series libxl and other in tree users have been switched to
use the new interface, so it shouldn't result in any functional change
from a user point of view.

Note there are still some missing pieces likely. The way to modify CPUID
data is not ideal, as it requires fetching a leaf and modifying it
directly. We might want some kind of interface in order to set specific
CPUID features more easily, but that's to be discussed, and would be
done as a follow up series.

Thanks, Roger.

Roger Pau Monne (21):
  libxl: don't ignore the return value from xc_cpuid_apply_policy
  libs/guest: rename xc_get_cpu_policy_size to xc_cpu_policy_get_size
  libs/guest: introduce xc_cpu_policy_t
  libs/guest: introduce helper to fetch a system cpu policy
  libs/guest: introduce helper to fetch a domain cpu policy
  libs/guest: introduce helper to serialize a cpu policy
  tools: switch existing users of xc_get_{system,domain}_cpu_policy
  libs/guest: introduce a helper to apply a cpu policy to a domain
  libs/guest: allow fetching a specific CPUID leaf from a cpu policy
  tests/cpu-policy: add sorted MSR test
  libs/guest: allow fetching a specific MSR entry from a cpu policy
  libs/guest: allow updating a cpu policy CPUID data
  libs/guest: allow updating a cpu policy MSR data
  libs/guest: introduce helper to check cpu policy compatibility
  libs/guest: obtain a compatible cpu policy from two input ones
  libs/guest: make a cpu policy compatible with older Xen versions
  libs/guest: introduce helper set cpu topology in cpu policy
  libs/guest: rework xc_cpuid_xend_policy
  libs/guest: apply a featureset into a cpu policy
  libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
  libs/guest: (re)move xc_cpu_policy_apply_cpuid

 tools/include/libxl.h                    |   6 +-
 tools/include/xen-tools/libs.h           |   5 +
 tools/include/xenctrl.h                  | 102 ++--
 tools/libs/guest/Makefile                |   2 +-
 tools/libs/guest/xg_cpuid_x86.c          | 710 +++++++++++++++--------
 tools/libs/guest/xg_sr_common_x86.c      |  17 +-
 tools/libs/light/libxl_cpuid.c           | 230 +++++++-
 tools/libs/light/libxl_create.c          |   5 +-
 tools/libs/light/libxl_dom.c             |   2 +-
 tools/libs/light/libxl_internal.h        |  32 +-
 tools/libs/light/libxl_nocpuid.c         |   5 +-
 tools/misc/xen-cpuid.c                   |  23 +-
 tools/tests/cpu-policy/test-cpu-policy.c |  17 +
 13 files changed, 821 insertions(+), 335 deletions(-)

-- 
2.30.1


