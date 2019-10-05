Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB13CC72D
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2019 03:24:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGYjt-0008Sn-IG; Sat, 05 Oct 2019 01:20:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UoQ4=X6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iGYjs-0008JR-7R
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2019 01:20:04 +0000
X-Inumbo-ID: 3ff7cd42-e70e-11e9-80e3-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ff7cd42-e70e-11e9-80e3-bc764e2007e4;
 Sat, 05 Oct 2019 01:20:00 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iGYjn-0006Nc-Ff; Sat, 05 Oct 2019 01:19:59 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iGYjm-0003mf-KA; Sat, 05 Oct 2019 01:19:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iGYjm-0001fL-Ja; Sat, 05 Oct 2019 01:19:58 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1iGYjm-0001fL-Ja@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 05 Oct 2019 01:19:58 +0000
Subject: [Xen-devel] [qemu-mainline bisection] complete
 test-amd64-i386-qemuu-rhel6hvm-amd
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5431900188851872153=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5431900188851872153==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-qemuu-rhel6hvm-amd
testid redhat-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  a77d20bafcd4cb7684168a9b4c6dc2a321aaeb50
  Bug not present: 084f67c9d98d520c51df24f3b355774166a03691
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/142293/


  commit a77d20bafcd4cb7684168a9b4c6dc2a321aaeb50
  Merge: 084f67c9d9 6bf21f3d83
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Thu Sep 19 17:16:07 2019 +0100
  
      Merge remote-tracking branch 'remotes/kraxel/tags/ui-20190919-pull-request' into staging
      
      ui: add barrier client.
      ui: bugfixes for vnc & egl.
      
      # gpg: Signature made Thu 19 Sep 2019 08:09:05 BST
      # gpg:                using RSA key 4CB6D8EED3E87138
      # gpg: Good signature from "Gerd Hoffmann (work) <kraxel@redhat.com>" [full]
      # gpg:                 aka "Gerd Hoffmann <gerd@kraxel.org>" [full]
      # gpg:                 aka "Gerd Hoffmann (private) <kraxel@gmail.com>" [full]
      # Primary key fingerprint: A032 8CFF B93A 17A7 9901  FE7D 4CB6 D8EE D3E8 7138
      
      * remotes/kraxel/tags/ui-20190919-pull-request:
        vnc: fix memory leak when vnc disconnect
        ui: add an embedded Barrier client
        vnc: fix websocket field in events
        ui/egl: fix framebuffer reads
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 6bf21f3d83e95bcc4ba35a7a07cc6655e8b010b0
  Author: Li Qiang <liq3ea@163.com>
  Date:   Sat Aug 31 08:39:22 2019 -0700
  
      vnc: fix memory leak when vnc disconnect
      
      Currently when qemu receives a vnc connect, it creates a 'VncState' to
      represent this connection. In 'vnc_worker_thread_loop' it creates a
      local 'VncState'. The connection 'VcnState' and local 'VncState' exchange
      data in 'vnc_async_encoding_start' and 'vnc_async_encoding_end'.
      In 'zrle_compress_data' it calls 'deflateInit2' to allocate the libz library
      opaque data. The 'VncState' used in 'zrle_compress_data' is the local
      'VncState'. In 'vnc_zrle_clear' it calls 'deflateEnd' to free the libz
      library opaque data. The 'VncState' used in 'vnc_zrle_clear' is the connection
      'VncState'. In currently implementation there will be a memory leak when the
      vnc disconnect. Following is the asan output backtrack:
      
      Direct leak of 29760 byte(s) in 5 object(s) allocated from:
          0 0xffffa67ef3c3 in __interceptor_calloc (/lib64/libasan.so.4+0xd33c3)
          1 0xffffa65071cb in g_malloc0 (/lib64/libglib-2.0.so.0+0x571cb)
          2 0xffffa5e968f7 in deflateInit2_ (/lib64/libz.so.1+0x78f7)
          3 0xaaaacec58613 in zrle_compress_data ui/vnc-enc-zrle.c:87
          4 0xaaaacec58613 in zrle_send_framebuffer_update ui/vnc-enc-zrle.c:344
          5 0xaaaacec34e77 in vnc_send_framebuffer_update ui/vnc.c:919
          6 0xaaaacec5e023 in vnc_worker_thread_loop ui/vnc-jobs.c:271
          7 0xaaaacec5e5e7 in vnc_worker_thread ui/vnc-jobs.c:340
          8 0xaaaacee4d3c3 in qemu_thread_start util/qemu-thread-posix.c:502
          9 0xffffa544e8bb in start_thread (/lib64/libpthread.so.0+0x78bb)
          10 0xffffa53965cb in thread_start (/lib64/libc.so.6+0xd55cb)
      
      This is because the opaque allocated in 'deflateInit2' is not freed in
      'deflateEnd'. The reason is that the 'deflateEnd' calls 'deflateStateCheck'
      and in the latter will check whether 's->strm != strm'(libz's data structure).
      This check will be true so in 'deflateEnd' it just return 'Z_STREAM_ERROR' and
      not free the data allocated in 'deflateInit2'.
      
      The reason this happens is that the 'VncState' contains the whole 'VncZrle',
      so when calling 'deflateInit2', the 's->strm' will be the local address.
      So 's->strm != strm' will be true.
      
      To fix this issue, we need to make 'zrle' of 'VncState' to be a pointer.
      Then the connection 'VncState' and local 'VncState' exchange mechanism will
      work as expection. The 'tight' of 'VncState' has the same issue, let's also turn
      it to a pointer.
      
      Reported-by: Ying Fang <fangying1@huawei.com>
      Signed-off-by: Li Qiang <liq3ea@163.com>
      Message-id: 20190831153922.121308-1-liq3ea@163.com
      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
  
  commit 6105683da35babad9ae168a72d1e89e63e9d6974
  Author: Laurent Vivier <laurent@vivier.eu>
  Date:   Fri Sep 6 10:38:12 2019 +0200
  
      ui: add an embedded Barrier client
      
      This allows to receive mouse and keyboard events from
      a Barrier server.
      
      This is enabled by adding the following parameter on the
      command line
      
          ... -object input-barrier,id=$id,name=$name ...
      
      Where $name is the name declared in the screens section of barrier.conf
      
      The barrier server (barriers) must be configured and must run on the
      local host.
      
      For instance:
      
        section: screens
            localhost:
                ...
            VM-1:
                ...
            end
      
        section: links
            localhost:
                right = VM-1
            VM-1:
                left = localhost
        end
      
      Then on the QEMU command line:
      
          ... -object input-barrier,id=barrie0,name=VM-1 ...
      
      When the mouse will move out of the screen of the local host on
      the right, the mouse and the keyboard will be grabbed and all
      related events will be send to the guest OS.
      
      This is usefull when qemu is configured without emulated graphic card
      but with a VFIO attached graphic card.
      
      More information about Barrier can be found at:
      
        https://github.com/debauchee/barrier
      
      This avoids to install the Barrier server in the guest OS,
      for instance when it is not supported or during the installation.
      
      Signed-off-by: Laurent Vivier <laurent@vivier.eu>
      Message-id: 20190906083812.29487-1-laurent@vivier.eu
      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
  
  commit e1b3d47751a420835cb0560fd029c39fea961a79
  Author: Gerd Hoffmann <kraxel@redhat.com>
  Date:   Wed Sep 4 07:52:50 2019 +0200
  
      vnc: fix websocket field in events
      
      Just need to fill VncClientInfo.websocket in vnc_client_cache_addr().
      
      Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1748175
      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
      Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
      Message-id: 20190904055250.22421-1-kraxel@redhat.com
  
  commit d2329237af197429492ec27d22a4ba4f121dbc10
  Author: Gerd Hoffmann <kraxel@redhat.com>
  Date:   Mon Sep 9 09:39:11 2019 +0200
  
      ui/egl: fix framebuffer reads
      
      Fix egl_fb_read() to use the (destination) surface size instead of the
      (source) framebuffer source for glReadPixels.  Pass the DisplaySurface
      instead of the pixeldata pointer to egl_fb_read() to make this possible.
      
      With that in place framebuffer reads work fine even if the surface and
      framebuffer sizes don't match, so we can remove the guest-triggerable
      asserts in egl_scanout_flush().
      
      Buglink: https://bugzilla.redhat.com//show_bug.cgi?id=1749659
      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Message-id: 20190909073911.24787-1-kraxel@redhat.com


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-qemuu-rhel6hvm-amd.redhat-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-qemuu-rhel6hvm-amd.redhat-install --summary-out=tmp/142293.bisection-summary --basis-template=140282 --blessings=real,real-bisect qemu-mainline test-amd64-i386-qemuu-rhel6hvm-amd redhat-install
Searching for failure / basis pass:
 142243 fail [host=pinot0] / 141466 [host=pinot1] 141434 ok.
Failure / basis pass flights: 142243 / 141434
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 5be5439a5a4e45382abdba2a4339db4bb8e4bbcb d0d8ad39ecb51cd7497cd524484fe09f50876798 4f59102571fce49af180cfc6d4cdd2b5df7bdb14 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
Basis pass 3ffe1e79c174b2093f7ee3df589a7705572c9620 c530a75c1e6a472b0eb9558310b518f0dfcd8860 18be724e302295164f00c955b6c407991f57b172 d0d8ad39ecb51cd7497cd524484fe09f50876798 f8c3db33a5e863291182f8862ddf81618a7c6194 43f5df79dad6738d52ea79d072de2b56eb96a91f 1014f47c7a808e025b8920ab80bfe73a2888b3e5
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#3ffe1e79c174b2093f7ee3df589a7705572c9620-f6e27dbb1afabcba436e346d6aa88a592a1436bb git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#18be724e302295164f00c955b6c407991f57b172-5be5439a5a4e45382abdba2a4339db4bb8e4bbcb git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://git.qemu.org/qemu.git#f8c3db33a5e863291182f8862ddf81618a7c6194-4f59102571fce49af180cfc6d4cdd2b5df7bdb14 git://xenbits.xen.org/osstest/seabios.git#43f5df79dad6738d52ea79d072de2b56eb96a91f-43f5df79dad6738d52ea79d072de2b56eb96a91f git://xenbits.xen.org/xen.git#1014f47c7a808e025b8920ab80bfe73a2888b3e5-f93abf0315efef861270c25d83c8047fd6a54ec4
Loaded 14261 nodes in revision graph
Searching for test results:
 141434 pass 3ffe1e79c174b2093f7ee3df589a7705572c9620 c530a75c1e6a472b0eb9558310b518f0dfcd8860 18be724e302295164f00c955b6c407991f57b172 d0d8ad39ecb51cd7497cd524484fe09f50876798 f8c3db33a5e863291182f8862ddf81618a7c6194 43f5df79dad6738d52ea79d072de2b56eb96a91f 1014f47c7a808e025b8920ab80bfe73a2888b3e5
 141497 fail irrelevant
 141466 [host=pinot1]
 141578 fail irrelevant
 141693 fail irrelevant
 141632 fail irrelevant
 141824 fail irrelevant
 141751 fail irrelevant
 141925 fail irrelevant
 141886 fail irrelevant
 141992 fail irrelevant
 141963 fail f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 e86664d2b03d0a84b8b952f3d5111424b3e9c916 d0d8ad39ecb51cd7497cd524484fe09f50876798 c6f5012ba5fa834cbd5274b1b8369e2c5d2f5933 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 142013 fail irrelevant
 142062 fail f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 f835e1d4c187014742fbd766ec2fbc07ef5384ba d0d8ad39ecb51cd7497cd524484fe09f50876798 95e9d74fe4281f7ad79a5a7511400541729aa44a 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 142191 blocked f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 ebe15582cafeb944a1c6e99aa526e81a1551c567 43f5df79dad6738d52ea79d072de2b56eb96a91f 84c3ae30aa79b54b3d75a2e62ae1fb340419b8d7
 142108 fail irrelevant
 142175 fail f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 c70fef962e804eba483512b64ec24169871060be d0d8ad39ecb51cd7497cd524484fe09f50876798 d4e536f336d3d26c9fafa2a2549aaa0b014f5b6b 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 142170 pass 3ffe1e79c174b2093f7ee3df589a7705572c9620 c530a75c1e6a472b0eb9558310b518f0dfcd8860 18be724e302295164f00c955b6c407991f57b172 d0d8ad39ecb51cd7497cd524484fe09f50876798 f8c3db33a5e863291182f8862ddf81618a7c6194 43f5df79dad6738d52ea79d072de2b56eb96a91f 1014f47c7a808e025b8920ab80bfe73a2888b3e5
 142180 fail f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 670c903a68f214463f12c0c9619c162a0f342518 d0d8ad39ecb51cd7497cd524484fe09f50876798 8400efa51aa0a7908d7edb8ac6135e2fe69b4b37 43f5df79dad6738d52ea79d072de2b56eb96a91f c4a5656b2ef3d29bb8acfb5342e786a5b9578018
 142178 fail f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 590c9d58280bb0fad144f760c4da2acaf16622aa d0d8ad39ecb51cd7497cd524484fe09f50876798 860d9048c78ce59c5903c3d5209df56f38400986 43f5df79dad6738d52ea79d072de2b56eb96a91f df29d03f1d97bdde1bc0cea8ef8538d4f524b3ec
 142173 fail irrelevant
 142183 blocked f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 4300b7c2cd9f3f273804e8cca325842ccb93b1ad 43f5df79dad6738d52ea79d072de2b56eb96a91f 84c3ae30aa79b54b3d75a2e62ae1fb340419b8d7
 142185 pass b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 590c0ac982a8fc726f4784bb6e3c721661e0718a 43f5df79dad6738d52ea79d072de2b56eb96a91f 5a929b6180243e0ba41c84c7905f4f8ffc9186fc
 142189 blocked b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 f4c898f2b2db2819c519cdce05403d4ba0234979 d0d8ad39ecb51cd7497cd524484fe09f50876798 754119198de633683d7af79bc08e73c2de9df011 43f5df79dad6738d52ea79d072de2b56eb96a91f a30910bfd71a64895f0d6ddbb301cf1b5ed6c2f4
 142194 blocked b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 f5c7af6295b18c9cb9bc183648ce37481b49f432 43f5df79dad6738d52ea79d072de2b56eb96a91f ae84f55353475f569daddb9a81ac0a6bc7772c90
 142197 pass cdc9acde7a72c6fe8e221f1a735bb12906ea3d02 c530a75c1e6a472b0eb9558310b518f0dfcd8860 18be724e302295164f00c955b6c407991f57b172 d0d8ad39ecb51cd7497cd524484fe09f50876798 f8c3db33a5e863291182f8862ddf81618a7c6194 43f5df79dad6738d52ea79d072de2b56eb96a91f 1014f47c7a808e025b8920ab80bfe73a2888b3e5
 142201 pass b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 6b2a203579068127d7e93cb6f45d828ca04a2153 43f5df79dad6738d52ea79d072de2b56eb96a91f 9caed751db9110c785fd6b1def89d808baa1d907
 142204 pass b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 aab0e2a661b2b6bf7915c0aefe807fb60d6d9d13 43f5df79dad6738d52ea79d072de2b56eb96a91f 9caed751db9110c785fd6b1def89d808baa1d907
 142235 blocked c37ae2a30a4c4db4ce64fa578a78514fbe69c854 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 4300b7c2cd9f3f273804e8cca325842ccb93b1ad 43f5df79dad6738d52ea79d072de2b56eb96a91f ae84f55353475f569daddb9a81ac0a6bc7772c90
 142220 fail f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 5be5439a5a4e45382abdba2a4339db4bb8e4bbcb d0d8ad39ecb51cd7497cd524484fe09f50876798 7f21573c822805a8e6be379d9bcf3ad9effef3dc 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 142207 pass d83ad53cbc8a3d4fa313d3bac8dd072c2aa14b37 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d652b458f576de785e9f905e6690e28904b1eed1 d0d8ad39ecb51cd7497cd524484fe09f50876798 ab486ea9f4dc8aa2ecf04afb767da62ed87adfc8 43f5df79dad6738d52ea79d072de2b56eb96a91f 2655bfaa5df3dae62218a731ce6fac38639968e9
 142211 pass fae7ff46beb2445153ba500c134dba606b81ea20 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d652b458f576de785e9f905e6690e28904b1eed1 d0d8ad39ecb51cd7497cd524484fe09f50876798 f8c3db33a5e863291182f8862ddf81618a7c6194 43f5df79dad6738d52ea79d072de2b56eb96a91f 2655bfaa5df3dae62218a731ce6fac38639968e9
 142213 blocked b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 fb45770bf55ef1d50369c433b19d908260d5a986 43f5df79dad6738d52ea79d072de2b56eb96a91f ae84f55353475f569daddb9a81ac0a6bc7772c90
 142256 blocked b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 f4c898f2b2db2819c519cdce05403d4ba0234979 d0d8ad39ecb51cd7497cd524484fe09f50876798 6b2a203579068127d7e93cb6f45d828ca04a2153 43f5df79dad6738d52ea79d072de2b56eb96a91f ef73b926bb74bdce22053e3e41cfbb7ae9259fa8
 142237 pass 3ffe1e79c174b2093f7ee3df589a7705572c9620 c530a75c1e6a472b0eb9558310b518f0dfcd8860 18be724e302295164f00c955b6c407991f57b172 d0d8ad39ecb51cd7497cd524484fe09f50876798 f8c3db33a5e863291182f8862ddf81618a7c6194 43f5df79dad6738d52ea79d072de2b56eb96a91f 1014f47c7a808e025b8920ab80bfe73a2888b3e5
 142214 blocked ea4a173d8358b756a780786baa3fc39d282bdbe3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 6b2a203579068127d7e93cb6f45d828ca04a2153 43f5df79dad6738d52ea79d072de2b56eb96a91f ae84f55353475f569daddb9a81ac0a6bc7772c90
 142216 blocked b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 f4c898f2b2db2819c519cdce05403d4ba0234979 d0d8ad39ecb51cd7497cd524484fe09f50876798 471c97a6938bda16f6e10e33437d96241482f580 43f5df79dad6738d52ea79d072de2b56eb96a91f a7cd57fe8d77a991a30aab650991daf85d6ab8f9
 142283 fail b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 a77d20bafcd4cb7684168a9b4c6dc2a321aaeb50 43f5df79dad6738d52ea79d072de2b56eb96a91f 5a929b6180243e0ba41c84c7905f4f8ffc9186fc
 142240 fail f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 5be5439a5a4e45382abdba2a4339db4bb8e4bbcb d0d8ad39ecb51cd7497cd524484fe09f50876798 7f21573c822805a8e6be379d9bcf3ad9effef3dc 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 142269 pass 3ffe1e79c174b2093f7ee3df589a7705572c9620 c530a75c1e6a472b0eb9558310b518f0dfcd8860 18be724e302295164f00c955b6c407991f57b172 d0d8ad39ecb51cd7497cd524484fe09f50876798 f8c3db33a5e863291182f8862ddf81618a7c6194 43f5df79dad6738d52ea79d072de2b56eb96a91f 1014f47c7a808e025b8920ab80bfe73a2888b3e5
 142260 blocked c9e6a3f0e9fa14f99457a506a91f346c6161ee21 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 6b2a203579068127d7e93cb6f45d828ca04a2153 43f5df79dad6738d52ea79d072de2b56eb96a91f ae84f55353475f569daddb9a81ac0a6bc7772c90
 142219 pass b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 13bfe3e4520f509e7cb86085ea21276b1c4fc83b d0d8ad39ecb51cd7497cd524484fe09f50876798 754119198de633683d7af79bc08e73c2de9df011 43f5df79dad6738d52ea79d072de2b56eb96a91f ce44fd015e55d0ecc47c160fb5ce69070aa4991b
 142226 blocked 39204487dbc30efbc049633ccd83eb6337ee072e c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 ebe15582cafeb944a1c6e99aa526e81a1551c567 43f5df79dad6738d52ea79d072de2b56eb96a91f ae84f55353475f569daddb9a81ac0a6bc7772c90
 142244 pass b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 f4c898f2b2db2819c519cdce05403d4ba0234979 d0d8ad39ecb51cd7497cd524484fe09f50876798 471c97a6938bda16f6e10e33437d96241482f580 43f5df79dad6738d52ea79d072de2b56eb96a91f 0fa2525b81c0f9065e4a90e458a5b0c014daa05a
 142278 fail b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 a77d20bafcd4cb7684168a9b4c6dc2a321aaeb50 43f5df79dad6738d52ea79d072de2b56eb96a91f ce44fd015e55d0ecc47c160fb5ce69070aa4991b
 142229 blocked c607026c28f1de0b2523022b0be4eb20a6554114 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 6b2a203579068127d7e93cb6f45d828ca04a2153 43f5df79dad6738d52ea79d072de2b56eb96a91f ae84f55353475f569daddb9a81ac0a6bc7772c90
 142247 blocked b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 f4c898f2b2db2819c519cdce05403d4ba0234979 d0d8ad39ecb51cd7497cd524484fe09f50876798 754119198de633683d7af79bc08e73c2de9df011 43f5df79dad6738d52ea79d072de2b56eb96a91f b215f2ab6a074e45db704e39f7cc24dcc5e92506
 142231 blocked b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 f4c898f2b2db2819c519cdce05403d4ba0234979 d0d8ad39ecb51cd7497cd524484fe09f50876798 a77d20bafcd4cb7684168a9b4c6dc2a321aaeb50 43f5df79dad6738d52ea79d072de2b56eb96a91f 1e3304005ef0d30a117a2f120e643bd2c0cb9813
 142233 blocked b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 f4c898f2b2db2819c519cdce05403d4ba0234979 d0d8ad39ecb51cd7497cd524484fe09f50876798 6b2a203579068127d7e93cb6f45d828ca04a2153 43f5df79dad6738d52ea79d072de2b56eb96a91f c1ceba9e81299cd7e17488f216c5d48b3f562970
 142271 fail f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 5be5439a5a4e45382abdba2a4339db4bb8e4bbcb d0d8ad39ecb51cd7497cd524484fe09f50876798 4f59102571fce49af180cfc6d4cdd2b5df7bdb14 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 142248 blocked b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 f4c898f2b2db2819c519cdce05403d4ba0234979 d0d8ad39ecb51cd7497cd524484fe09f50876798 a77d20bafcd4cb7684168a9b4c6dc2a321aaeb50 43f5df79dad6738d52ea79d072de2b56eb96a91f e3e2de24ad3b44be0418cb40c751ec193c21096e
 142251 blocked 3d9038f6f4803b4924cd8d6d426ad0778069648e c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 ebe15582cafeb944a1c6e99aa526e81a1551c567 43f5df79dad6738d52ea79d072de2b56eb96a91f ae84f55353475f569daddb9a81ac0a6bc7772c90
 142255 blocked ee8e82fdbed328fb3a6c9bc19ac36795770906a8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 ebe15582cafeb944a1c6e99aa526e81a1551c567 43f5df79dad6738d52ea79d072de2b56eb96a91f ae84f55353475f569daddb9a81ac0a6bc7772c90
 142262 blocked 120d5674a14f5d641970bc4287a752e60415b17c c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcdedafd97c8f18c33a63d26b954e5dbaee81a2b d0d8ad39ecb51cd7497cd524484fe09f50876798 6b2a203579068127d7e93cb6f45d828ca04a2153 43f5df79dad6738d52ea79d072de2b56eb96a91f ae84f55353475f569daddb9a81ac0a6bc7772c90
 142281 pass b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 084f67c9d98d520c51df24f3b355774166a03691 43f5df79dad6738d52ea79d072de2b56eb96a91f 5a929b6180243e0ba41c84c7905f4f8ffc9186fc
 142243 fail f6e27dbb1afabcba436e346d6aa88a592a1436bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 5be5439a5a4e45382abdba2a4339db4bb8e4bbcb d0d8ad39ecb51cd7497cd524484fe09f50876798 4f59102571fce49af180cfc6d4cdd2b5df7bdb14 43f5df79dad6738d52ea79d072de2b56eb96a91f f93abf0315efef861270c25d83c8047fd6a54ec4
 142266 fail b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 f4c898f2b2db2819c519cdce05403d4ba0234979 d0d8ad39ecb51cd7497cd524484fe09f50876798 a77d20bafcd4cb7684168a9b4c6dc2a321aaeb50 43f5df79dad6738d52ea79d072de2b56eb96a91f 8cdda0edc3f52c9fe1d2695ddda6a8854d26d550
 142288 pass b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 084f67c9d98d520c51df24f3b355774166a03691 43f5df79dad6738d52ea79d072de2b56eb96a91f 5a929b6180243e0ba41c84c7905f4f8ffc9186fc
 142273 pass b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 aab0e2a661b2b6bf7915c0aefe807fb60d6d9d13 43f5df79dad6738d52ea79d072de2b56eb96a91f 69a77e40083ab629571827f727fd2f6a4dd53e1e
 142293 fail b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 a77d20bafcd4cb7684168a9b4c6dc2a321aaeb50 43f5df79dad6738d52ea79d072de2b56eb96a91f 5a929b6180243e0ba41c84c7905f4f8ffc9186fc
 142290 fail b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 a77d20bafcd4cb7684168a9b4c6dc2a321aaeb50 43f5df79dad6738d52ea79d072de2b56eb96a91f 5a929b6180243e0ba41c84c7905f4f8ffc9186fc
 142292 pass b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 084f67c9d98d520c51df24f3b355774166a03691 43f5df79dad6738d52ea79d072de2b56eb96a91f 5a929b6180243e0ba41c84c7905f4f8ffc9186fc
Searching for interesting versions
 Result found: flight 141434 (pass), for basis pass
 Result found: flight 142243 (fail), for basis failure
 Repro found: flight 142269 (pass), for basis pass
 Repro found: flight 142271 (fail), for basis failure
 0 revisions at b10ab5e2c476b69689bc0c46d309471b597c880c c530a75c1e6a472b0eb9558310b518f0dfcd8860 85ccbee2abf4ac9ed006409d1b02a3bdd660261c d0d8ad39ecb51cd7497cd524484fe09f50876798 084f67c9d98d520c51df24f3b355774166a03691 43f5df79dad6738d52ea79d072de2b56eb96a91f 5a929b6180243e0ba41c84c7905f4f8ffc9186fc
No revisions left to test, checking graph state.
 Result found: flight 142281 (pass), for last pass
 Result found: flight 142283 (fail), for first failure
 Repro found: flight 142288 (pass), for last pass
 Repro found: flight 142290 (fail), for first failure
 Repro found: flight 142292 (pass), for last pass
 Repro found: flight 142293 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  a77d20bafcd4cb7684168a9b4c6dc2a321aaeb50
  Bug not present: 084f67c9d98d520c51df24f3b355774166a03691
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/142293/


  commit a77d20bafcd4cb7684168a9b4c6dc2a321aaeb50
  Merge: 084f67c9d9 6bf21f3d83
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Thu Sep 19 17:16:07 2019 +0100
  
      Merge remote-tracking branch 'remotes/kraxel/tags/ui-20190919-pull-request' into staging
      
      ui: add barrier client.
      ui: bugfixes for vnc & egl.
      
      # gpg: Signature made Thu 19 Sep 2019 08:09:05 BST
      # gpg:                using RSA key 4CB6D8EED3E87138
      # gpg: Good signature from "Gerd Hoffmann (work) <kraxel@redhat.com>" [full]
      # gpg:                 aka "Gerd Hoffmann <gerd@kraxel.org>" [full]
      # gpg:                 aka "Gerd Hoffmann (private) <kraxel@gmail.com>" [full]
      # Primary key fingerprint: A032 8CFF B93A 17A7 9901  FE7D 4CB6 D8EE D3E8 7138
      
      * remotes/kraxel/tags/ui-20190919-pull-request:
        vnc: fix memory leak when vnc disconnect
        ui: add an embedded Barrier client
        vnc: fix websocket field in events
        ui/egl: fix framebuffer reads
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 6bf21f3d83e95bcc4ba35a7a07cc6655e8b010b0
  Author: Li Qiang <liq3ea@163.com>
  Date:   Sat Aug 31 08:39:22 2019 -0700
  
      vnc: fix memory leak when vnc disconnect
      
      Currently when qemu receives a vnc connect, it creates a 'VncState' to
      represent this connection. In 'vnc_worker_thread_loop' it creates a
      local 'VncState'. The connection 'VcnState' and local 'VncState' exchange
      data in 'vnc_async_encoding_start' and 'vnc_async_encoding_end'.
      In 'zrle_compress_data' it calls 'deflateInit2' to allocate the libz library
      opaque data. The 'VncState' used in 'zrle_compress_data' is the local
      'VncState'. In 'vnc_zrle_clear' it calls 'deflateEnd' to free the libz
      library opaque data. The 'VncState' used in 'vnc_zrle_clear' is the connection
      'VncState'. In currently implementation there will be a memory leak when the
      vnc disconnect. Following is the asan output backtrack:
      
      Direct leak of 29760 byte(s) in 5 object(s) allocated from:
          0 0xffffa67ef3c3 in __interceptor_calloc (/lib64/libasan.so.4+0xd33c3)
          1 0xffffa65071cb in g_malloc0 (/lib64/libglib-2.0.so.0+0x571cb)
          2 0xffffa5e968f7 in deflateInit2_ (/lib64/libz.so.1+0x78f7)
          3 0xaaaacec58613 in zrle_compress_data ui/vnc-enc-zrle.c:87
          4 0xaaaacec58613 in zrle_send_framebuffer_update ui/vnc-enc-zrle.c:344
          5 0xaaaacec34e77 in vnc_send_framebuffer_update ui/vnc.c:919
          6 0xaaaacec5e023 in vnc_worker_thread_loop ui/vnc-jobs.c:271
          7 0xaaaacec5e5e7 in vnc_worker_thread ui/vnc-jobs.c:340
          8 0xaaaacee4d3c3 in qemu_thread_start util/qemu-thread-posix.c:502
          9 0xffffa544e8bb in start_thread (/lib64/libpthread.so.0+0x78bb)
          10 0xffffa53965cb in thread_start (/lib64/libc.so.6+0xd55cb)
      
      This is because the opaque allocated in 'deflateInit2' is not freed in
      'deflateEnd'. The reason is that the 'deflateEnd' calls 'deflateStateCheck'
      and in the latter will check whether 's->strm != strm'(libz's data structure).
      This check will be true so in 'deflateEnd' it just return 'Z_STREAM_ERROR' and
      not free the data allocated in 'deflateInit2'.
      
      The reason this happens is that the 'VncState' contains the whole 'VncZrle',
      so when calling 'deflateInit2', the 's->strm' will be the local address.
      So 's->strm != strm' will be true.
      
      To fix this issue, we need to make 'zrle' of 'VncState' to be a pointer.
      Then the connection 'VncState' and local 'VncState' exchange mechanism will
      work as expection. The 'tight' of 'VncState' has the same issue, let's also turn
      it to a pointer.
      
      Reported-by: Ying Fang <fangying1@huawei.com>
      Signed-off-by: Li Qiang <liq3ea@163.com>
      Message-id: 20190831153922.121308-1-liq3ea@163.com
      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
  
  commit 6105683da35babad9ae168a72d1e89e63e9d6974
  Author: Laurent Vivier <laurent@vivier.eu>
  Date:   Fri Sep 6 10:38:12 2019 +0200
  
      ui: add an embedded Barrier client
      
      This allows to receive mouse and keyboard events from
      a Barrier server.
      
      This is enabled by adding the following parameter on the
      command line
      
          ... -object input-barrier,id=$id,name=$name ...
      
      Where $name is the name declared in the screens section of barrier.conf
      
      The barrier server (barriers) must be configured and must run on the
      local host.
      
      For instance:
      
        section: screens
            localhost:
                ...
            VM-1:
                ...
            end
      
        section: links
            localhost:
                right = VM-1
            VM-1:
                left = localhost
        end
      
      Then on the QEMU command line:
      
          ... -object input-barrier,id=barrie0,name=VM-1 ...
      
      When the mouse will move out of the screen of the local host on
      the right, the mouse and the keyboard will be grabbed and all
      related events will be send to the guest OS.
      
      This is usefull when qemu is configured without emulated graphic card
      but with a VFIO attached graphic card.
      
      More information about Barrier can be found at:
      
        https://github.com/debauchee/barrier
      
      This avoids to install the Barrier server in the guest OS,
      for instance when it is not supported or during the installation.
      
      Signed-off-by: Laurent Vivier <laurent@vivier.eu>
      Message-id: 20190906083812.29487-1-laurent@vivier.eu
      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
  
  commit e1b3d47751a420835cb0560fd029c39fea961a79
  Author: Gerd Hoffmann <kraxel@redhat.com>
  Date:   Wed Sep 4 07:52:50 2019 +0200
  
      vnc: fix websocket field in events
      
      Just need to fill VncClientInfo.websocket in vnc_client_cache_addr().
      
      Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1748175
      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
      Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
      Message-id: 20190904055250.22421-1-kraxel@redhat.com
  
  commit d2329237af197429492ec27d22a4ba4f121dbc10
  Author: Gerd Hoffmann <kraxel@redhat.com>
  Date:   Mon Sep 9 09:39:11 2019 +0200
  
      ui/egl: fix framebuffer reads
      
      Fix egl_fb_read() to use the (destination) surface size instead of the
      (source) framebuffer source for glReadPixels.  Pass the DisplaySurface
      instead of the pixeldata pointer to egl_fb_read() to make this possible.
      
      With that in place framebuffer reads work fine even if the surface and
      framebuffer sizes don't match, so we can remove the guest-triggerable
      asserts in egl_scanout_flush().
      
      Buglink: https://bugzilla.redhat.com//show_bug.cgi?id=1749659
      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Message-id: 20190909073911.24787-1-kraxel@redhat.com

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.696874 to fit
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-qemuu-rhel6hvm-amd.redhat-install.{dot,ps,png,html,svg}.
----------------------------------------
142293: tolerable ALL FAIL

flight 142293 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/142293/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-amd 10 redhat-install    fail baseline untested


jobs:
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary



--===============5431900188851872153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5431900188851872153==--
